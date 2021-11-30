from rest_framework import serializers
from rest_framework.serializers import ModelSerializer, PrimaryKeyRelatedField
from .models import *
from django.db.models import Q 
from rest_framework.validators import UniqueValidator
from django.core.exceptions import ValidationError
from uuid import uuid4 #for unique token 



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
        )


class UserLoginSerializer(serializers.ModelSerializer):
    email = serializers.CharField()
    password = serializers.CharField()
    token = serializers.CharField(required=False, read_only=True)
    username = serializers.CharField(required=False, read_only=True)



    def validate(self, data):
        email = data.get("email", None)
        password = data.get("password", None)

        #error if email and password are not correct 
        if not email and not password:
            raise ValidationError("Details not entered.")
        user = None
        user = User.objects.filter(Q(email=email) & Q(password=password)).distinct()

        # error if user has not input email correctly 
        if not user.exists():
            raise ValidationError("User credentials are not correct.")
        user = User.objects.get(email=email)

        #User is already logged in
        if user.logged:
            raise ValidationError("User logged in.")
        user.logged = True 
        data['token'] = uuid4() # set unique token 
        user.token = data['token']
        user.save()
        data['username'] = user.username 
        return data

    class Meta:
        model = User
        fields = (
                        'username',
            'email',
            'password',
            'token',
        )


        read_only_fields = (
            'token',
            'username',
        )


# to log out users token needs to be inputted
class UserLogoutSerializer(serializers.ModelSerializer):
    token = serializers.CharField()
    status = serializers.CharField(required=False, read_only=True)

    # check if token is valid and user is logged in
    def validate(self, data):
        token = data.get("token", None)
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
        fields = ('distance','transport', 'emitted', 'user_id','date')


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

class ReportSerializer(ModelSerializer):
    class Meta:
        model = Journey
        fields = ('user_id','distance', 'transport', 'emitted')