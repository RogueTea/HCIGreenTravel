# Generated by Django 3.2.9 on 2021-11-20 00:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_rename_defaults_default'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='journey',
            name='time',
        ),
        migrations.AlterField(
            model_name='journey',
            name='journeyid',
            field=models.AutoField(primary_key=True, serialize=False),
        ),
    ]
