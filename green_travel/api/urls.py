from django.urls import path
from django.urls.resolvers import URLPattern

from rest_framework.routers import DefaultRouter

from .views import *

app_name='api'
urlpatterns =[
    path('learn/', co2Learn.as_view(), name='learn'),
    path('addJourney/', addJourney.as_view(), name='addJourney'),
    path("all-profiles/",UserProfileListCreateView.as_view(),name="all-profiles"),
    path("profile/<int:pk>",userProfileDetailView.as_view(),name="profile"),
]