var app = angular
	.module(
		'trends', ['ngRoute'],
		function($httpProvider) { // ngRoute引入路由依赖
			$httpProvider.defaults.headers.put['Content-Type'] = 'application/x-www-form-urlencoded';
			$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';

			// Override $http service's default transformRequest
			$httpProvider.defaults.transformRequest = [function(data) {
				/**
				 * The workhorse; converts an object to
				 * x-www-form-urlencoded serialization.
				 * 
				 * @param {Object}
				 *            obj
				 * @return {String}
				 */
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
		//console.log('路由跳转成功');
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
					'/current', {
						templateUrl: '/static/html/trends/articleList.html',
						controller: 'trendsController'
					})
				.when(
					'/tendency', {
						templateUrl: '/static/html/trends/articleList.html',
						controller: 'trendsController'
					})
				.when(
					'/feedstuff', {
						templateUrl: '/static/html/trends/articleList.html',
						controller: 'trendsController'
					})
				.when(
					'/futures', {
						templateUrl: '/static/html/trends/articleList.html',
						controller: 'trendsController'
					})
				.when(
					'/articleDetail', {
						templateUrl: '/static/html/trends/articleDetail.html',
						controller: 'trendsController'
					})

		}
	]);
app.constant('baseUrl', '/static/');
app.factory('services', ['$http', 'baseUrl', function($http, baseUrl) {
	var services = {};
    //根据文章类型获取文章列表
    services.getArtList = function(data) {
		//console.log("请求数据"+JSON.stringify(data));
		return $http({
			method: 'get',
			url: '/pig/article/getArtList/',
			params: data
		});
	};
    //根据文章id获取文章的详细内容
    services.getArtById = function(data) {
		//console.log("请求数据"+JSON.stringify(data));
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

app.controller('trendsController', [
	'$scope',
	'services',
	'$location',
	function($scope, services, $location) {
		// 养殖
		var trendsController = $scope;
        //获取文章列表分页
        trendsController.getArtList = function(page,articleType) {
				services.getArtList({
                    articleType : articleType,
					page : page
				}).success(function(data) {
					trendsController.articles = data.allList;
                    for(var i=0;i<trendsController.articles.length;i++){
                    var time = trendsController.articles[i].publish_time;
                    trendsController.articles[i].publish_time = time.substring(0,time.indexOf("T"));
                    trendsController.articles[i].src_img = decodeURIComponent(trendsController.articles[i].src_img);
                }
					trendsController.totalPage = data.page;
				});
			};

        //获取文章详细内容
        trendsController.getArticleDetail = function () {
            var articleId = this.art.tr_id;
            window.sessionStorage.setItem('artId', articleId);
            //console.log("获取文章id：" + articleId)

        };
        //页面初始化时获取文章列表，含分页
        function getArticleList(articleType){
            services.getArtList({
                    'articleType':articleType,
                    'page':'1'
                }).success(function(data) {
                    trendsController.articles = data.allList;
                for(var i=0;i<trendsController.articles.length;i++){
                    var time = trendsController.articles[i].publish_time;
                    trendsController.articles[i].publish_time = time.substring(0,time.indexOf("T"));
                    trendsController.articles[i].src_img = decodeURIComponent(trendsController.articles[i].src_img);
                }
                    trendsController.totalPage = data.page;
                    //console.log("直接打印返回的数据："+trendsController.articles)
                    //console.log("直接打印返回的数据："+trendsController.totalPage)
                    var $pages = $(".tcdPageCode");
                    if ($pages.length != 0) {
							$pages.createPage({
								pageCount : trendsController.totalPage,
								current : 1,
								backFn : function(p) {
                                    trendsController.getArtList(p,articleType);// 点击页码时获取第p页的数据
								}
							});
						}
                    //productionControl.articles = jsonParse.arrToJsons(data);
                });
        }
		// 初始化页面信息
		function initData() {
			//console.log("初始化页面信息");
			if($location.path().indexOf('/current') == 0) { //国际同行现状
                $("#secUrl").html("国际同行现状");
                getArticleList("currentInternational");
                sessionStorage.setItem("secondary","current");
			} else if($location.path().indexOf('/tendency') == 0) {//前沿趋势
				$("#secUrl").html("前沿趋势");
                getArticleList("trendInternational");
                sessionStorage.setItem("secondary","tendency");
			} else if($location.path().indexOf('/feedstuff') == 0) {//饲料原料行情走势
				$("#secUrl").html("饲料原料行情走势");
                getArticleList("feedInternational");
                sessionStorage.setItem("secondary","feedstuff");
			} else if($location.path().indexOf('/futures') == 0) {//玉米大豆期货走势
				$("#secUrl").html("玉米大豆期货走势");
                getArticleList("futuresInternational");
                sessionStorage.setItem("secondary","futures");
			} else if ($location.path().indexOf('/articleDetail') == 0) {//文章内容详情
                var secondaryUrl = sessionStorage.getItem("secondary");
                var secondaryUrlA = $("#secondaryUrl");
                switch (secondaryUrl){
                    case "current":{
                        secondaryUrlA.attr("href","/static/html/trends/index.html#/current");
                        secondaryUrlA.html("国际同行现状");
                        break;
                    }
                    case "tendency":{
                        secondaryUrlA.attr("href","/static/html/trends/index.html#/tendency");
                        secondaryUrlA.html("前沿趋势");
                        break;
                    }
                    case "tendency":{
                        secondaryUrlA.attr("href","/static/html/trends/index.html#/tendency");
                        secondaryUrlA.html("饲料原料行情走势");
                        break;
                    }
                    case "feedstuff":{
                        secondaryUrlA.attr("href","/static/html/trends/index.html#/feedstuff");
                        secondaryUrlA.html("玉米大豆期货走势");
                        break;
                    }
                }
                var articleId = window.sessionStorage.getItem('artId');
                services.getArtById({
                    'articleId': articleId
                }).success(function (data) {
                    trendsController.article = data;
                    var time = trendsController.article.publish_time;
                    trendsController.article.publish_time = time.substring(0,time.indexOf("T"));
                    trendsController.article.content = decodeURIComponent(trendsController.article.content);
                    trendsController.article.src_img = decodeURIComponent(trendsController.article.src_img);
                    $("#art-content").html(trendsController.article.content);
                });
            } else if ($location.path().indexOf('/chartPage') == 0) {
                services.getData().success(function (data) {
                    var arr = data.trim().split(" ");
                    var dataArr = [];
                    for (var i = 0; i < arr.length / 2; i++) {
                        var temp = [];
                        temp[0] = +arr[2 * i];
                        temp[1] = +arr[2 * i + 1];
                        dataArr[i] = temp;
                    }
                    //console.log(dataArr);
                    var initData = {
                        title: '呵呵呵呵',
                        subtitle: '网址: www.hehe.com',
                        //xScale:['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec','lyy', 'Nov', 'Dec'],
                        yTitle: '温度 (°C)',
                        valueSuffix: '°C',
                        series: {name: '北京', data: dataArr
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
