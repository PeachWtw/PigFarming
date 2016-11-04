# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('pig', '0003_test_for_plant'),
    ]

    operations = [
        migrations.DeleteModel(
            name='PlantingScale',
        ),
        migrations.DeleteModel(
            name='Test_for_Plant',
        ),
    ]
