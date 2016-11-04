__author__ = 'peach'
from django.conf.urls import patterns, include, url

urlpatterns = patterns('',
    url(r'^$', 'pig.views.first_page'),
    url(r'^example/', 'pig.views.example_func'),
    url(r'^example_database/','pig.views.example_database_func'),
    url(r'^getData/','pig.views.example_getData'),
    url(r'^getArticle/','pig.views.example_getArticle'),

)
