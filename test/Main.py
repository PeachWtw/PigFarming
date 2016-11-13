__author__ = 'haha'


from Utils import Properties

dictProperties=Properties("db.properties").getProperties()

print dictProperties['mysql']['engine']
print dictProperties['mysql']['name']
print dictProperties['mysql']['host']
print dictProperties['mysql']['user']
print dictProperties['mysql']['password']
print dictProperties['mysql']['port']

dictProperties['mysql']['engine']
dictProperties['mysql']['name']
dictProperties['mysql']['host']
dictProperties['mysql']['user']
dictProperties['mysql']['password']
dictProperties['mysql']['port']
