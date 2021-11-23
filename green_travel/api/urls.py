from django.urls import path
from django.urls.resolvers import URLPattern
from .views import *

app_name='api'
urlpatterns =[
    path('learn/', co2Learn.as_view(), name='learn'),
    #path('addJourney/', views.addJourney, name='addJourney'),
]