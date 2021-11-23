from rest_framework import serializers, status
from api.models import *
from rest_framework.decorators import api_view
from rest_framework.views import APIView
from rest_framework.response import Response
from api.serializers import *

# Create your views here.

# @api_view(['POST'])
# def addJourney (request):
#     serializer = JourneySerializer (data=request.data)
#     if serializer.is_valid(raise_exception = ValueError):
#         serializer.create(validated_data=request.data)
#         return Response(serializer.data, status=status.HTTP_201_CREATED)
#     else:
#         return Response({"error": True,"error_msg": serializer.error_messages},status=status.HTTP_400_BAD_REQUEST)

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