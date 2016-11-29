# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('pig', '0003_auto_20161126_1114'),
    ]

    operations = [
        migrations.AlterModelTable(
            name='breedchicken',
            table='breedchicken',
        ),
        migrations.AlterModelTable(
            name='breedfish',
            table='breedfish',
        ),
        migrations.AlterModelTable(
            name='breedpig',
            table='breedpig',
        ),
    ]
