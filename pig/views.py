# -*- coding: utf-8 -*-
from django.shortcuts import render
# Create your views here.
#异常模块
from pig.ExceptClass import *
import  json
import  math
from django.http import HttpResponse
from pig.models import BreedImprovement
from pig.models import  Breeding

#作为pig的主页显示
def first_page(request):
    return  HttpResponse("fdfdsfss")

#测试示例函数
# def example_func(request):
#     num1=request.GET["a"]
#     return HttpResponse(num1)
#
# #测试数据示例函数
# def example_database_func(request):
#     # staff_list = Test_Pig.objects.filter(kind="gold pig").exclude(number__gte=107)
#     staff_list = Test_Pig.objects.filter(kind__startswith="black")
#     staff_str  = map(str, staff_list)
#     return HttpResponse("<p>" + ' '.join(staff_str) + "</p>")
#
# #测试k线图数据
# def example_getData(request):
#     temp_list=Test_for_Plant.objects.all()
#     str1=''
#     for key in temp_list:
#         str1=str1+' '+str(key)
#     return HttpResponse(str1)

#处理数据库数据的模块函数
def func_handle_database(db_obj):
    temp_list=db_obj.objects.all()
    L=[]
    for val in temp_list:
        L.append([str(val)])
    return L
#处理文章列表的函数，准备把处理数据库数据的模块函数合并到这个函数
def func_handle_artList(db_obj,page):
    try:
        if page<1:
            raise PageLessThanOneError("页面小于1 page=%d" % page)
        index_low=(page-1)*10
        index_high=page*10
        if page==1:
            temp_list=db_obj.objects.filter(bi_id__lte=index_high)
        else:
            temp_list=temp_list=db_obj.objects.filter(bi_id__lte=index_high).filter(bi_id__gte=index_low)
        L=[]
        for val in temp_list:
            L.append([str(val)])
        #获取元组总数
        temp_list=db_obj.objects.filter(bi_id__gte=1)
        num=map(str,temp_list)
        return L,int(math.ceil(len(num)/10.0))
    finally:
        pass
#测试文章数据
def func_getArticle(request):
    L=func_handle_database(BreedImprovement)
    return HttpResponse(json.dumps(L))

#功能：获取文章列表
def func_getArtList(request):
    page=request.GET['page']
    L,cnt=func_handle_artList(BreedImprovement,int(page))
    # s='"page":'+'"'+str(cnt)+'"'
    d = dict(AllList=L, page=cnt)
    s=json.dumps(d)
    return HttpResponse(json.dumps(d))

