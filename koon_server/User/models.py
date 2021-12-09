from django.db import models

# Create your models here.
class User(models.Model):
    userID = models.CharField(max_length=20)
    pwd = models.CharField(max_length=20)
    name = models.CharField(max_length=10)
    nickname = models.CharField(max_length=12)
    email = models.CharField(max_length=30)
    point = models.IntegerField(default=0)
    level = models.IntegerField(default=0)
    birth = models.DateField(auto_now=False)

    def __str__(self):
        return self.nickname

