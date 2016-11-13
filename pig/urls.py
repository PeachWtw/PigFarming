# -*- coding: utf-8 -*-
__author__ = 'peach'
from django.conf.urls import patterns, include, url

urlpatterns = patterns('',
    url(r'^$', 'pig.views.first_page'),
    #按功能进行分包
        #文章处理
    url(r'^article/', include('pig.article_urls')),
   #url(r'^article/getArticle/','pig.views.func_getArticle'),
)


