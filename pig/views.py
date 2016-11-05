# -*- coding: utf-8 -*-
from django.shortcuts import render
# Create your views here.
import  json
from django.http import HttpResponse
from pig.models import BreedImprovement
from pig.models import  Breeding

#作为pig的主页显示
def first_page(request):
    if request.method=='GET':
        # req=simplejson.loads(request.raw_)
        num1=request.GET['a']
        num2=request.GET['b']
        num=int(num1)+int(num2)
        return HttpResponse(str(num))
    else:
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

#测试文章数据
def func_getArticle(request):
    L=func_handle_database(BreedImprovement)
    return HttpResponse(json.dumps(L))



