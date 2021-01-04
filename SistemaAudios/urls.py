"""ProyectoTPI URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import path

from SistemaAudios import views
from django.conf.urls import url
from SistemaAudios.ajax import add_fav, add_sl, del_fav, del_sl, fav, sl, remove, busquedaFiltro

urlpatterns = [
    path('', views.home, name="Home"),
    path('registro', views.register, name="register"),
    path('login', views.login, name="login"),
    path('logout/', views.logout, name="logout"),
    path('recuperar', views.recuperar, name="recuperar"),
    path('cambiar-contra/<clave>', views.cambiar_contra, name="cambiar_contra"),
    path('mis_recursos/', views.UserRecursoListView, name='mis_recursos' ),
    path('<int:pk>/actualizar', views.RecursoUpdateView.as_view(), name='actualizar'),
    path('<pk>/delete/', views.RecursoDeleteView.as_view(), name='eliminar'),
    path('crear/', views.RecursoCreateView.as_view(), name='crear'),
    url(r'ajax/add_fav', add_fav, name='add_fav'),
    url(r'ajax/add_sl', add_sl, name='add_sl'),
    url(r'ajax/del_fav', del_fav, name='del_fav'),
    url(r'ajax/del_sl', del_sl, name='del_sl'),
    url(r'ajax/fav', fav, name='fav'),
    url(r'ajax/sl', sl, name='sl'),
    path('ver_lista/<int:tipo>', views.ver_lista, name="ver_lista"),
    url(r'ajax/remove', remove, name='remove'),
    path('busqueda/', views.busqueda, name="busqueda"),
    url(r'ajax/busquedaFiltro', busquedaFiltro, name='busquedaFiltro')
]
