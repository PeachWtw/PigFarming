__author__ = 'chen_yanhao'
# by chen_yanhao at 2016/12/02 22:12


from mysite.utils import Properties

db_properties = Properties("db.properties").get_properties()
db_instance = db_properties['db_instance']

print db_properties[db_instance]['engine']
print db_properties[db_instance]['name']
print db_properties[db_instance]['user']
print db_properties[db_instance]['password']
print db_properties[db_instance]['host']
print db_properties[db_instance]['port']

print "============================================"

from mysite.utils import NetInfo

print NetInfo("net.properties").get_localhost_ip()
print NetInfo().get_localhost_ip()

