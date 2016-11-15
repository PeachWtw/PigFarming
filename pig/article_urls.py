# -*- coding: utf-8 -*-
__author__ = 'peach'
from django.conf.urls import patterns, include, url

urlpatterns = patterns('',
    #url(r'^getArticle/','pig.views.func_getArticle'),
    url(r'^getArtList/','pig.views.func_getArtList'),#文章列表
    url(r'^getArtById/','pig.views.func_getArtById'),#文章详情
    url(r'^getChartData/','pig.views.func_getChartData'),#物种系统
    url(r'^getPigData/','pig.views.func_getChartData'),#猪价系统
)
