from rest_framework import serializers, status
from api.models import *
from rest_framework.decorators import api_view
from rest_framework.views import APIView
from rest_framework.response import Response
from api.serializers import *
from django.http import JsonResponse

from rest_framework.generics import (ListCreateAPIView,RetrieveUpdateDestroyAPIView,)
from rest_framework.permissions import IsAuthenticated
from .models import UserProfile
from .serializers import UserProfileSerializer
from .permission import IsOwnerProfileOrReadOnly

class UserProfileListCreateView(ListCreateAPIView):
    queryset=UserProfile.objects.all()
    serializer_class=UserProfileSerializer
    permission_classes=[IsAuthenticated]

    def perform_create(self, serializer):
        user=self.request.user
        serializer.save(user=user)


class userProfileDetailView(RetrieveUpdateDestroyAPIView):
    queryset=UserProfile.objects.all()
    serializer_class=UserProfileSerializer
    permission_classes=[IsOwnerProfileOrReadOnly,IsAuthenticated]


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
        avg =[]
        serializer = EmissionSerializer(data=request.data)
        if serializer.is_valid(raise_exception = ValueError):
            try:
                transport = serializer.data["transport"]
                emissions = Default.objects.get(pk=transport).emissions
                distance = request.data["distance"]
                emitted = distance * emissions

                # user input values
                avg.append(transport)
                avg.append(emitted)
                defaults = Default.objects.all()
                s = DefaultSerializer (defaults, many=True)
                data['serializer'] = s.data
                data['avg'] = avg
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
