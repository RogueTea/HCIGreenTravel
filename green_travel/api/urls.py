

from django.urls import path
from . import views
urlpatterns = [
    path('', views.apiOverview, name="api-overview"),
  ]


"""
from django.urls import path
from django.urls.resolvers import URLPattern

from rest_framework.routers import DefaultRouter

from .views import *

app_name='api'

urlpatterns =[
    path('learn/', co2Learn.as_view(), name='learn'),
    path('addJourney/', addJourney.as_view(), name='addJourney'),

]"""