# Generated by Django 2.2.18 on 2021-11-29 15:18

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Default',
            fields=[
                ('transport', models.CharField(max_length=10, primary_key=True, serialize=False)),
                ('emissions', models.IntegerField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(max_length=255)),
                ('email', models.EmailField(max_length=255)),
                ('password', models.CharField(max_length=255)),
                ('logged', models.BooleanField(default=False)),
                ('token', models.CharField(default='', max_length=500, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Journey',
            fields=[
                ('journey_id', models.AutoField(primary_key=True, serialize=False)),
                ('distance', models.IntegerField(default=0)),
                ('emitted', models.IntegerField(default=0, null=True)),
                ('date', models.DateField(default=datetime.date.today, null=True)),
                ('transport', models.ForeignKey(default='Car (Petrol)', on_delete=django.db.models.deletion.CASCADE, to='api.Default')),
                ('user_id', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='api.User')),
            ],
        ),
    ]
