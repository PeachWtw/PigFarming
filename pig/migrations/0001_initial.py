# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='DjangoAdminLog',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('action_time', models.DateTimeField()),
                ('object_id', models.TextField(null=True, blank=True)),
                ('object_repr', models.CharField(max_length=200)),
                ('action_flag', models.SmallIntegerField()),
                ('change_message', models.TextField()),
            ],
            options={
                'db_table': 'django_admin_log',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='DjangoContentType',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('app_label', models.CharField(max_length=100)),
                ('model', models.CharField(max_length=100)),
            ],
            options={
                'db_table': 'django_content_type',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='DjangoMigrations',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('app', models.CharField(max_length=255)),
                ('name', models.CharField(max_length=255)),
                ('applied', models.DateTimeField()),
            ],
            options={
                'db_table': 'django_migrations',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='DjangoSession',
            fields=[
                ('session_key', models.CharField(max_length=40, serialize=False, primary_key=True)),
                ('session_data', models.TextField()),
                ('expire_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'django_session',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Breedchicken',
            fields=[
                ('id', models.IntegerField(serialize=False, primary_key=True)),
                ('title', models.CharField(max_length=50, null=True, blank=True)),
                ('abstract', models.CharField(max_length=255, null=True, blank=True)),
                ('content', models.TextField(null=True, blank=True)),
                ('publish_time', models.DateTimeField(null=True, blank=True)),
                ('click_times', models.IntegerField(null=True, blank=True)),
                ('src_img', models.CharField(max_length=255, null=True, blank=True)),
                ('type', models.CharField(max_length=20, null=True, blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='Breedfish',
            fields=[
                ('id', models.IntegerField(serialize=False, primary_key=True)),
                ('title', models.CharField(max_length=50, null=True, blank=True)),
                ('abstract', models.CharField(max_length=255, null=True, blank=True)),
                ('content', models.TextField(null=True, blank=True)),
                ('publish_time', models.DateTimeField(null=True, blank=True)),
                ('click_times', models.IntegerField(null=True, blank=True)),
                ('src_img', models.CharField(max_length=255, null=True, blank=True)),
                ('type', models.CharField(max_length=20, null=True, blank=True)),
            ],
        ),
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
        ),
        migrations.CreateModel(
            name='Breedpig',
            fields=[
                ('id', models.IntegerField(serialize=False, primary_key=True)),
                ('title', models.CharField(max_length=50, null=True, blank=True)),
                ('abstract', models.CharField(max_length=255, null=True, blank=True)),
                ('content', models.TextField(null=True, blank=True)),
                ('publish_time', models.DateTimeField(null=True, blank=True)),
                ('click_times', models.IntegerField(null=True, blank=True)),
                ('src_img', models.CharField(max_length=255, null=True, blank=True)),
                ('type', models.CharField(max_length=20, null=True, blank=True)),
            ],
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
        ),
        migrations.CreateModel(
            name='DayePrivet',
            fields=[
                ('day_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
                ('scale', models.FloatField(null=True, blank=True)),
                ('sales', models.FloatField(null=True, blank=True)),
            ],
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
        ),
        migrations.CreateModel(
            name='FeedCorn',
            fields=[
                ('fc_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
            ],
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
        ),
        migrations.CreateModel(
            name='InsidePig',
            fields=[
                ('in_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
            ],
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
        ),
        migrations.CreateModel(
            name='MixedPig',
            fields=[
                ('mp_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='NationalPolicy',
            fields=[
                ('np_id', models.IntegerField(serialize=False, primary_key=True)),
                ('title', models.CharField(max_length=50, null=True, blank=True)),
                ('content', models.TextField(null=True, blank=True)),
            ],
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
        ),
        migrations.CreateModel(
            name='OutsidePig',
            fields=[
                ('op_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
            ],
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
        ),
        migrations.CreateModel(
            name='SoybeanMeal',
            fields=[
                ('soy_id', models.IntegerField(serialize=False, primary_key=True)),
                ('timestp', models.CharField(max_length=20, null=True, blank=True)),
                ('price', models.FloatField(null=True, blank=True)),
            ],
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
        ),
        migrations.CreateModel(
            name='Visits',
            fields=[
                ('id', models.IntegerField(serialize=False, primary_key=True)),
                ('times', models.IntegerField(null=True, blank=True)),
            ],
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
        ),
    ]
