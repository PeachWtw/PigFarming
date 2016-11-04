# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('pig', '0005_plantingscale_test_for_plant'),
    ]

    operations = [
        migrations.CreateModel(
            name='Breeding',
            fields=[
                ('breed_id', models.BigIntegerField(serialize=False, primary_key=True)),
                ('Production_status', models.TextField()),
                ('Production_scale', models.TextField()),
                ('Industry_situation', models.TextField()),
            ],
        ),
    ]
