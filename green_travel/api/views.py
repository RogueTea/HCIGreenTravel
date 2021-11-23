from rest_framework import serializers, status
from api.models import *
from rest_framework.decorators import api_view
from rest_framework.views import APIView
from rest_framework.response import Response
from api.serializers import *
from django.http import JsonResponse

# Create your views here.

class co2Learn(APIView):
    # for graph to show average co2 emission of transports
    def get(self, request):
        learn = Default.objects.all()
        serializer = DefaultSerializer (learn, many=True)
        return Response(serializer.data)
    
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
                avg.append(transport)
                avg.append(emitted)
                data['serializer'] = serializer.data
                data['avg'] = avg
                return Response(data)
            except:
                return Response({"error": True,"error_msg": serializer.error_messages},status=status.HTTP_400_BAD_REQUEST)       

class addJourney(APIView):
    def post(self,request):
        data = {}
        serializer = JourneySerializer(data=request.data)
        if serializer.is_valid(raise_exception = ValueError):
            print("yeee")
            try:
                transport = serializer.data["transport"]
                Tobject = Default.objects.get(pk=transport)
                emissions = Tobject.emissions
                distance = request.data["distance"]

                journey = Journey.objects.create(
                    transport = Tobject,
                    distance = distance,
                    emitted = distance * emissions
                )
                data['journey'] = Journey.objects.filter(journeyid=journey.journeyid).values()[0]
                print(data)
                return Response(data)
            except:
                return Response({"error": True,"error_msg": serializer.error_messages},status=status.HTTP_400_BAD_REQUEST)       
