from django.contrib.auth.models import AbstractUser
from django.db import models


class CustomUser(AbstractUser):
    first_name = models.CharField(max_length=30, verbose_name='Nombre')
    last_name = models.CharField(max_length=30, verbose_name='Apellido')
    email = models.EmailField(unique=True, verbose_name='Correo Electrónico')
    
    def __str__(self):
        return f"{self.first_name} {self.last_name}"
