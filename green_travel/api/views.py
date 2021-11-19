from django.shortcuts import render
from rest_framework.decorators import permission_classes
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import serializers, status
from rest_framework.permissions import IsAdminUser
from django.contrib.auth.models import User
from .serializers import UserSerializer


class UserRecordView(APIView):
    permission_classes = [IsAdminUser]

    def get(self, format=None):
        users = User.objects.all()
        serializers = UserSerializer(users, many = True)
        return Response(serializers.data)

    def post(self, request):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid(raise_exception = ValueError):
            serializer.create(validated_data=request.data)
            return Response(serializer.data, status=status.HTTP_201_CREATED)

        return Response({
            "error": True,
            "error_msg": serializer.error_messages
        },
        status=status.HTTP_400_BAD_REQUEST
        )
