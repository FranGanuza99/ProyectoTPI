# Generated by Django 3.1.4 on 2020-12-31 23:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SistemaAudios', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='recurso',
            name='archivo',
            field=models.FileField(upload_to='audios/'),
        ),
    ]
