from django.urls import path
from django.urls.resolvers import URLPattern
from . import views

app_name='api'
urlpatterns =[
    path('learn/', views.co2Learn, name='learn'),
    path('addJourney/', views.addJourney, name='addJourney'),
]