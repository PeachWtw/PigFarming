# -*- coding: utf-8 -*-
__author__ = 'peach'
from django.conf.urls import patterns, include, url

urlpatterns = patterns('',
    #url(r'^getArticle/','pig.views.func_getArticle'),
    url(r'^getArtList/','pig.views.func_getArtList'),#文章列表
    url(r'^getArtById/','pig.views.func_getArtById'),#文章详情
    url(r'^addArticle/','pig.views.func_addArticle'),#添加保存文章
    url(r'^getChartData/','pig.views.func_getChartData'),#物种系统
    url(r'^getPigPriceChartData/','pig.views.func_getPigPriceChartData'),#猪价系统
    url(r'^getClimateData/','pig.views.func_getClimateData'),#气候k线图
    url(r'^uploadPic/','pig.views.func_uploadPic'),#上传图片
)
