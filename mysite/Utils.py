# -*- encoding: utf-8 -*-

__author__ = "haha"

class Properties(object):

    def __init__(self, fileName):
        self.fileName = fileName
        self.properties = {}

    def __getDict(self, strSrc, dict, value):
        if(strSrc.find('.') > 0):
            k = strSrc.split('.')[0]
            dict.setdefault(k, {})
            return self.__getDict(strSrc[len(k) + 1:], dict[k], value)
        else:
            dict[strSrc] = value
            return

    def getProperties(self):
        with open(self.fileName, 'Ur') as pro_file:
            for line in pro_file.readlines():
                line = line.strip().replace('\n', '')
                # "#"在properties文件中是注释
                if line.find("#") != -1:
                    line = line[0: line.find('#')]
                if line.find('=') > 0:
                    strs = line.split('=')
                    strs[1] = line[len(strs[0]) + 1:]
                    # strip方法,去前面和后面的空格,但是中间的空格依然保留
                    self.__getDict(strs[0].strip(), self.properties, strs[1].strip())
        return self.properties




