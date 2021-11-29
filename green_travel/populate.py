import os

os.environ.setdefault('DJANGO_SETTINGS_MODULE',
                      'green_travel.settings')

import django


django.setup()
from api.models import *

# Clean DataBase
def clean():
    Default.objects.all().delete()
    Journey.objects.all().delete()
    User.objects.all().delete()
    #Scoreboard.objects.all().delete()

def addTrans(transport):
    transport = Default.objects.get_or_create(transport=transport["method"], emissions = transport["co2"])

def addUser(u):
    user = User.objects.get_or_create(username=u["username"], email=u["email"], password=u["password"])

def addJourn(j):
    journey = Journey.objects.get_or_create(distance=j["distance"], 
    transport=Default.objects.get(transport=j["transport"]),emitted =j["emitted"],user_id=User.objects.get(pk=j["user_id"]), date = j['date']) 


def populate():
    # data from https://ourworldindata.org/travel-carbon-footprint
    transport = [
    {'method': 'Car (Petrol)', 'co2': 192},
    {'method': 'Car (Diesel)', 'co2': 171},
    {'method': 'Bus', 'co2': 105},
    {'method': 'Motorcycle', 'co2': 103},
    {'method': 'Car (Electric)', 'co2': 53},
    {'method': 'Train', 'co2': 41},
    {'method': 'walk', 'co2': 0 },
    {'method': 'cycle', 'co2': 0},
    ]

    user = [
        {'username': 'Katie123','email': 'katie123@gmail.com', 'password': 'Testing1'},
        {'username': 'Ben123','email': 'ben123@gmail.com', 'password': 'Testing1'},
        {'username': 'John123','email': 'john123@gmail.com', 'password': 'Testing1'},
        {'username': 'Sam123','email': 'sam123@gmail.com', 'password': 'Testing1'},
        {'username': 'Bob123','email': 'bob123@gmail.com', 'password': 'Testing1'},
    ]

    journey =[
    {'distance': 100, 'transport': 'Train', 'emitted': 4100, 'user_id': 1, 'date': '2021-11-28'},
    {'distance': 15, 'transport': 'walk', 'emitted': 0, 'user_id': 2, 'date': '2021-11-29'},
    {'distance': 50, 'transport': 'Bus', 'emitted': 5250, 'user_id': 3, 'date': '2021-11-29'},
    {'distance': 80, 'transport': 'Car (Petrol)', 'emitted': 15360, 'user_id': 1, 'date': '2021-11-23'},
    {'distance': 60, 'transport': 'Car (Petrol)', 'emitted': 11520, 'user_id': 1, 'date': '2021-11-23'},
    {'distance': 30, 'transport': 'Train', 'emitted': 1230, 'user_id': 1, 'date': '2021-11-25'},
    {'distance': 80, 'transport': 'Train', 'emitted': 3280, 'user_id': 1, 'date': '2021-11-26'}
    ]

    print("Populating defaults")

    for trans in transport:
        addTrans(trans)
        print("transport", trans["method"])
    
    for u in user:
        addUser(u)
        print("user:", u['username'])

    users = User.objects.all()
    for u in users:
        print(u)

    for j in journey:
        addJourn(j)
        print("journey:", j)

if __name__=='__main__':
    print('\nPopulating green_travel database...\n')
    clean()
    populate()
    print('\n---Finished---')