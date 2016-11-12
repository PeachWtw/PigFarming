# -*- coding: utf-8 -*-
from django.shortcuts import render
# Create your views here.
# 异常模块
from pig.ExceptClass import *
import json
import math
from django.http import HttpResponse

#引入model中的全部数据库模块
from pig.models import *
#作为pig的主页显示
def first_page(request):
    return HttpResponse("fdfdsfss")


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
    temp_list = db_obj.objects.all()
    L = []
    for val in temp_list:
        L.append([str(val)])
    return L


#处理文章列表的函数，准备把处理数据库数据的模块函数合并到这个函数
def func_handle_artList(db_obj, page, art_type):
    try:
        #获取元组总数
        temp_list = db_obj.objects.filter(bi_id__gte=1,type=art_type)
        num = map(str, temp_list)
        page_total=int(math.ceil(len(num) / 10.0))
        index_low = (page - 1) * 10
        index_high = page * 10
        filter_list=temp_list.all()[index_low:index_high]
        # if page < 1:
        #     raise PageLessThanOneError("页面小于1 page=%d" % page)
        # if num<=10 | page == 1:#如果文章总数小于10或者page等于1
        #     index_high =10
        #     temp_list = db_obj.objects.filter(bi_id__lte=index_high,type=art_type)
        # else:
        #     index_low = (page - 1) * 10
        #     index_high = page * 10
        #     temp_list = temp_list = db_obj.objects.filter(bi_id__gte=index_low,type=art_type).filter(bi_id__lte=index_high,type=art_type)
        L = []
        for iter in filter_list:
            L.append(iter.res_dict())
        return L, page_total
    finally:
        pass


#测试文章数据
def func_getArticle(request):
    L = func_handle_database(BreedImprovement)
    return HttpResponse(json.dumps(L))

#需求6,7,9,10
    #功能：获取文章列表:
     #生产管理，动保防疫模块:
         #猪场管理 pigFarmManagement
         #繁育管理 breedManagement
         #饲养管理 feedManagement
         #日常管理 dailyManagement
def func_getArtList(request):
    page = request.GET['page']
    article_type=request.GET['articleType']
    #article_type='pigFarmManagement'

    if article_type=='pigFarmManagement':
         L, cnt = func_handle_artList(BreedImprovement, int(page),article_type)
    elif article_type=='breedManagement':
         L, cnt = func_handle_artList(BreedImprovement, int(page),article_type)
    elif article_type=='feedManagement':
         L, cnt = func_handle_artList(BreedImprovement, int(page),article_type)
    elif article_type=='dailyManagement':
         L, cnt = func_handle_artList(BreedImprovement, int(page),article_type)
    else:
        L,cnt=None,None
    # L, cnt = func_handle_artList(BreedImprovement, int(page))
    d = dict(allList=L, page=cnt)
    s = json.dumps(d)
    return HttpResponse(json.dumps(d))



