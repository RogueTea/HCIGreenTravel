from django import forms
from api.models import *
from django.contrib.auth.models import User

class JourneyForm (forms.ModelForm):
    distance = forms.IntegerField(initial=0)
    transport = forms.ModelChoiceField(queryset=Defaults.objects.all(), label= "Transport", required=False)

    class Meta:
        model = Journey
        fields = ("distance", "transport")