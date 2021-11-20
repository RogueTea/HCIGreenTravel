from rest_framework import serializers, status
from api.forms import JourneyForm
from api.models import *
from rest_framework.decorators import api_view
from rest_framework.response import Response
from api.serializers import *

# Create your views here.

@api_view(['GET'])
def co2Learn(request):
    learn = Default.objects.all()
    serializer = DefaultSerializer (learn, many=True)
    return Response(serializer.data)

@api_view(['POST'])
def addJourney (request):
    serializer = JourneySerializer (data=request.data)
    if serializer.is_valid(raise_exception = ValueError):
        serializer.create(validated_data=request.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    else:
        return Response({"error": True,"error_msg": serializer.error_messages},status=status.HTTP_400_BAD_REQUEST)
