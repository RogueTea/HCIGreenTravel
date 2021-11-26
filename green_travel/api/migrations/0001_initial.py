# Generated by Django 3.2.9 on 2021-11-25 22:43

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
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
            name='Journey',
            fields=[
                ('date', models.DateTimeField(auto_now=True)),
                ('journeyid', models.AutoField(primary_key=True, serialize=False)),
                ('distance', models.IntegerField(default=0)),
                ('emitted', models.IntegerField(default=0, null=True)),
                ('transport', models.ForeignKey(default='Car', on_delete=django.db.models.deletion.CASCADE, to='api.default')),
            ],
        ),
        migrations.CreateModel(
            name='UserProfile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('journey', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.journey')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
