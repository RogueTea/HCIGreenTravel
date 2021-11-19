from django.db import models
from django.contrib.auth.models import User
import uuid

# Create your models here.

class Defaults(models.Model):
    transport = models.CharField(max_length=10, primary_key=True)
    emissions = models.IntegerField(default =0)

    def __str__(self):
        return self.transport

class Journey(models.Model):
    date = models.DateField((u"Conversation Date"), blank=True)
    time = models.TimeField((u"Conversation Time"), blank=True)
    journeyid =  models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    distance = models.IntegerField(default =0)
    emitted = models.IntegerField(default =0)
    transport = models.ForeignKey(Defaults,n_delete=models.CASCADE, default = "Car")

    def __str__(self):
        return self.journeyid

class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    journey = models.ForeignKey(Journey, on_delete=models.CASCADE)

    def __str__(self):
        return self.user.username

class Scoreboard(models.Model):
    journeyid = models.ForeignKey(Journey, on_delete=models.CASCADE)
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)

