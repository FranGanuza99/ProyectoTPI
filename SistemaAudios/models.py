from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.

class User(AbstractUser):
    codigoSeguridad = models.CharField(max_length=20, null = True, blank=True)

class Categoria(models.Model):
    idCategoria = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=16)
    descripcion = models.CharField(max_length=50)

    def __str__(self):
        return self.nombre

class Recurso(models.Model):
    idRecurso = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=16)
    descripcion = models.CharField(max_length=56)
    archivo = models.FileField(upload_to='audios/')
    categoria = models.ForeignKey(Categoria, null = True, blank = True, on_delete=models.CASCADE)
    usuario = models.ForeignKey(User, null = True, blank = True, on_delete=models.CASCADE)
    
    def __str__(self):
        return self.nombre

class Lista(models.Model):
    idLista = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=56)
    tipo = models.BooleanField()
    usuario = models.ForeignKey(User, null = True, blank = True, on_delete=models.CASCADE)

class DetalleLista(models.Model):
    idDetalle = models.AutoField(primary_key=True)
    lista = models.ForeignKey(Lista, null = True, blank = True, on_delete=models.CASCADE)
    recurso = models.ForeignKey(Recurso, null = True, blank = True, on_delete=models.CASCADE)
