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
    transport = TransportName(queryset=Default.objects.all())
        
    class Meta:
        model = Journey
        fields = ('distance','transport')
