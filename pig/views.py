# -*- coding: utf-8 -*-
from django.shortcuts import render
# Create your views here.
# 异常模块
from pig.ExceptClass import *
import json
import  os
import math
import datetime
import time
import random
import MySQLdb
from django.utils import timezone



import string
from django.http import HttpResponse

#引入model中的全部数据库模块
from pig.models import *
#引入util中的ObjectOrDictFormatter模块
from mysite.utils import ObjectOrDictFormatter

#作为pig的主页显示
def first_page(request):
    return render(request,'index.html')


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
            if "Breeding"  in art_type or "breedImprovement" in art_type\
                    or "nationalPolicy" in art_type:
                temp_obj = db_obj.objects.all()   #养殖模块,育种改良,国家政策特殊处理
            else:
                temp_obj = db_obj.objects.filter(type=art_type)   #获取元组总个数
            # num = map(str, temp_obj)
            # page_total=int(math.ceil(len(num) / 10.0))  #计算总页数
            num=len(temp_obj)
            page_total=int(math.ceil(num / 10.0))  #计算总页数
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
        #*********进行不同的数据库表匹配*************
        if  "Management" in article_type: #生产管理，动保防疫
            L, cnt = cls.func_handle_artList(request,ProductionControl,int(page),article_type)
        elif "Environment" in article_type: #生态环境，排污处理
            L, cnt = cls.func_handle_artList(request,Environment, int(page),article_type)
        elif "International" in article_type: #国际动态，行情趋势
            L, cnt = cls.func_handle_artList(request,Trend, int(page),article_type)
        elif "pigBreeding" in article_type: #养殖-猪
            L, cnt = cls.func_handle_artList(request,Breedpig, int(page),article_type)
        elif "chickenBreeding" in article_type: #养殖-鸡
            L, cnt = cls.func_handle_artList(request,Breedchicken, int(page),article_type)
        elif "fishBreeding" in article_type: #养殖-鱼
            L, cnt = cls.func_handle_artList(request,Breedfish, int(page),article_type)
        elif "breedImprovement" in article_type: #育种改良
            L, cnt = cls.func_handle_artList(request,BreedImprovement, int(page),article_type)
        elif "nationalPolicy" in article_type: #国家政策
            L, cnt = cls.func_handle_artList(request,NationalPolicy, int(page),article_type)
        elif "其他接口" in article_type:
            pass
        else:
            L,cnt=None,None
        return  L,cnt
    # 处理点击次数加1的方法
    @classmethod
    def func_handle_artDetail_clicktimesAdd(cls,d_obj,id,index_id,L):
        temp_obj=d_obj.res_idObj(id)#这个是每个类获取的特定id项的值
        temp_obj.click_times=temp_obj.click_times+1
        temp_obj.save()
        for k in L:
            if int(k[index_id])==int(id):
                return k
            else:
                continue
        return  None
    # #获取文章详情的方法
    @classmethod
    def wrap_articleDetail_method(cls,request):
        index_id = request.GET['articleId']  #从request获取所需参数
        art_type=request.session['StoreArticleType']    #利用Session文章类型
        L=request.session.get('tableData')  #从Session获取表中的数据
        #*********进行不同的数据库表匹配**************
        if "Management" in art_type:  #生产管理，动保防疫
            return cls.func_handle_artDetail_clicktimesAdd(ProductionControl,index_id,"pc_id",L)
        elif "Environment" in art_type: #生态环境，排污处理
            return  cls.func_handle_artDetail_clicktimesAdd(Environment,index_id,"env_id",L)
        elif "International" in art_type:  #国际动态，行情趋势
            return  cls.func_handle_artDetail_clicktimesAdd(Trend,index_id,"tr_id",L)
        elif "pigBreeding" in art_type: #养殖-猪
            return  cls.func_handle_artDetail_clicktimesAdd(Breedpig,index_id,"id",L)
        elif "chickenBreeding" in art_type: #养殖-鸡
            return  cls.func_handle_artDetail_clicktimesAdd(Breedchicken,index_id,"id",L)
        elif "fishBreeding" in art_type: #养殖-鱼
            return  cls.func_handle_artDetail_clicktimesAdd(Breedfish,index_id,"id",L)
        elif "breedImprovement" in art_type:
            return  cls.func_handle_artDetail_clicktimesAdd(BreedImprovement,index_id,"bi_id",L)
        elif "nationalPolicy" in art_type: #国家政策特殊处理
              retList=[ k for k in L if int(k['np_id'])==int(index_id) ] #国家政策特殊处理
              return retList[0]
        elif "其他接口" in art_type:
            pass
        else:
            return  None

#-----解决需求6,7,9,10--------
#获取文章列表的url函数
def func_getArtList(request):
    L,page_total=ArticleHandleCls.wrap_articleList_method(request)   #调用工具类方法
    d = dict(allList=L, page=page_total)   #进行json串行化处理
    s = json.dumps(d)
    return HttpResponse(json.dumps(d))

