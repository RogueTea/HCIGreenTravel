from django.db import models
from django.contrib.auth.models import User
from django.contrib.auth.models import AbstractUser
import uuid

# Create your models here.
class Default(models.Model):
    transport = models.CharField(max_length=10, primary_key=True)
    emissions = models.IntegerField(default =0)

    def __str__(self):
        return self.transport 

class Journey(models.Model):
    date = models.DateTimeField(auto_now=True, blank=True)
    journeyid =  models.AutoField(primary_key=True)
    distance = models.IntegerField(default =0)
    emitted = models.IntegerField(default =0, null=True)
    transport = models.ForeignKey(Default,on_delete=models.CASCADE, default = "Car")

    def __str__(self):
        return str(self.journeyid)

class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    journey = models.ForeignKey(Journey, on_delete=models.CASCADE)

    def __str__(self):
        return self.user.username

""" class Scoreboard(models.Model):
    journeyid = models.ForeignKey(Journey, on_delete=models.CASCADE)
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
 """

class CustomUser(AbstractUser):
    EMAIL_FIELD = 'email'
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username']
    username= models.CharField(blank=True, max_length=254,)
    email = models.EmailField(blank=False, max_length=254, unique=True, verbose_name="email address")