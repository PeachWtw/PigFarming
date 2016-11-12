var app = angular
	.module(
		'productionControl', ['ngRoute'],
		function($httpProvider) { // ngRoute引入路由依赖
			$httpProvider.defaults.headers.put['Content-Type'] = 'application/x-www-form-urlencoded';
			$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';

			$httpProvider.defaults.transformRequest = [function(data) {
				var param = function(obj) {
					var query = '';
					var name, value, fullSubName, subName, subValue, innerObj, i;

					for(name in obj) {
						value = obj[name];

						if(value instanceof Array) {
							for(i = 0; i < value.length; ++i) {
								subValue = value[i];
								fullSubName = name + '[' + i + ']';
								innerObj = {};
								innerObj[fullSubName] = subValue;
								query += param(innerObj) + '&';
							}
						} else if(value instanceof Object) {
							for(subName in value) {
								subValue = value[subName];
								fullSubName = name + '[' + subName +
									']';
								innerObj = {};
								innerObj[fullSubName] = subValue;
								query += param(innerObj) + '&';
							}
						} else if(value !== undefined &&
							value !== null) {
							query += encodeURIComponent(name) + '=' +
								encodeURIComponent(value) + '&';
						}
					}

					return query.length ? query.substr(0,
						query.length - 1) : query;
				};

				return angular.isObject(data) &&
					String(data) !== '[object File]' ? param(data) :
					data;
			}];
		});

app.run(['$rootScope', '$location', function($rootScope, $location) {
	$rootScope.$on('$routeChangeSuccess', function(evt, next, previous) {
		console.log('路由跳转成功');
		$rootScope.$broadcast('reGetData');
	});
}]);

// 路由配置
app
	.config([
		'$routeProvider',
		function($routeProvider) {
			$routeProvider
				.when(
					'/pigFarmManagement', {
						templateUrl: '/static/html/productionControl/articleList.html',
						controller: 'productionControlController'
					})
				.when(
					'/breedManagement', {
						templateUrl: '/static/html/productionControl/articleList.html',
						controller: 'productionControlController'
					})
				.when(
					'/feedManagement', {
						templateUrl: '/static/html/productionControl/articleList.html',
						controller: 'productionControlController'
					})
				.when(
					'/dailyManagement', {
						templateUrl: '/static/html/productionControl/articleList.html',
						controller: 'productionControlController'
					})
				.when(
					'/articleDetail', {
						templateUrl: '/static/html/productionControl/articleDetail.html',
						controller: 'productionControlController'
					})
                .when(
					'/chartPage', {
						templateUrl: '/static/html/productionControl/chartPage.html',
						controller: 'productionControlController'
					})
		}
	]);
app.constant('baseUrl', '/static/');
app.factory('services', ['$http', 'baseUrl', function($http, baseUrl) {
	var services = {};
    //根据文章类型获取文章列表
    services.getArtList = function(data) {
		console.log("请求数据"+JSON.stringify(data));
		return $http({
			method: 'get',
			url: '/pig/article/getArtList/',
			params: data
		});
	};
    //根据文章id获取文章的详细内容
    services.getArtById = function(data) {
		console.log("请求数据"+JSON.stringify(data));
		return $http({
			method: 'get',
			url: '/pig/article/getArtById/',
			params: data
		});
	};
    //获取K线图所需的数据
	services.getData = function(){
		return $http({
			method: 'get',
			url: '/pig/getData/'
		});
	}

	return services;
}]);

app.controller('productionControlController', [
	'$scope',
	'services',
	'$location',
	function($scope, services, $location) {
		// 养殖
		var productionControl = $scope;
        //获取文章列表分页
        productionControl.getArtList = function(page,articleType) {
				services.getArtList({
                    //'articleType':artType,
                    //更改了这个部分！！！！
                    articleType : articleType,
					page : page
				}).success(function(data) {
					productionControl.articles = data.allList;
					productionControl.totalPage = data.page;
				});
			};

        //获取文章详细内容
        productionControl.getArticleDetail = function() {
            var articleId = this.art.bi_id;
            console.log("获取文章id："+articleId)
			services.getArtById({
                'articleId':articleId
            }).success(function(data) {
				productionControl.article = data;
			});
		};
        //页面初始化时获取文章列表，含分页
        function getArticleList(articleType){
            services.getArtList({
                    //'articleType':'pigFarmManagement',
                    //更改了这个部分！！！！
                    'articleType':articleType,
                    'page':'1'
                }).success(function(data) {
                    productionControl.articles = data.allList;
                    productionControl.totalPage = data.page;
                    console.log("直接打印返回的数据："+productionControl.articles)
                    console.log("直接打印返回的数据："+productionControl.totalPage)
                    var $pages = $(".tcdPageCode");
                    if ($pages.length != 0) {
							$pages.createPage({
								pageCount : productionControl.totalPage,
								current : 1,
								backFn : function(p) {
                                    //更改了这个部分！！！！
									productionControl.getArtList(p,articleType);// 点击页码时获取第p页的数据
								}
							});
						}
                    //productionControl.articles = jsonParse.arrToJsons(data);
                });
        }
		// 初始化页面信息
		function initData() {
			console.log("初始化页面信息");
			if($location.path().indexOf('/pigFarmManagement') == 0) { //猪场管理
                getArticleList("pigFarmManagement");
			} else if($location.path().indexOf('/breedManagement') == 0) {//繁育管理
				getArticleList("breedManagement");
			} else if($location.path().indexOf('/feedManagement') == 0) {//饲养管理
				getArticleList("feedManagement");
			} else if($location.path().indexOf('/dailyManagement') == 0) {//日常管理
				getArticleList("dailyManagement");
			} else if($location.path().indexOf('/articleDetail') == 0) {//文章内容详情
				getArticleList("articleDetail");
			} else if($location.path().indexOf('/chartPage') == 0) {
				services.getData().success(function(data) {
                    var arr = data.trim().split(" ");
			        var dataArr = [];
			        for(var i=0;i<arr.length/2;i++){
				        var temp = [];
				        temp[0]=+arr[2*i];
				        temp[1]=+arr[2*i+1];
				        dataArr[i]=temp;
			        }
			        console.log(dataArr);
					var initData = {
						title:'呵呵呵呵',
						subtitle:'网址: www.hehe.com',
						//xScale:['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec','lyy', 'Nov', 'Dec'],
						yTitle:'温度 (°C)',
						valueSuffix:'°C',
						series: {name:'北京',data:dataArr
						}
					}
					var chart = new Chart(initData);
					chart.init();
				});

		    }
		}
		initData();
	}
]);
