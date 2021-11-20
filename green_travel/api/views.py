from rest_framework import serializers, status
from api.models import *
from rest_framework.decorators import api_view
from rest_framework.response import Response
from api.serializers import *

# Create your views here.

@api_view(['GET','POST'])
def co2Learn(request):
    if request.method == "GET":
            learn = Default.objects.all()
            serializer = DefaultSerializer (learn, many=True)
    elif request.method == "POST":
            serializer = DefaultSerializer (data=request.data)
            if serializer.is_valid(raise_exception = ValueError):
                serializer.calculate(validated_data=request.data)
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            else:
                return Response({"error": True,"error_msg": serializer.error_messages},status=status.HTTP_400_BAD_REQUEST)
    return Response(serializer.data)

@api_view(['POST'])
def addJourney (request):
    serializer = JourneySerializer (data=request.data)
    if serializer.is_valid(raise_exception = ValueError):
        serializer.create(validated_data=request.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    else:
        return Response({"error": True,"error_msg": serializer.error_messages},status=status.HTTP_400_BAD_REQUEST)
