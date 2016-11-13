# -*- coding: utf-8 -*-
# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin sqlcustom [app_label]'
# into your database.
from __future__ import unicode_literals

from django.db import models



import json
#处理datetime问题使用的方法：http://stackoverflow.com/questions/11875770/how-to-overcome-datetime-datetime-not-json-serializable-in-python
from datetime import datetime
def json_serial(obj):
    """JSON serializer for objects not serializable by default json code"""

    if isinstance(obj, datetime):
        serial = obj.isoformat()
        return serial
    raise TypeError ("Type not serializable")


class BreedImprovement(models.Model):
    bi_id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=50, blank=True, null=True)
    abstract = models.CharField(max_length=255, blank=True, null=True)
    content = models.TextField(blank=True, null=True)
    publish_time = models.DateTimeField(blank=True, null=True)
    click_times = models.IntegerField(blank=True, null=True)
    src_img = models.CharField(max_length=255, blank=True, null=True)
    type = models.CharField(max_length=20, blank=True, null=True)
    def res_dict(self):
        return dict(bi_id=self.bi_id,title=self.title,abstract=self.abstract,content=self.content,\
             publish_time=json_serial(self.publish_time),click_times=self.click_times,src_img=self.src_img,type=self.type)
        # return dict(bi_id=self.bi_id,title=self.title,abstract=self.abstract,content=self.content,\
        #      click_times=self.click_times,src_img=self.src_img,type=self.type)
    class Meta:
        managed = False
        db_table = 'breed_improvement'



class Breeding(models.Model):
    breed_id = models.IntegerField(primary_key=True)
    production_status = models.TextField(blank=True, null=True)
    production_scale = models.TextField(blank=True, null=True)
    scaleindustry_situation = models.TextField(blank=True, null=True)
    type = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'breeding'


class Camphor(models.Model):
    camphort_id = models.IntegerField(primary_key=True)
    timestp = models.CharField(max_length=20, blank=True, null=True)
    price = models.FloatField(blank=True, null=True)
    scale = models.FloatField(blank=True, null=True)
    sales = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'camphor'


class Cedar(models.Model):
    ced_id = models.IntegerField(primary_key=True)
    timestp = models.CharField(max_length=20, blank=True, null=True)
    price = models.FloatField(blank=True, null=True)
    scale = models.FloatField(blank=True, null=True)
    sales = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'cedar'


class Climate(models.Model):
    cli_id = models.IntegerField(primary_key=True)
    timestp = models.CharField(max_length=20, blank=True, null=True)
    temperature = models.FloatField(blank=True, null=True)
    humid = models.FloatField(blank=True, null=True)
    weather = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'climate'


class Corn(models.Model):
    corn_id = models.IntegerField(primary_key=True)
    timestp = models.CharField(max_length=20, blank=True, null=True)
    price = models.FloatField(blank=True, null=True)
    scale = models.FloatField(blank=True, null=True)
    production = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'corn'


class DayePrivet(models.Model):
    day_id = models.IntegerField(primary_key=True)
    timestp = models.CharField(max_length=20, blank=True, null=True)
    price = models.FloatField(blank=True, null=True)
    scale = models.FloatField(blank=True, null=True)
    sales = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'daye_privet'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Environment(models.Model):
    env_id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=50, blank=True, null=True)
    abstract = models.CharField(max_length=255, blank=True, null=True)
    content = models.TextField(blank=True, null=True)
    publish_time = models.DateTimeField(blank=True, null=True)
    click_times = models.IntegerField(blank=True, null=True)
    src_img = models.CharField(max_length=255, blank=True, null=True)
    type = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'environment'


class FeedCorn(models.Model):
    fc_id = models.IntegerField(primary_key=True)
    timestp = models.CharField(max_length=20, blank=True, null=True)
    price = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'feed_corn'


class FranceGreen(models.Model):
    fg_id = models.IntegerField(primary_key=True)
    timestp = models.CharField(max_length=20, blank=True, null=True)
    price = models.FloatField(blank=True, null=True)
    scale = models.FloatField(blank=True, null=True)
    sales = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'france_green'


class FranceGreen2(models.Model):
    fg_id = models.IntegerField(primary_key=True)
    timestp = models.CharField(max_length=20, blank=True, null=True)
    price = models.FloatField(blank=True, null=True)
    scale = models.FloatField(blank=True, null=True)
    sales = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'france_green2'


class Ginkgo(models.Model):
    ginkgo_id = models.IntegerField(primary_key=True)
    timestp = models.CharField(max_length=20, blank=True, null=True)
    price = models.FloatField(blank=True, null=True)
    scale = models.FloatField(blank=True, null=True)
    sales = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ginkgo'


