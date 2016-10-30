# -*- coding: utf-8 -*-
from django.db import models


#引入时间戳类型
from datetime import datetime
from time import strftime
#stackoverflow 上的timestamp类型
class UnixTimestampField(models.DateTimeField):
    """UnixTimestampField: creates a DateTimeField that is represented on the
    database as a TIMESTAMP field rather than the usual DATETIME field.
    """
    def __init__(self, null=False, blank=False, **kwargs):
        super(UnixTimestampField, self).__init__(**kwargs)
        # default for TIMESTAMP is NOT NULL unlike most fields, so we have to
        # cheat a little:
        self.blank, self.isnull = blank, null
        self.null = True # To prevent the framework from shoving in "not null".

    def db_type(self, connection):
        typ=['TIMESTAMP']
        # See above!
        if self.isnull:
            typ += ['NULL']
        if self.auto_created:
            typ += ['default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP']
        return ' '.join(typ)

    def to_python(self, value):
        if isinstance(value, int):
            return datetime.fromtimestamp(value)
        else:
            return models.DateTimeField.to_python(self, value)

    def get_db_prep_value(self, value, connection, prepared=False):
        if value==None:
            return None
        # Use '%Y%m%d%H%M%S' for MySQL < 4.1
        return strftime('%Y-%m-%d %H:%M:%S',value.timetuple())

# Create your models here.
#test table
class Test_Pig(models.Model):
    kind=models.CharField(max_length=100)
    number=models.IntegerField()
    def __unicode__(self):
        return u'%s %s' % (self.kind, self.number)

#test_table2
class Test_for_Plant(models.Model):
    ps_id=models.BigIntegerField(primary_key=True)
    utc_date=models.CharField(max_length=100)
    price=models.FloatField(max_length=20)
    def __unicode__(self):
        return u'%s %s' % (self.utc_date, self.price)
#plant scale table
class PlantingScale(models.Model):
    ps_id=models.BigIntegerField(primary_key=True)
    utc_date=UnixTimestampField(auto_created=True)
    price=models.FloatField(max_length=20)
    def __unicode__(self):
        return u'%s %s' % (self.utc_date, self.price)

#