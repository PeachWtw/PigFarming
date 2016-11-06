# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='BreedImprovement',
            fields=[
                ('bi_id', models.IntegerField(serialize=False, primary_key=True)),
                ('title', models.CharField(max_length=50, null=True, blank=True)),
                ('abstract', models.CharField(max_length=255, null=True, blank=True)),
                ('content', models.TextField(null=True, blank=True)),
                ('publish_time', models.DateTimeField(null=True, blank=True)),
                ('click_times', models.IntegerField(null=True, blank=True)),
                ('src_img', models.CharField(max_length=255, null=True, blank=True)),
                ('type', models.CharField(max_length=20, null=True, blank=True)),
            ],
            options={
                'db_table': 'breed_improvement',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Breeding',
            fields=[
                ('breed_id', models.BigIntegerField(serialize=False, primary_key=True)),
                ('production_status', models.TextField(db_column='Production_status')),
                ('production_scale', models.TextField(db_column='Production_scale')),
                ('industry_situation', models.TextField(db_column='Industry_situation')),
            ],
            options={
                'db_table': 'breeding',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Camphor',
            fields=[
                ('camphort_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
                ('scale', models.FloatField(null=True, blank=True)),
                ('sales', models.FloatField(null=True, blank=True)),
            ],
            options={
                'db_table': 'camphor',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Cedar',
            fields=[
                ('ced_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
                ('scale', models.FloatField(null=True, blank=True)),
                ('sales', models.FloatField(null=True, blank=True)),
            ],
            options={
                'db_table': 'cedar',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Climate',
            fields=[
                ('cli_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('temperature', models.FloatField(null=True, blank=True)),
                ('humid', models.FloatField(null=True, blank=True)),
                ('weather', models.CharField(max_length=50, null=True, blank=True)),
            ],
            options={
                'db_table': 'climate',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Corn',
            fields=[
                ('corn_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
                ('scale', models.FloatField(null=True, blank=True)),
                ('production', models.FloatField(null=True, blank=True)),
            ],
            options={
                'db_table': 'corn',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Environment',
            fields=[
                ('env_id', models.IntegerField(serialize=False, primary_key=True)),
                ('title', models.CharField(max_length=50, null=True, blank=True)),
                ('abstract', models.CharField(max_length=255, null=True, blank=True)),
                ('content', models.TextField(null=True, blank=True)),
                ('publish_time', models.DateTimeField(null=True, blank=True)),
                ('click_times', models.IntegerField(null=True, blank=True)),
                ('src_img', models.CharField(max_length=255, null=True, blank=True)),
                ('type', models.CharField(max_length=20, null=True, blank=True)),
            ],
            options={
                'db_table': 'environment',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='FeedCorn',
            fields=[
                ('fc_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
            ],
            options={
                'db_table': 'feed_corn',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='FranceGreen',
            fields=[
                ('fg_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
                ('scale', models.FloatField(null=True, blank=True)),
                ('sales', models.FloatField(null=True, blank=True)),
            ],
            options={
                'db_table': 'france_green',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='FranceGreen2',
            fields=[
                ('fg_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
                ('scale', models.FloatField(null=True, blank=True)),
                ('sales', models.FloatField(null=True, blank=True)),
            ],
            options={
                'db_table': 'france_green2',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Ginkgo',
            fields=[
                ('ginkgo_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
                ('scale', models.FloatField(null=True, blank=True)),
                ('sales', models.FloatField(null=True, blank=True)),
            ],
            options={
                'db_table': 'ginkgo',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Hackberry',
            fields=[
                ('hac_id', models.IntegerField(serialize=False, primary_key=True, db_column='Hac_id')),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
                ('scale', models.FloatField(null=True, blank=True)),
                ('sales', models.FloatField(null=True, blank=True)),
            ],
            options={
                'db_table': 'hackberry',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='InsidePig',
            fields=[
                ('in_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
            ],
            options={
                'db_table': 'inside_pig',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='LagerstroemiaIndica',
            fields=[
                ('lid', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
                ('scale', models.FloatField(null=True, blank=True)),
                ('sales', models.FloatField(null=True, blank=True)),
            ],
            options={
                'db_table': 'lagerstroemia_indica',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='MixedPig',
            fields=[
                ('mp_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
            ],
            options={
                'db_table': 'mixed_pig',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='NationalPolicy',
            fields=[
                ('np_id', models.IntegerField(serialize=False, primary_key=True)),
                ('title', models.CharField(max_length=50, null=True, blank=True)),
                ('content', models.TextField(null=True, blank=True)),
            ],
            options={
                'db_table': 'national_policy',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Osmanthus',
            fields=[
                ('osmanthus_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
                ('scale', models.FloatField(null=True, blank=True)),
                ('sales', models.FloatField(null=True, blank=True)),
            ],
            options={
                'db_table': 'osmanthus',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='OutsidePig',
            fields=[
                ('op_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
            ],
            options={
                'db_table': 'outside_pig',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Pea',
            fields=[
                ('pea_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
                ('scale', models.FloatField(null=True, blank=True)),
                ('production', models.FloatField(null=True, blank=True)),
            ],
            options={
                'db_table': 'pea',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='PhotiniaFruticosa',
            fields=[
                ('pho_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
                ('scale', models.FloatField(null=True, blank=True)),
                ('sales', models.FloatField(null=True, blank=True)),
            ],
            options={
                'db_table': 'photinia_fruticosa',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Pittosporum',
            fields=[
                ('pit_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
                ('scale', models.FloatField(null=True, blank=True)),
                ('sales', models.FloatField(null=True, blank=True)),
            ],
            options={
                'db_table': 'pittosporum',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Podocarpus',
            fields=[
                ('pod_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
                ('scale', models.FloatField(null=True, blank=True)),
                ('sales', models.FloatField(null=True, blank=True)),
            ],
            options={
                'db_table': 'podocarpus',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='PrivetOfKingson',
            fields=[
                ('pok_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
                ('scale', models.FloatField(null=True, blank=True)),
                ('sales', models.FloatField(null=True, blank=True)),
            ],
            options={
                'db_table': 'privet_of_kingson',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='ProductionControl',
            fields=[
                ('pc_id', models.IntegerField(serialize=False, primary_key=True)),
                ('title', models.CharField(max_length=50, null=True, blank=True)),
                ('abstract', models.CharField(max_length=255, null=True, blank=True)),
                ('content', models.TextField(null=True, blank=True)),
                ('publish_time', models.DateTimeField(null=True, blank=True)),
                ('click_times', models.IntegerField(null=True, blank=True)),
                ('src_img', models.CharField(max_length=255, null=True, blank=True)),
                ('type', models.CharField(max_length=20, null=True, blank=True)),
            ],
            options={
                'db_table': 'production_control',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Redwood',
            fields=[
                ('red_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
                ('scale', models.FloatField(null=True, blank=True)),
                ('sales', models.FloatField(null=True, blank=True)),
            ],
            options={
                'db_table': 'redwood',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='SoybeanMeal',
            fields=[
                ('soy_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
            ],
            options={
                'db_table': 'soybean_meal',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Trend',
            fields=[
                ('tr_id', models.IntegerField(serialize=False, primary_key=True)),
                ('title', models.CharField(max_length=50, null=True, blank=True)),
                ('abstract', models.CharField(max_length=255, null=True, blank=True)),
                ('content', models.TextField(null=True, blank=True)),
                ('publish_time', models.DateTimeField(null=True, blank=True)),
                ('click_times', models.IntegerField(null=True, blank=True)),
                ('src_img', models.CharField(max_length=255, null=True, blank=True)),
                ('type', models.CharField(max_length=20, null=True, blank=True)),
            ],
            options={
                'db_table': 'trend',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Wheat',
            fields=[
                ('wheat_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
                ('scale', models.FloatField(null=True, blank=True)),
                ('production', models.FloatField(null=True, blank=True)),
            ],
            options={
                'db_table': 'wheat',
                'managed': False,
            },
        ),
    ]
