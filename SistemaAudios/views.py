from django.shortcuts import render, HttpResponse
from django.http import JsonResponse
from django.db import connection
from django.shortcuts import redirect
from django.contrib import messages

from django.contrib.auth import authenticate
from django.contrib.auth import login as do_login
from django.contrib.auth import logout as do_logout
#email
from django.core.mail import send_mail
from django.conf import settings


from .forms import UserRegisterForm  
from .models import Categoria, Recurso, Lista, DetalleLista, User

from django.core.exceptions import ObjectDoesNotExist

import random

# Create your views here.

def home(request):

    return render(request, "SistemaAudios/index.html")

def register(request):

    if request.user.is_authenticated:
        return redirect('/')
    else :
        if request.method == "POST":
            form = UserRegisterForm(request.POST)
            if form.is_valid():
                form.save()
                return redirect('/')
        else :
            form = UserRegisterForm()

    return render(request, "SistemaAudios/register.html", {'form': form})

def login(request):

    if request.user.is_authenticated:
        return redirect('/')
    else :
        if request.method == "POST":
            username=request.POST['user']
            contraseña=request.POST['pass']

            user = authenticate(username=username, password=contraseña)

            if user is not None:
                do_login(request, user)

                #Obtiene las listas y las crea en caso de no estar creadas
                listas = Lista.objects.filter(usuario=user)
                if listas:
                    return redirect('../')
                else :
                    listaFav = Lista(descripcion='Lista de Favoritos', tipo=0, usuario=user)
                    listaVerDespues = Lista(descripcion='Lista de Escuchar Mas Tarde', tipo=1, usuario=user)
                    listaFav.save()
                    listaVerDespues.save()
                    return redirect('../')
                
            else :
                messages.error(request, "Usuario no encontrado")
                return redirect('../login')

    return render(request, "SistemaAudios/login.html")

def logout(request): 
    if request.user.is_authenticated:
        do_logout(request)
    return redirect('/')

def recuperar(request):
    if request.user.is_authenticated:
        return redirect('/')
    else : 
        if request.method == "POST":
            email=request.POST['email']
            usuario = User.objects.filter(email=email)
            if usuario:
                
                codigo = ""
                for i in range(20):
                    codigo = codigo + random.choice(["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R","S", "T", "U","V", "W", "X","Y", "Z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0",])

                usuario = User.objects.get(email=email)
                usuario.codigoSeguridad = codigo
                usuario.save()
                
                subject="Recuperación de contraseña"
                HOSTNAME = request.META['HTTP_HOST']
                message="Su clave de seguridad es: " + codigo + " debe copiar y pegar el la siguiente dirección para modificarla: http://" + HOSTNAME + "/cambiar-contra/" + codigo
                email_from=settings.EMAIL_HOST_USER
                recipient_list=[email]
                send_mail(subject, message, email_from, recipient_list)

                messages.success(request, "Correo enviado correctamente")
                return redirect('../')
            else :
                messages.error(request, "Usuario no encontrado")

    return render(request, "SistemaAudios/recuperar.html")

def cambiar_contra(request, clave):
    if clave is not None:
        try: 
            usuario = User.objects.get(codigoSeguridad=clave)
        except ObjectDoesNotExist:  
            usuario = None
            print("usuario no encontrado")
        if usuario:
            if request.method == "POST":
                pass1 = request.POST['pass1']
                print(pass1)
                pass2 = request.POST['pass2']
                print(pass2)
                if pass1 == pass2:
                    usuario.set_password(pass1)
                    usuario.codigoSeguridad = ""
                    usuario.save()
                    messages.success(request, "Contraseña actualizada")

                    return redirect('../login')
                else :
                    #no coiniciden
                    return redirect('../cambiar-contra')
        else :
            #no existe
            return redirect('../')
    else:
        #id no escrito
        return redirect('../')
    return render(request, "SistemaAudios/cambiar-contraseña.html")