# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('pig', '0002_auto_20161112_1625'),
    ]

    operations = [
        migrations.CreateModel(
            name='Breedchicken',
            fields=[
                ('bc_id', models.IntegerField(serialize=False, primary_key=True)),
                ('title', models.CharField(max_length=50, null=True, blank=True)),
                ('abstract', models.CharField(max_length=255, null=True, blank=True)),
                ('content', models.TextField(null=True, blank=True)),
                ('publish_time', models.DateTimeField(null=True, blank=True)),
                ('click_times', models.IntegerField(null=True, blank=True)),
                ('src_img', models.CharField(max_length=255, null=True, blank=True)),
                ('type', models.CharField(max_length=20, null=True, blank=True)),
            ],
            options={
                'db_table': 'BreedChicken',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Breedfish',
            fields=[
                ('bf_id', models.IntegerField(serialize=False, primary_key=True)),
                ('title', models.CharField(max_length=50, null=True, blank=True)),
                ('abstract', models.CharField(max_length=255, null=True, blank=True)),
                ('content', models.TextField(null=True, blank=True)),
                ('publish_time', models.DateTimeField(null=True, blank=True)),
                ('click_times', models.IntegerField(null=True, blank=True)),
                ('src_img', models.CharField(max_length=255, null=True, blank=True)),
                ('type', models.CharField(max_length=20, null=True, blank=True)),
            ],
            options={
                'db_table': 'BreedFish',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Breedpig',
            fields=[
                ('bp_id', models.IntegerField(serialize=False, primary_key=True)),
                ('title', models.CharField(max_length=50, null=True, blank=True)),
                ('abstract', models.CharField(max_length=255, null=True, blank=True)),
                ('content', models.TextField(null=True, blank=True)),
                ('publish_time', models.DateTimeField(null=True, blank=True)),
                ('click_times', models.IntegerField(null=True, blank=True)),
                ('src_img', models.CharField(max_length=255, null=True, blank=True)),
                ('type', models.CharField(max_length=20, null=True, blank=True)),
            ],
            options={
                'db_table': 'BreedPig',
                'managed': False,
            },
        ),
        migrations.AlterModelOptions(
            name='breedimprovement',
            options={'managed': False},
        ),
    ]
