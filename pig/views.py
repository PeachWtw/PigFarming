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
#引入util中的ObjectOrDictFormatter模块
from mysite.utils import ObjectOrDictFormatter

#作为pig的主页显示
def first_page(request):
    return HttpResponse("welcome to mysite")


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
            temp_obj = db_obj.objects.filter(bi_id__gte=1,type=art_type)   #获取元组总个数
            num = map(str, temp_obj)
            page_total=int(math.ceil(len(num) / 10.0))  #计算总页数
            index_low = (page - 1) * 10
            index_high = page * 10
            filter_list=temp_obj.all()[index_low:index_high]
            L = []  #生成dict对象
            for iter in filter_list:
                L.append(iter.res_dict())
            request.session['StoreArticleType']=art_type    #利用Session文章类型
            request.session['tableData']=L  #利用Session存储表的数据
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
    # 处理点击次数加1的方法
    @classmethod
    def func_handle_artDetail(cls,article_type,id):
        if string.find(article_type,"Management"):  #进行不同的数据库表匹配
            brd_obj=BreedImprovement.objects.get(bi_id=id)
            brd_obj.click_times=brd_obj.click_times+1
            brd_obj.save()
        elif string.find(article_type,"其他接口"):
            pass
        else:
            pass
    # #获取文章详情的方法
    @classmethod
    def wrap_articleDetail_method(cls,request):
        index_id = request.GET['articleId']  #从request获取所需参数
        art_type=request.session['StoreArticleType']    #利用Session文章类型
        L=request.session.get('tableData')  #从Session获取表中的数据
        #bre_obj=ObjectOrDictFormatter.dict2obj(L[0])
        cls.func_handle_artDetail(art_type,index_id)
        for k in L:
            if int(k['bi_id'])==int(index_id):
                return k
            else:
                continue
        #pass    #文章点击次数加1
        return None

#-----解决需求6,7,9,10--------
#获取文章列表的url函数
def func_getArtList(request):
    d=func_getPlantData(Corn)
    L,page_total=ArticleHandleCls.wrap_articleList_method(request)   #调用工具类方法
    d = dict(allList=L, page=page_total)   #进行json串行化处理
    s = json.dumps(d)
    return HttpResponse(json.dumps(d))

# #获取文章详情的url函数
def func_getArtById(request):
    d=ArticleHandleCls.wrap_articleDetail_method(request)
    s=json.dumps(d)
    print s
    return HttpResponse(json.dumps(d))


#物种工具类
class PlantUtils(object):
    @classmethod
    def ret_timeOrderByPrice(self,db_obj):
        return [float(db_obj.timestp),db_obj.price]
    @classmethod
    def ret_timeOrderByScale(self,db_obj):
        return [float(db_obj.timestp),db_obj.scale]
    @classmethod
    def ret_timeOrderByProduction(self,db_obj):
        return [float(db_obj.timestp),db_obj.production]
#Switch工具类
class switch(object):
	def __init__(self, value):
		self.value = value
		self.fall = False
	def __iter__(self):
		"""Return the match method once, then stop"""
		yield self.match
		raise StopIteration
	def match(self, *args):
		"""Indicate whether or not to enter a case suite"""
		if self.fall or not args:
			return True
		elif self.value in args: # changed for v1.5, see below
			self.fall = True
			return True
		else:
			return False
#返回物种的数据函数
def func_getPlantData(db_obj):
    temp_obj=db_obj.objects.all()
    priceList=[]; scaleList=[]; productionList=[] #生成dict对象
    for iter in temp_obj:
        priceList.append(PlantUtils.ret_timeOrderByPrice(iter))
        scaleList.append(PlantUtils.ret_timeOrderByScale(iter))
        productionList.append(PlantUtils.ret_timeOrderByProduction(iter))
    return dict(price=priceList,scale=scaleList,production=productionList)
#获取物种类型画出k线图
def func_getChartData(request):
    plantType=request.GET['plantName']
    for case in switch(plantType):
        if case('corn'):
            d=json.dumps(func_getPlantData(Corn))
            break
        if case('pea'): #黄豆
            d=json.dumps(func_getPlantData(Pea))
            break
        if case('wheat'): #小麦
            d=json.dumps(func_getPlantData(Wheat))
            break
        if case('camphor'): #香樟
            d=json.dumps(func_getPlantData(Camphor))
            break
        if case('osmanthus'): #桂花
            d=json.dumps(func_getPlantData(Osmanthus))
            break
        if case('ginkgo'): #银杏
            d= json.dumps(func_getPlantData(Ginkgo))
            break
        if case('Lagerstroemia_indica'): #紫薇
            d= json.dumps(func_getPlantData(LagerstroemiaIndica))
            break
        if case('Hackberry'): #朴树
            d= json.dumps(func_getPlantData(Hackberry))
            break
        if case('cedar'): #雪松
            d= json.dumps(func_getPlantData(Cedar))
            break
        if case('daye_privet'): #大叶女贞
            d= json.dumps(func_getPlantData(DayePrivet))
            break
        if case('podocarpus'): #罗汉松
            d= json.dumps(func_getPlantData(Podocarpus))
            break
        if case('Photinia_fruticosa'): #红叶石楠
            d= json.dumps(func_getPlantData(PhotiniaFruticosa))
            break
        if case('redwood'): #红继木
            d= json.dumps(func_getPlantData(Redwood))
            break
        if case('Privet_of_Kingson'): #金森女贞
            d= json.dumps(func_getPlantData(PhotiniaFruticosa))
            break
        if case('pittosporum'): #海桐
            d= json.dumps(func_getPlantData(Pittosporum))
            break
        if case('france_green'): #法青
            d= json.dumps(func_getPlantData(FranceGreen))
            break
        if case(): # 默认
            print "Error PlantType"
            d=None
    return HttpResponse(d)

#返回猪价的数据函数
def func_getPigReturnData(db_obj):
    temp_obj=db_obj.objects.all()
    priceList=[]  #生成dict对象
    for iter in temp_obj:
        priceList.append(PlantUtils.ret_timeOrderByPrice(iter))
    return dict(price=priceList)

#获取猪价系统数据画出k线图
def func_getPigData(request):
    PigType=request.GET['pigName']
    for case in switch(PigType):
        if case('feed_corn'): #分饲玉米
            d=json.dumps(func_getPigReturnData(FeedCorn))
            break
        if case('soybean_meal'): #豆粕
            d=json.dumps(func_getPigReturnData(SoybeanMeal))
            break
        if case('outside_pig'): #外三元猪
            d=json.dumps(func_getPigReturnData(OutsidePig))
            break
        if case('inside_pig'): #内三元猪
            d=json.dumps(func_getPigReturnData(InsidePig))
            break
        if case('mixed_pig'): #土杂猪
            d=json.dumps(func_getPigReturnData(MixedPig))
            break
        if case(): # 默认
            print "Error PigtType"
            d=None
    return HttpResponse(d)
