from types import ClassMethodDescriptorType
from django.db import models
from django.contrib.auth.models import User
from rest_framework import serializers
from rest_framework import validators
from rest_framework.validators import UniqueTogetherValidator
from rest_framework.fields import ChoiceField
from rest_framework.serializers import ModelSerializer, PrimaryKeyRelatedField
from .models import *

class UserSerializer(serializers.ModelSerializer):

    def create(self, validated_data):
        user = User.objects.create_user(**validated_data)
        return user

    class Meta:
        model = User
        fields = (
            'username',
            'first_name',
            'last_name',
            'email',
            'password',
        )

        validators = [
            UniqueTogetherValidator(
                queryset= User.objects.all(),
                fields=['username', 'email']
            )
        ]

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
