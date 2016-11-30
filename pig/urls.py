# -*- coding: utf-8 -*-
__author__ = 'peach'
from django.conf.urls import patterns, include, url

urlpatterns = patterns('',
    url(r'^$', 'pig.views.first_page',name='home'),
    #按功能进行分包
    url(r'^article/', include('pig.article_urls')), #文章处理
    url(r'^charts/', include('pig.article_urls')),  #表格处理
    url(r'^climate/', include('pig.article_urls')), #气候处理
    url(r'^getVisits/', 'pig.views.func_getVisits'), #主页访问次数
   #url(r'^article/getArticle/','pig.views.func_getArticle'),
)