# #获取文章详情的url函数
def func_getArtById(request):
    d=ArticleHandleCls.wrap_articleDetail_method(request)
    s=json.dumps(d)
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
    @classmethod #这里添加处理气候的返回函数
    def ret_timeOrderBytemperature(self,db_obj):#温度
        return [float(db_obj.timestp),db_obj.temperature]
    @classmethod #这里添加处理气候的返回函数
    def ret_timeOrderByhumid(self,db_obj):#湿度
        return [float(db_obj.timestp),db_obj.humid]
    @classmethod #这里添加处理气候的返回函数
    def ret_timeOrderweather(self,db_obj):#天气
        return [float(db_obj.timestp),float(db_obj.weather)]
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
def func_getPigPriceChartData(request):
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

#处理气候的函数
def func_getClimateData(request):
    temp_obj=Climate.objects.all()
    temperatureList=[]; humidList=[]; weatherList=[] #生成dict对象
    for iter in temp_obj:
        temperatureList.append(PlantUtils.ret_timeOrderBytemperature(iter))
        humidList.append(PlantUtils.ret_timeOrderByhumid(iter))
        weatherList.append(PlantUtils.ret_timeOrderweather(iter))
    return HttpResponse(json.dumps(dict(temperature=temperatureList, humid=humidList,weather=weatherList)))




#添加保存文章列表
def func_addArticle(request): #添加保存文章列表
    #title   type1     type2     abstract     imgUrl     content
    #******从request获取所需参数**********
    title = request.POST['title']    #标题
    table=request.POST['type1']  #表名
    art_type=request.POST['type2']   #文章类型
    abstract=request.POST['abstract']   #文章摘要
    src_img=request.POST['imgUrl']   #图片url
    content=request.POST['content']   #文章内容
    request.session['table_data']=[title,table,art_type,\
                                   abstract,src_img,content]#保存给后面的uploadPic函数使用
    return  HttpResponse("正在保存")


#获取站点的访问次数
def func_getVisits(request):
    p=Visits.objects.get(id=1)
    p.times=p.times+1
    p.save()
    return HttpResponse(str(p.times))


#获取新的id号存入文章(废弃)
def func_getNewId(db_obj):
    allObjList=db_obj.objects.all()
    maxId=0
    for temp in allObjList:
        curId=temp.ret_idVal()
        if curId>maxId:
            maxId=curId
    return maxId+1

#保存文章到数据中的函数
def func_saveDataIntoArticle(db_obj,title,art_type,abstract,src_img,content):
    #p.save(force_insert=True)
    p=db_obj(title=title,abstract=abstract,content=content,\
             publish_time=timezone.now(),click_times=0,\
             src_img=src_img,type=art_type)
    p.save()
    # p.title=title
    # p.abstract=abstract
    # p.content=content
    # p.publish_time=timezone.now()
    # p.click_times=0
    # p.src_img=src_img
    # p.type=art_type

#上传图片
def func_uploadPic(request):
    title,table,art_type,abstract,src_img,content=request.session['table_data']#取出各项表的数据
    try:
        if request.method=='POST':
            f=request.FILES['picfile'];
            n=str(request.FILES['picfile']);
            src_img=upload(request.FILES['picfile'],str(request.FILES['picfile']))
        for case in switch(table):
            if case('BreedPig'): #养猪
                func_saveDataIntoArticle(Breedpig,title,art_type,abstract,src_img,content)
                break
            if case('BreedChicken'): #养鸡
                func_saveDataIntoArticle(Breedchicken,title,art_type,abstract,src_img,content)
                break
            if case('BreedFish'): #养鱼
                func_saveDataIntoArticle(Breedfish,title,art_type,abstract,src_img,content)
                break
            if case('NationalPolicy'): #国家政策
                p=NationalPolicy(title=title,content=content)
                p.save(force_insert=True)
                break
            if case('ProductionControl'): #生产管理，动保防疫
                func_saveDataIntoArticle(ProductionControl,title,art_type,abstract,src_img,content)
                break
            if case('BreedImprovement'): #育种改良
                func_saveDataIntoArticle(BreedImprovement,title,art_type,abstract,src_img,content)
                break
            if case('Environment'): #生态环境，排污处理
                func_saveDataIntoArticle(Environment,title,art_type,abstract,src_img,content)
                break
            if case('Trend'): #国际动态，行情走势
                func_saveDataIntoArticle(Trend,title,art_type,abstract,src_img,content)
                break
            if case(): # 默认
                print "Error PlantType"
        return HttpResponse("保存成功") #
    except BaseException,e:
        return HttpResponse("保存失败")


def upload(file,filename):
    if not os.path.exists('pig/static/upload/'):
        os.mkdir('pig/static/upload/')
    path='../../upload/'+filename
    with open('pig/static/upload/'+filename,'wb+') as destination:
        for chunk in file.chunks():
            destination.write(chunk)
    return path

