import importlib

from django.conf import settings
from django.http import HttpResponseRedirect
from django.urls import (
    path,
    reverse_lazy,
)

from bloob import views

app_name = 'bloob'

urlpatterns = [
    path('', lambda x: HttpResponseRedirect(reverse_lazy('health_check_home'))),
    path('test/', views.Test.as_view()),
]
