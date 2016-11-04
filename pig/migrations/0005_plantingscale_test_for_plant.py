# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import pig.models


class Migration(migrations.Migration):

    dependencies = [
        ('pig', '0004_auto_20161030_2247'),
    ]

    operations = [
        migrations.CreateModel(
            name='PlantingScale',
            fields=[
                ('utc_date', pig.models.UnixTimestampField(null=True, auto_created=True)),
                ('ps_id', models.BigIntegerField(serialize=False, primary_key=True)),
                ('price', models.FloatField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Test_for_Plant',
            fields=[
                ('ps_id', models.BigIntegerField(serialize=False, primary_key=True)),
                ('utc_date', models.CharField(max_length=100)),
                ('price', models.FloatField(max_length=20)),
            ],
        ),
    ]
