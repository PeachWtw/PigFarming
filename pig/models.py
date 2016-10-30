from django.db import models

# Create your models here.
class Test_Pig(models.Model):
    kind=models.CharField(max_length=100)
    number=models.IntegerField()
    def __unicode__(self):
        return u'%s %s' % (self.kind, self.number)
