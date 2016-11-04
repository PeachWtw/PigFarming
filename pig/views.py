# -*- coding: utf-8 -*-
from django.shortcuts import render
# Create your views here.
from django.http import HttpResponse
from pig.models import  Test_Pig
from pig.models import  Test_for_Plant
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
def example_func(request):
    num1=request.GET["a"]
    return HttpResponse(num1)

#测试数据示例函数
def example_database_func(request):
    # staff_list = Test_Pig.objects.filter(kind="gold pig").exclude(number__gte=107)
    staff_list = Test_Pig.objects.filter(kind__startswith="black")
    staff_str  = map(str, staff_list)
    return HttpResponse("<p>" + ' '.join(staff_str) + "</p>")

#测试k线图数据
def example_getData(request):
    temp_list=Test_for_Plant.objects.all()
    str1=''
    for key in temp_list:
        str1=str1+' '+str(key)
    return HttpResponse(str1)
#测试文章数据
def example_getArticle(request):
    art_list=request.GET["article"]
    b = Breeding(breed_id=1,Production_status=art_list, Production_scale='All the latest Beatles news.',Industry_situation='pig')
    b.save()


