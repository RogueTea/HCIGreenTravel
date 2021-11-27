from django.contrib import admin

# Register your models here.

from .models import *

admin.site.register(Journey)

"""
admin.site.register(Journey)
admin.site.register(Default)
admin.site.register(UserProfile)
"""
