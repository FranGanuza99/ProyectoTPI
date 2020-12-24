from django.forms import ModelForm
from .models import User
from django.contrib.auth.forms import UserCreationForm  
from django import forms

#from .models import Persona

class UserRegisterForm(UserCreationForm):

    email = forms.EmailField(widget=forms.TextInput(attrs={'class':'form-control'}))
    password1 = forms.CharField(label='Contraseña', widget=forms.PasswordInput(attrs={'class':'form-control'}))
    password2 = forms.CharField(label='Confirmar contraseña', widget=forms.PasswordInput(attrs={'class':'form-control'}))
    first_name = forms.CharField(label='Nombre', widget=forms.TextInput(attrs={'class':'form-control','autofocus':'autofocus'}))
    last_name = forms.CharField(label='Apellido', widget=forms.TextInput(attrs={'class':'form-control'}))
    username = forms.CharField(label='Usuario', widget=forms.TextInput(attrs={'class':'form-control'}))

    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'username','email', 'password1', 'password2']
        help_texts = {k:"" for k in fields}

class PasswordForm(UserCreationForm):

    password1 = forms.CharField(label='Nueva contraseña:', widget=forms.PasswordInput(attrs={'class':'form-control'}))
    password2 = forms.CharField(label='Confirmar contraseña:', widget=forms.PasswordInput(attrs={'class':'form-control'}))

    class Meta:
        model = User
        fields = ['password1', 'password2']
        help_texts = {k:"" for k in fields}