#随机产生k线图数据（其中时间参数还不能按需设置）
def generateTimestp(db_obj,priceFlag=False,scaleFlag=False,productionFlag=False,climateFlag=False):

    for ti in range(1,31):
        dateC1=datetime(2016,11,ti,15,55,00)
        timestamp2=time.mktime(dateC1.timetuple())
        if priceFlag:
            p=db_obj(timestp=timestamp2,price=random.uniform(0,1))
        if scaleFlag:
            p.scale=random.uniform(0,1)
        if productionFlag:
            p.production=random.uniform(0,1)
        if climateFlag:
            p=db_obj(timestp=timestamp2,temperature=random.uniform(0,40),\
                     humid=random.uniform(0,100),weather=random.uniform(0,1))
        if priceFlag and scaleFlag and productionFlag and climateFlag:
           return None
        p.save()


def func_wrap_getInformationList(db_obj,page,request,infoType):
    temp_obj=db_obj.objects.filter(isDelete=0).order_by('-priority')
    num=len(temp_obj)
    page_total=int(math.ceil(num / 10.0))  #计算总页数
    index_low = (page - 1) * 10
    index_high = page * 10
    filter_list=temp_obj.all()[index_low:index_high]
    L = []  #生成dict对象
    for iter in filter_list:
        L.append(iter.res_dict())
    request.session['StoreInfoType']=infoType    #利用Session供求类型
    request.session['InformationData']=L  #利用Session存储表的数据
    return L, page_total
#功能：获取信息列表
def func_getInformationList(request):
    try:
        infoType=request.GET['infoType']#信息类型
        page=request.GET['page']#页数
        for case in switch(infoType):
                if case('supplyInformation'): #供应信息
                    L, page_total=func_wrap_getInformationList(supplyInformation,int(page),request,infoType)
                    break
                if case('buyInformation'): #求购信息
                    L, page_total=func_wrap_getInformationList(buyInformation,int(page),request,infoType)
                    break
                if case('businessInformation'): #赞助商家信息
                    L, page_total=func_wrap_getInformationList(businessInformation,int(page),request,infoType)
                    break
        d = dict(allList=L, page=page_total)   #进行json串行化处理
        return HttpResponse(json.dumps(d))
    except BaseException,e:
        return HttpResponse('获取失败')

#添加信息
def func_wrap_addInformation(db_obj, info):
    p=db_obj(title=info['title'],url=info['url'],priority=info['priority'],isDelete=0)
    p.save(force_insert=True)

def func_addInformation(request):
    try:
        information=request.GET['information']
        infoDict=json.loads(information)   #利用Session供求类型
        infoType=infoDict['type']
        for case in switch(infoType):
            if case('supplyInformation'): #供应信息
                d=func_wrap_addInformation(supplyInformation,infoDict)
                break
            if case('buyInformation'): #求购信息
                d=func_wrap_addInformation(buyInformation,infoDict)
                break
            if case('businessInformation'): #赞助商家信息
                d=func_wrap_addInformation(businessInformation,infoDict)
                break
        return HttpResponse('1')
    except BaseException,e:
        return HttpResponse('0')


def func_wrap_selectByTitle(db_obj,title):
    conn=MySQLdb.Connect(
                    host='127.0.0.1',
                    port=3306,
                    user='wtw',
                    passwd='123456',
                    db='superpig',
                    charset='utf8'
                    )
    cursor=conn.cursor()
    sql="SELECT * FROM pig_supplyInformation WHERE title LIKE '%{!s}%' and isDelete=0 order  by priority desc ;".format(title)
    cursor.execute(sql)
    T = []  #生成dict对象
    T=cursor.fetchall()
    cursor.close()
    conn.close()
    L = []  #生成dict对象
    for iter in T:
        L.append(dict(id=iter[0],title=iter[1],url=iter[2],priority=iter[3]))
    return  L
#通过title查找信息
def func_selectByTitle(request):
    title=request.GET['title']
    infoType=request.session['StoreInfoType']    #利用Session供求类型
    for case in switch(infoType):
        if case('supplyInformation'): #供应信息
            d=func_wrap_selectByTitle(supplyInformation,title)
            break
        if case('buyInformation'): #求购信息
            d=func_wrap_selectByTitle(buyInformation,title)
            break
        if case('businessInformation'): #赞助商家信息
            d=func_wrap_selectByTitle(businessInformation,title)
            break
    return HttpResponse(json.dumps(d))

#通过id删除信息
def func_wrap_deleteInfoById(db_obj, index):
    db_obj.objects.filter(id=index).update(isDelete=1)

def func_deleteInfoById(request):
    try:
        deleteId=int(request.GET['id'])
        infoType=request.session['StoreInfoType']    #利用Session供求类型
        for case in switch(infoType):
            if case('supplyInformation'): #供应信息
                d=func_wrap_deleteInfoById(supplyInformation,deleteId)
                break
            if case('buyInformation'): #求购信息
                d=func_wrap_deleteInfoById(buyInformation,deleteId)
                break
            if case('businessInformation'): #赞助商家信息
                d=func_wrap_deleteInfoById(businessInformation,deleteId)
                break
        return HttpResponse('删除成功')
    except BaseException,e:
        return HttpResponse('删除失败')

#通过id更新信息
def func_updateInfoById(request):
    pass