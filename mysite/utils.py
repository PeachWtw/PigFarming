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


class ObjectOrDictFormatter(object):

    # >>> class Foo(object):
    # ...     bar = 'hello'
    # ...     baz = 'world'
    # ...
    # >>> f = Foo()
    # >>> [name for name in dir(f) if not name.startswith('__')]
    # [ 'bar', 'baz' ]
    # >>> dict((name, getattr(f, name)) for name in dir(f) if not name.startswith('__'))
    # { 'bar': 'hello', 'baz': 'world' }

    def obj2dict(obj):
        # names = name in dir(obj) if not name.startWith('__'):
        d = dict(
                    (name, getattr(obj, name)
                ) for name in dir(obj) if not name.startswith('__')
            )
        return d

    # 可以改进上述方法，只返回数据属性，不包括方法：
    # dict(
    #         (name, getattr(obj, name)) for name in dir(obj) if not name.startswith('__') and not callable(value)
    #     )


    # 或者：
    def obj2prop(obj):
        p = {}
        for name in dir(obj):
            value = getattr(obj, name)
            if not name.startswith('__') and not callable(value):
                p[name] = value
        return p

    # >>> d = {
    #         'a': 1,
    #         'b': {'c': 2},
    #         'd': ['hi', {'foo': 'bar'}]
    #         }
    # >>> x = dict2obj(d)
    # >>> x.a
    # 1
    # >>> x.b.c
    # 2
    # >>> x.d[1].foo
    # 'bar'
    @classmethod
    def dict2obj(d):
        obj = type('new', (object,), d)
        seqs = tuple, list, set, frozenset
        for i, j in d.items():
            if isinstance(j, dict):
                setattr(obj, i, dict2obj(j))
            elif isinstance(j, seqs):
                setattr(obj, i,
                    type(j)(dict2obj(sj) if isinstance(sj, dict) else sj for sj in j))
            else:
                setattr(obj, i, j)
        return obj


