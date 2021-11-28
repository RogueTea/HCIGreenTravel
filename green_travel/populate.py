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

def populate():
    # data from https://ourworldindata.org/travel-carbon-footprint
    transport = [
    {'method': 'Car (Petrol)', 'co2': 192},
    {'method': 'Car (Diesel)', 'co2': 171},
    {'method': 'Bus', 'co2': 105},
    {'method': 'Motorcycle', 'co2': 103},
    {'method': 'Car (Electric)', 'co2': 53},
    {'method': 'Train', 'co2': 41},
    ]


    print("Populating defaults")

    for trans in transport:
        addTrans(trans)
        print("transport", trans["method"])
    

if __name__=='__main__':
    print('\nPopulating green_travel database...\n')
    clean()
    populate()
    print('\n---Finished---')