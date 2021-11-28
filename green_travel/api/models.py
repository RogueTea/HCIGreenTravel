from django.db import models
from django.contrib.auth.models import User

# Create your models here.
# 

class Default(models.Model):
    transport = models.CharField(max_length=10, primary_key=True)
    emissions = models.IntegerField(default =0)

    def __str__(self):
        return self.transport


class Journey(models.Model):
    title = models.CharField(max_length=200)
    distance = models.IntegerField(default =0)
    emitted = models.IntegerField(default =0, null=True)
    transport = models.ForeignKey(Default,on_delete=models.CASCADE, default = "Car")
    admin = models.ForeignKey(User, null=True, on_delete=models.CASCADE)
    objects = models.Manager()
    def __str__(self):
        return self.title

"""
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
    admin = models.ForeignKey(User,null=True, on_delete=models.CASCADE)

    

    def __str__(self):
        return str(self.journeyid)

class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    journey = models.ForeignKey(Journey, default=None, null=True, on_delete=models.CASCADE)

    def __str__(self):
        return self.user.username

class Scoreboard(models.Model):
    journeyid = models.ForeignKey(Journey, on_delete=models.CASCADE)
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
"""



