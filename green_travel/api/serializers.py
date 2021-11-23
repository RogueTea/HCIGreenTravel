from rest_framework.fields import ChoiceField
from rest_framework.serializers import ModelSerializer, PrimaryKeyRelatedField
from .models import *

class TransportName(PrimaryKeyRelatedField): 
    def display_value(self, instance):
        return instance.name

class DefaultSerializer(ModelSerializer):
    class Meta:
        model = Default
        fields = '__all__'

class EmissionSerializer(ModelSerializer):
    transport = TransportName(queryset=Default.objects.all())

    class Meta:
        model = Default
        fields = '__all__'

class JourneySerializer(ModelSerializer):

    def create(self,validated_data):
        data = validated_data
        transport = Default.objects.get(pk=data['transport'])
        #emissions = Default.objects.get(pk=transport)
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
