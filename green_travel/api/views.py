from rest_framework.decorators import api_view
from django.shortcuts import render, redirect
from .forms import RegisterForm
from rest_framework.response import Response
from rest_framework.views import APIView
from .serializers import JourneySerializer
from .models import *
from rest_framework.filters import (SearchFilter, OrderingFilter)


@api_view(['GET'])
def apiOverview(request):
    api_urls = {
        'List' : '/Journey-list/',
        'Detail View' : '/Journey-detail/<str:pk>/',
        'Create' : '/Journey-create/',
        'Update' : '/Journey-update/<str:pk>/',
        'Delete' : '/Journey-delete/<str:pk>/',
    }
    return Response(api_urls)


#Journey 
@api_view(['GET'])
def JourneyList(request):
    Journeys = Journey.objects.all()
    serializer = JourneySerializer(Journeys, many = True)
    
    return Response(serializer.data)


@api_view(['GET'])
def JourneyDetail(request, pk):
    Journeys = Journey.objects.get(id=pk)
    serializer = JourneySerializer(Journeys, many = False)
    return Response(serializer.data)

@api_view(['GET'])
def JourneyByUser(request,User):
    Journeys = Journey.objects.filter(admin=User)
    serializer = JourneySerializer(Journeys, many = True)
    return Response(serializer.data)


@api_view(['POST'])
def JourneyUpdate(request, pk):
    Journeys = Journey.objects.get(id = pk)
    serializer = JourneySerializer(instance=Journeys, data=request.data)
    if serializer.is_valid():
        serializer.save()
    return Response(serializer.data)

@api_view(['POST'])
def JourneyCreate(request):
    serializer = JourneySerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
    return Response(serializer.data)

@api_view(['DELETE'])
def JourneyDelete(request, pk):
    journeys = Journey.objects.get(id = pk)
    journeys.delete()
    return Response("Journey deleted successfully.")


# Register
def register(response):
    if response.method == "POST":
        form = RegisterForm(response.POST)
        if form.is_valid():
            form.save()
        return redirect("")
    else:
        form = RegisterForm()

    return render(response) 


"""
from rest_framework import status
from api.models import *
from rest_framework.views import APIView
from rest_framework.response import Response
from api.serializers import *
from rest_framework.permissions import IsAuthenticated

from rest_framework.generics import (ListCreateAPIView,RetrieveUpdateDestroyAPIView,)
from rest_framework.permissions import IsAuthenticated
from .models import UserProfile
from .serializers import UserProfileSerializer


class UserProfileListCreateView(ListCreateAPIView):
    queryset=UserProfile.objects.all()
    serializer_class=UserProfileSerializer
    permission_classes=[IsAuthenticated]

    def perform_create(self, serializer):
        user=self.request.user
        serializer.save(user=user)




# Create your views here.

class co2Learn(APIView):
    # for graph to show average co2 emission of transports
    def get(self, request):
        data={}
        
        learn = Default.objects.all()
        serializer = DefaultSerializer (learn, many=True)
        data['serializer'] = serializer.data
        return Response(data)
    
    # user input for interactive learning
    def put(self,request):
        data = {}
        average =[]
        serializer = EmissionSerializer(data=request.data)
        if serializer.is_valid(raise_exception = ValueError):
            try:
                inputT = serializer.data["transport"]
                transports = Default.objects.all()
                distance = request.data["distance"]
                for trans in transports:
                    avg = {}
                    emissions = trans.emissions
                    emitted = distance * emissions
                    avg["transport"] = trans.transport
                    avg["emitted"] = emitted
                    average.append(avg)
                emissions = Default.objects.get(pk=inputT).emissions

                # user input values
                data["input"] = [inputT, distance]
                data["average"] = average
                return Response(data)
            except:
                return Response({"error": True,"error_msg": serializer.error_messages},status=status.HTTP_400_BAD_REQUEST)       

class addJourney(APIView):
    def post(self,request):
        data = {}
        serializer = JourneySerializer(data=request.data)
        if serializer.is_valid(raise_exception = ValueError):
            try:
                transport = serializer.data["transport"]
                Tobject = Default.objects.get(pk=transport)
                emissions = Tobject.emissions
                distance = request.data["distance"]

                # adding journey to DB
                journey = Journey.objects.create(
                    transport = Tobject,
                    distance = distance,
                    emitted = distance * emissions
                )

                data['journey'] = Journey.objects.filter(journeyid=journey.journeyid).values()[0]
                return Response(data)
            except:
                return Response({"error": True,"error_msg": serializer.error_messages},status=status.HTTP_400_BAD_REQUEST)       
"""