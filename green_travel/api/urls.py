

from django.urls import path
from . import views
from .views import *

urlpatterns = [
    path('', views.apiOverview, name="api-overview"),
    path('journey-list/', views.JourneyList, name="journey-list"),
    path('journey-detail/<str:pk>/', views.JourneyDetail, name="journey-Detail"),
    path('journey-update/<str:pk>/', views.JourneyUpdate, name="journey-update"),
    path('journey-create/', views.JourneyCreate, name="journey-Create"),
    path('journey-delete/<str:pk>', views.JourneyDelete, name="journey-delete"),
    #path("<str:user>/journeys/", views.JourneyByUser, name="journey-user"),
    path('addUser/', Register.as_view(), name="register"),
    path('login', Login.as_view(), name="login"),
    path('logout', Logout.as_view(), name="logout"),
    path('<int:user_id>/journeys/', JourneyListUser.as_view(), name="JourneyListUser"),

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