class Hackberry(models.Model):
    hac_id = models.IntegerField(db_column='Hac_id', primary_key=True)  # Field name made lowercase.
    timestp = models.CharField(max_length=20, blank=True, null=True)
    price = models.FloatField(blank=True, null=True)
    scale = models.FloatField(blank=True, null=True)
    sales = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'hackberry'


class InsidePig(models.Model):
    in_id = models.IntegerField(primary_key=True)
    timestp = models.CharField(max_length=20, blank=True, null=True)
    price = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'inside_pig'


class LagerstroemiaIndica(models.Model):
    lid = models.IntegerField(primary_key=True)
    timestp = models.CharField(max_length=20, blank=True, null=True)
    price = models.FloatField(blank=True, null=True)
    scale = models.FloatField(blank=True, null=True)
    sales = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'lagerstroemia_indica'


class MixedPig(models.Model):
    mp_id = models.IntegerField(primary_key=True)
    timestp = models.CharField(max_length=20, blank=True, null=True)
    price = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'mixed_pig'


class NationalPolicy(models.Model):
    np_id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=50, blank=True, null=True)
    content = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'national_policy'


class Osmanthus(models.Model):
    osmanthus_id = models.IntegerField(primary_key=True)
    timestp = models.CharField(max_length=20, blank=True, null=True)
    price = models.FloatField(blank=True, null=True)
    scale = models.FloatField(blank=True, null=True)
    sales = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'osmanthus'


class OutsidePig(models.Model):
    op_id = models.IntegerField(primary_key=True)
    timestp = models.CharField(max_length=20, blank=True, null=True)
    price = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'outside_pig'


class Pea(models.Model):
    pea_id = models.IntegerField(primary_key=True)
    timestp = models.CharField(max_length=20, blank=True, null=True)
    price = models.FloatField(blank=True, null=True)
    scale = models.FloatField(blank=True, null=True)
    production = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'pea'


class PhotiniaFruticosa(models.Model):
    pho_id = models.IntegerField(primary_key=True)
    timestp = models.CharField(max_length=20, blank=True, null=True)
    price = models.FloatField(blank=True, null=True)
    scale = models.FloatField(blank=True, null=True)
    sales = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'photinia_fruticosa'


class Pittosporum(models.Model):
    pit_id = models.IntegerField(primary_key=True)
    timestp = models.CharField(max_length=20, blank=True, null=True)
    price = models.FloatField(blank=True, null=True)
    scale = models.FloatField(blank=True, null=True)
    sales = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'pittosporum'


class Podocarpus(models.Model):
    pod_id = models.IntegerField(primary_key=True)
    timestp = models.CharField(max_length=20, blank=True, null=True)
    price = models.FloatField(blank=True, null=True)
    scale = models.FloatField(blank=True, null=True)
    sales = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'podocarpus'


class PrivetOfKingson(models.Model):
    pok_id = models.IntegerField(primary_key=True)
    timestp = models.CharField(max_length=20, blank=True, null=True)
    price = models.FloatField(blank=True, null=True)
    scale = models.FloatField(blank=True, null=True)
    sales = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'privet_of_kingson'


class ProductionControl(models.Model):
    pc_id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=50, blank=True, null=True)
    abstract = models.CharField(max_length=255, blank=True, null=True)
    content = models.TextField(blank=True, null=True)
    publish_time = models.DateTimeField(blank=True, null=True)
    click_times = models.IntegerField(blank=True, null=True)
    src_img = models.CharField(max_length=255, blank=True, null=True)
    type = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'production_control'


class Redwood(models.Model):
    red_id = models.IntegerField(primary_key=True)
    timestp = models.CharField(max_length=20, blank=True, null=True)
    price = models.FloatField(blank=True, null=True)
    scale = models.FloatField(blank=True, null=True)
    sales = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'redwood'


class SoybeanMeal(models.Model):
    soy_id = models.IntegerField(primary_key=True)
    timestp = models.CharField(max_length=20, blank=True, null=True)
    price = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'soybean_meal'


class Trend(models.Model):
    tr_id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=50, blank=True, null=True)
    abstract = models.CharField(max_length=255, blank=True, null=True)
    content = models.TextField(blank=True, null=True)
    publish_time = models.DateTimeField(blank=True, null=True)
    click_times = models.IntegerField(blank=True, null=True)
    src_img = models.CharField(max_length=255, blank=True, null=True)
    type = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'trend'


class Wheat(models.Model):
    wheat_id = models.IntegerField(primary_key=True)
    timestp = models.CharField(max_length=20, blank=True, null=True)
    price = models.FloatField(blank=True, null=True)
    scale = models.FloatField(blank=True, null=True)
    production = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'wheat'
