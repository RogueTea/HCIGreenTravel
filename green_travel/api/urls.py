from django.urls import path
from django.urls.resolvers import URLPattern
from .views import UserRecordView
from .views import *

app_name='api'
urlpatterns =[
    path('user/', UserRecordView.as_view(), name='users'),
    path('learn/', co2Learn.as_view(), name='learn'),
    path('addJourney/', addJourney.as_view(), name='addJourney'),
]