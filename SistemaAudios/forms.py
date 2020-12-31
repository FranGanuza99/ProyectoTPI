from django.forms import ModelForm
from .models import User, Recurso
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


class RecursoForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(RecursoForm, self).__init__(*args, **kwargs)
        
        # Agrega un atributo class con el mismo valor
        # a todos los campos del formulario.
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'
    
    class Meta:
        model = Recurso
        fields = [
            'nombre',
            'descripcion',
            'archivo',
            'categoria']
