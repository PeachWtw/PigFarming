# -*- coding: utf-8 -*-
from django.shortcuts import render
import simplejson as json
# Create your views here.
from django.http import HttpResponse
from pig.models import  Test_Pig
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
    test_list="[[1370217600000,0.7495],\
							[1370304000000,0.7455],\
						[1370476800000,0.7635],\
							[1370563200000,0.7655],\
							[1370736000000,0.7395],\
							[1370822400000,0.7595],\
							[1370908800000,0.7295],\
							[1370995200000,0.7595]]"
    # staff_str  = map(str, test_list)
    return HttpResponse(test_list)
