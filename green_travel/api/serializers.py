from rest_framework.serializers import ModelSerializer
from .models import *

class DefaultSerializer(ModelSerializer):
    class Meta:
        model = Default
        fields = '__all__'

class JourneySerializer(ModelSerializer):
    def create(self,validated_data):
        data = validated_data
        transport = Default.objects.get(pk=data['transport'])
        distance = data['distance']

        journey = Journey.objects.create(
            transport = transport,
            distance = distance,
            emitted = transport.emissions * distance
        )  
        return journey
        
    class Meta:
        model = Journey
        fields = ('distance','transport')
