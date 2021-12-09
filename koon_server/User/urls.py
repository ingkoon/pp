from django.urls import path
from .views import UserAPI, UserListAPI 

urlpatterns = [    
    path('User/UserList', UserListAPI.as_view()),
    path('User/', UserAPI.as_view()),
    path('User/<str:nickname>', UserAPI.as_view()),
]
