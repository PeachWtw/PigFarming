# -*- coding: utf-8 -*-
__author__ = 'peach'
from django.conf.urls import patterns, include, url

urlpatterns = patterns('',
    #url(r'^getArticle/','pig.views.func_getArticle'),
    url(r'^getArtList/','pig.views.func_getArtList'),
    url(r'^getArtById/','pig.views.func_getArtById'),

)
