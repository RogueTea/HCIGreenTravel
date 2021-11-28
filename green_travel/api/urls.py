

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
    path('addUser/', Register.as_view(), name="register"),
    path('login', Login.as_view(), name="login"),
    path('logout', Logout.as_view(), name="logout"),
    path('learn/', co2Learn.as_view(), name='learn'),
    path('<int:user_id>/journeys/', JourneyListUser.as_view(), name="JourneyListUser"),

  ]

