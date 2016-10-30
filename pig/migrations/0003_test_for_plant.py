# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('pig', '0002_plantingscale'),
    ]

    operations = [
        migrations.CreateModel(
            name='Test_for_Plant',
            fields=[
                ('ps_id', models.BigIntegerField(serialize=False, primary_key=True)),
                ('utc_date', models.CharField(max_length=100)),
                ('price', models.FloatField(max_length=20)),
            ],
        ),
    ]
