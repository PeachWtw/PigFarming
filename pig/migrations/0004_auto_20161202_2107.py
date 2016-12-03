# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('pig', '0003_auto_20161202_1514'),
    ]

    operations = [
        migrations.CreateModel(
            name='businessInformation',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('title', models.CharField(max_length=200, null=True, blank=True)),
                ('url', models.CharField(max_length=200, null=True, blank=True)),
                ('priority', models.IntegerField(null=True, blank=True)),
                ('isDelete', models.IntegerField(null=True, blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='buyInformation',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('title', models.CharField(max_length=200, null=True, blank=True)),
                ('url', models.CharField(max_length=200, null=True, blank=True)),
                ('priority', models.IntegerField(null=True, blank=True)),
                ('isDelete', models.IntegerField(null=True, blank=True)),
            ],
        ),
        migrations.AddField(
            model_name='supplyinformation',
            name='isDelete',
            field=models.IntegerField(null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='supplyinformation',
            name='title',
            field=models.CharField(max_length=200, null=True, blank=True),
        ),
    ]
