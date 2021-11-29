from django.db import models


# Create your models here.
# 
class User(models.Model):
    username = models.CharField(max_length=255, null=False)
    email = models.EmailField(max_length=255, null=False)
    password = models.CharField(max_length=255)
    logged = models.BooleanField(default=False)
    token = models.CharField(max_length=500, null=True, default="")
    

    def __str__(self):
        return "{} - {}".format(self.email , self.token)


class Default(models.Model):
    transport = models.CharField(max_length=10, primary_key=True)
    emissions = models.IntegerField(default =0)

    def __str__(self):
        return self.transport


class Journey(models.Model):
    journey_id =  models.AutoField(primary_key=True)
    distance = models.IntegerField(default =0)
    emitted = models.IntegerField(default =0, null=True)
    transport = models.ForeignKey(Default,on_delete=models.CASCADE, default = "Car")
    user_id = models.ForeignKey(User, null=True, on_delete=models.CASCADE)
    def __str__(self):
        return self.title


"""
class Scoreboard(models.Model):
    journeyid = models.ForeignKey(Journey, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
"""


