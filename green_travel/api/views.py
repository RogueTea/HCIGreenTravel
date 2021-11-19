from django.shortcuts import render
from green_travel.api.forms import JourneyForm
from api.models import *

# Create your views here.

def addJourney (request):
    form = JourneyForm()

    if request.method == 'POST':
        form = JourneyForm(request.POST)
        if form.is_valid():
            form.save(commit=False)
            transport = form.cleaned_data.get('transport')
            distance = form.cleaned_data.get('transport')
            form.transport = transport
            form.distance = distance
            
            co2Val = Defaults.objects.get(pk=transport)
            emitted = co2Val.emissions * distance
            return render(request)

    return render(request)