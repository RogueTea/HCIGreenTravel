from rest_framework.fields import ChoiceField
from rest_framework import serializers
from rest_framework.serializers import ModelSerializer, PrimaryKeyRelatedField
from .models import *
from django.db.models import Q # for queries
from rest_framework import serializers
from rest_framework.validators import UniqueValidator
from .models import User
from django.core.exceptions import ValidationError
from uuid import uuid4 #for token 


class UserSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(
        required=True,
        validators=[UniqueValidator(queryset=User.objects.all())]
        )
    username = serializers.CharField(
        required=True,
        validators=[UniqueValidator(queryset=User.objects.all())]
        )
    password = serializers.CharField(max_length=8)

    class Meta:
        model = User
        fields = (
            'username',
            'email',
            'password',
            'userid',
        )


class UserLoginSerializer(serializers.ModelSerializer):
    email = serializers.CharField()
    password = serializers.CharField()
    token = serializers.CharField(required=False, read_only=True)



    def validate(self, data):
        email = data.get("email", None)
        password = data.get("password", None)
        if not email and not password:
            raise ValidationError("Details not entered.")
        user = None
        user = User.objects.filter(Q(email=email) & Q(password=password)).distinct()
        if not user.exists():
            raise ValidationError("User credentials are not correct.")
        user = User.objects.get(email=email)
        if user.logged:
            raise ValidationError("User logged in.")
        user.logged = True
        data['token'] = uuid4()
        user.token = data['token']
        user.save()
        return data

    class Meta:
        model = User
        fields = (
            'email',
            'password',
            'token',
        )

        read_only_fields = (
            'token',
        )


class UserLogoutSerializer(serializers.ModelSerializer):
    token = serializers.CharField()
    status = serializers.CharField(required=False, read_only=True)

    def validate(self, data):
        token = data.get("token", None)
        print(token)
        user = None
        try:
            user = User.objects.get(token=token)
            if not user.logged:
                raise ValidationError("User is not logged in.")
        except Exception as e:
            raise ValidationError(str(e))
        user.logged = False
        user.token = ""
        user.save()
        data['status'] = "User is logged out."
        return data

    class Meta:
        model = User
        fields = (
            'token',
            'status',
        )



class JourneySerializer(serializers.ModelSerializer):
    class Meta:
        model = Journey
        fields = ('title', 'distance','transport', 'admin')


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


"""
class UserProfileSerializer(serializers.ModelSerializer):
    user=serializers.StringRelatedField(read_only=True)
    class Meta:
        model= UserProfile
        fields='__all__'


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
"""