from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializers import *
from .models import *
from rest_framework import generics 
from rest_framework.status import HTTP_200_OK, HTTP_400_BAD_REQUEST
from .models import User
from rest_framework import status
from api.models import *
from rest_framework.views import APIView
from rest_framework.response import Response
from django.db.models import Sum
from datetime import date, timedelta

# POST/GET request
#View all users registered and register new user
class Register(generics.ListCreateAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer


#POST request
class Login(generics.GenericAPIView):
    queryset = User.objects.all()
    serializer_class = UserLoginSerializer

    def post(self, request, *args, **kwargs):
        serializer_class = UserLoginSerializer(data=request.data)
        if serializer_class.is_valid(raise_exception=True):
            return Response(serializer_class.data, status=HTTP_200_OK)
        return Response(serializer_class.errors, status=HTTP_400_BAD_REQUEST)


#POST Request
class Logout(generics.GenericAPIView):
    queryset = User.objects.all()
    serializer_class = UserLogoutSerializer

    def post(self, request, *args, **kwargs):
        serializer_class = UserLogoutSerializer(data=request.data)
        if serializer_class.is_valid(raise_exception=True):
            return Response(serializer_class.data, status=HTTP_200_OK)
        return Response(serializer_class.errors, status=HTTP_400_BAD_REQUEST)


# Filter journeys by user 
class JourneyListUser(generics.ListAPIView):
    serializer_class = JourneySerializer

    def get_queryset(self):
        return Journey.objects.filter(user_id=self.kwargs['user_id'])


@api_view(['GET'])
def apiOverview(request):
    api_urls = {
        'List' : '/Journey-list/',
        'Detail View' : '/Journey-detail/<str:pk>/',
        'Create' : '/Journey-create/',
        'Update' : '/Journey-update/<str:pk>/',
        'Delete' : '/Journey-delete/<str:pk>/',
        'Add User' : '/addUser',
        'Login' : '/login',
        'Logout' : '/logout',
        'List journeys by user' :  '<int:user_id>/journeys/',
        'Learn' : 'learn/',
        'Scoreboard' : 'scoreboard/',
        'Weekly Report' : 'weeklyReport/'

    }
    return Response(api_urls)


#Journey views

#GET request for all journeys in db
@api_view(['GET'])
def JourneyList(request):
    Journeys = Journey.objects.all()
    serializer = JourneySerializer(Journeys, many = True)
    
    return Response(serializer.data)

#GET request for Single journey via primary key identifier
@api_view(['GET'])
def JourneyDetail(request, pk):
    Journeys = Journey.objects.get(id=pk)
    serializer = JourneySerializer(Journeys, many = False)
    return Response(serializer.data)


#POST request for updating a single journey via primary key identifier
@api_view(['POST'])
def JourneyUpdate(request, pk):
    Journeys = Journey.objects.get(id = pk)
    serializer = JourneySerializer(instance=Journeys, data=request.data)
    if serializer.is_valid():
        serializer.save()
    return Response(serializer.data)


#POST request create new journey
@api_view(['POST'])
def JourneyCreate(request):
    data = {}

    serializer = JourneySerializer(data=request.data)
    if serializer.is_valid():
        try:
            transport = serializer.data["transport"]
            Tobject = Default.objects.get(pk=transport)
            emissions = Tobject.emissions
            distance = request.data["distance"]

            # adding journey to DB
            journey = Journey.objects.create(
                transport = Tobject,
                distance = distance,
                emitted = distance * emissions
            )

            data['journey'] = Journey.objects.filter(journeyid=journey.journeyid).values()[0]
            return Response(data)
        except:
                return Response({"error": True,"error_msg": serializer.error_messages},status=status.HTTP_400_BAD_REQUEST)  

    return Response(serializer.data)

#DELETE request for a single journey
@api_view(['DELETE'])
def JourneyDelete(request, pk):
    journeys = Journey.objects.get(journey_id = pk)
    journeys.delete()
    return Response("Journey deleted successfully.")


# Create your views here.

class co2Learn(APIView):
    # for graph to show average co2 emission of transports
    def get(self, request):
        data={}
        
        learn = Default.objects.all()
        serializer = DefaultSerializer (learn, many=True)
        data['serializer'] = serializer.data
        return Response(data)
    
    # user input for interactive learning
    def put(self,request):
        data = {}
        average =[]
        serializer = EmissionSerializer(data=request.data)
        if serializer.is_valid(raise_exception = ValueError):
            try:
                inputT = serializer.data["transport"]
                transports = Default.objects.all()
                distance = request.data["distance"]
                for trans in transports:
                    avg = {}
                    emissions = trans.emissions
                    emitted = distance * emissions
                    avg["transport"] = trans.transport
                    avg["emitted"] = emitted
                    average.append(avg)
                emissions = Default.objects.get(pk=inputT).emissions

                # user input values
                data["input"] = [inputT, distance]
                data["average"] = average
                return Response(data)
            except:
                return Response({"error": True,"error_msg": serializer.error_messages},status=status.HTTP_400_BAD_REQUEST)      


class scoreboard(APIView):
    # get the users and each user's total amount of emissions
    def get(self,request):
        data ={}

        sort={}
        journeys = Journey.objects.values('user_id').distinct()
        
        for u in journeys:  
            user = User.objects.get(id=u['user_id']) 
            emit = Journey.objects.filter(user_id=u['user_id']).aggregate(Sum('emitted'))
            data[user.username] = emit
        for d in sorted(data.items(), key=lambda x: x[1]['emitted__sum']):
            sort[d[0]]= d[1]

        return Response(sort)


class weeklyReport(APIView):
    # get the journey information for a user in the current week
    def get(self, request):
        data ={}
        today = date.today()
        week_dates = []
        
        for d in range(7):
            # list of dates in the current week
            week_dates.append(today + timedelta(days=d))

        # get the queryset of journey dates and convert to a list
        days = list(Journey.objects.values('date'))
        
        
        listOfDays = [d['date'] for d in days]
        for i in listOfDays:
            if i in week_dates:
                reports = Journey.objects.filter(user_id=User.objects.get(pk=1))
                serializer = ReportSerializer(reports, many=True)
                data['serializer'] = serializer.data
            return Response(data)