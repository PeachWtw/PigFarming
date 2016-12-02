# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('pig', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='SupplyInformation',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('title', models.CharField(max_length=100, null=True, blank=True)),
                ('url', models.CharField(max_length=200, null=True, blank=True)),
                ('priority', models.IntegerField(null=True, blank=True)),
            ],
        ),
    ]
