# -*- coding: utf-8 -*-
from django.shortcuts import render
# Create your views here.
# 异常模块
from pig.ExceptClass import *
import json
import math
import string
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


#用来处理文章的工具类
class ArticleHandleCls(object):
    #处理文章列表的函数，准备把处理数据库数据的模块函数合并到这个函数
    @classmethod
    def func_handle_artList(cls,request,db_obj, page, art_type):
        try:
            temp_list = db_obj.objects.filter(bi_id__gte=1,type=art_type)   #获取元组总个数
            num = map(str, temp_list)
            page_total=int(math.ceil(len(num) / 10.0))  #计算总页数
            index_low = (page - 1) * 10
            index_high = page * 10
            filter_list=temp_list.all()[index_low:index_high]
            L = []  #生成dict对象
            for iter in filter_list:
                L.append(iter.res_dict())
            print '************'
            request.session['alist']=L
            print request.session['alist']
            print '**************'
            #--------------------------
            # for iter in filter_list:
            #     L.append(iter.res_dict())
            # request.session['length']=len(num) #利用session保存元组总数
            # for i in range(0,len(num)):
            #     request.session['table'+'i']=L[i] #利用session保存表名
            #---------------------------
            return L, page_total
        finally:
            pass
    #获取文章列表的类方法
        #输入：page,articleType
        #输出：L(文章列表)，cnt(总页数)
    @classmethod
    def wrap_articleList_method(cls,request):
        page = request.GET['page']  #从request获取所需参数
        article_type=request.GET['articleType']
        if string.find(article_type,"Management"):  #进行不同的数据库表匹配
            L, cnt = cls.func_handle_artList(request,BreedImprovement,int(page),article_type)
        elif string.find(article_type,"其他接口"):
            L, cnt = cls.func_handle_artList(request,BreedImprovement, int(page),article_type)
        else:
            L,cnt=None,None
        return  L,cnt
    # #获取文章详情的方法
    @classmethod
    def wrap_articleDetail_method(cls,request):
        indexusername = request.GET['articleId']  #从request获取所需参数
        print '--------------'
        L=request.session.get('alist')
        print L
        print '--------------'
        #L=request.session.get('table')   #获取session存储的数据库表
        #pass    #文章点击次数加1
        return L

#测试文章数据
def func_getArticle(request):
    L = func_handle_database(BreedImprovement)
    return HttpResponse(json.dumps(L))

#需求1
    #功能:获取养殖的文章的标题，摘要等字段
    #输入：page,articleType
    #输出：L(文章列表)，cnt(总页数)
        #养猪 pig
        #养鸡 chicken
        #养鱼 fish

#需求6,7,9,10
    #功能：获取文章列表:

     #生产管理，动保防疫模块:
         #猪场管理 pigFarmManagement
         #繁育管理 breedManagement
         #饲养管理 feedManagement
         #日常管理 dailyManagement

#获取文章列表的url函数
def func_getArtList(request):
    L,page_total=ArticleHandleCls.wrap_articleList_method(request)   #调用工具类方法
    d = dict(allList=L, page=page_total)   #进行json串行化处理
    s = json.dumps(d)
    return HttpResponse(json.dumps(d))

# #获取文章详情的url函数
def func_getArtById(request):
    d=ArticleHandleCls.wrap_articleDetail_method(request)
    print d
    s=json.dumps(d)
    return HttpResponse(json.dumps(d))


