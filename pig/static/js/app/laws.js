var app = angular
	.module(
		'laws', ['ngRoute'],
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
					'/lawsEnvironment', {
						templateUrl: '/static/html/laws/articleList.html',
						controller: 'lawsController'
					})
				.when(
					'/projectEnvironment', {
						templateUrl: '/static/html/laws/articleList.html',
						controller: 'lawsController'
					})
				.when(
					'/facilityEnvironment', {
						templateUrl: '/static/html/laws/articleList.html',
						controller: 'lawsController'
					})
				.when(
					'/articleDetail', {
						templateUrl: '/static/html/laws/articleDetail.html',
						controller: 'lawsController'
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

app.controller('lawsController', [
	'$scope',
	'services',
	'$location',
	function($scope, services, $location) {
		// 养殖
		var lawsController = $scope;
        //获取文章列表分页
        lawsController.getArtList = function(page,articleType) {
				services.getArtList({
                    articleType : articleType,
					page : page
				}).success(function(data) {
					lawsController.articles = data.allList;
                    for(var i=0;i<lawsController.articles.length;i++){
                        var time = lawsController.articles[i].publish_time;
                        lawsController.articles[i].publish_time = time.substring(0,time.indexOf("T"));
                        lawsController.articles[i].src_img = decodeURIComponent(lawsController.articles[i].src_img);
                    }
					lawsController.totalPage = data.page;
				});
			};

        //获取文章详细内容
        lawsController.getArticleDetail = function () {
            var articleId = this.art.env_id;
            window.sessionStorage.setItem('artId', articleId);
            console.log("获取文章id：" + articleId)

        };
        //页面初始化时获取文章列表，含分页
        function getArticleList(articleType){
            services.getArtList({
                    'articleType':articleType,
                    'page':'1'
                }).success(function(data) {
                    lawsController.articles = data.allList;
                    for(var i=0;i<lawsController.articles.length;i++){
                        var time = lawsController.articles[i].publish_time;
                        lawsController.articles[i].publish_time = time.substring(0,time.indexOf("T"));
                        lawsController.articles[i].src_img = decodeURIComponent(lawsController.articles[i].src_img);
                    }
                    lawsController.totalPage = data.page;
                    var $pages = $(".tcdPageCode");
                    if ($pages.length != 0) {
							$pages.createPage({
								pageCount : lawsController.totalPage,
								current : 1,
								backFn : function(p) {
                                 	lawsController.getArtList(p,articleType);// 点击页码时获取第p页的数据
								}
							});
						}
                    //productionControl.articles = jsonParse.arrToJsons(data);
                });
        }
		// 初始化页面信息
		function initData() {
			console.log("初始化页面信息");
			if($location.path().indexOf('/lawsEnvironment') == 0) { //养殖排污法规
                $("#secUrl").html("养殖排污法规");
                getArticleList("lawsEnvironment");
                sessionStorage.setItem("secondary","lawsEnvironment");
			} else if($location.path().indexOf('/projectEnvironment') == 0) {//先进治污方案
				$("#secUrl").html("先进治污方案");
                getArticleList("projectEnvironment");
                sessionStorage.setItem("secondary","projectEnvironment");
			} else if($location.path().indexOf('/facilityEnvironment') == 0) {//设施工艺
				$("#secUrl").html("设施工艺");
                getArticleList("facilityEnvironment");
                sessionStorage.setItem("secondary","facilityEnvironment");
			} else if ($location.path().indexOf('/articleDetail') == 0) {//文章内容详情
                var secondaryUrl = sessionStorage.getItem("secondary");
                var secondaryUrlA = $("#secondaryUrl");
                switch (secondaryUrl){
                    case "lawsEnvironment":{
                        secondaryUrlA.attr("href","/static/html/laws/index.html#/lawsEnvironment");
                        secondaryUrlA.html("养殖排污法规");
                        break;
                    }
                    case "projectEnvironment":{
                        secondaryUrlA.attr("href","/static/html/laws/index.html#/projectEnvironment");
                        secondaryUrlA.html("先进治污方案");
                        break;
                    }
                    case "facilityEnvironment":{
                        secondaryUrlA.attr("href","/static/html/laws/index.html#/facilityEnvironment");
                        secondaryUrlA.html("设施工艺");
                        break;
                    }

                }
                var articleId = window.sessionStorage.getItem('artId');
                services.getArtById({
                    'articleId': articleId
                }).success(function (data) {
                    console.log(data);
                    lawsController.article = data;
                    var time = lawsController.article.publish_time;
                    lawsController.article.publish_time = time.substring(0,time.indexOf("T"));
                    lawsController.article.content = decodeURIComponent(lawsController.article.content);
                    lawsController.article.src_img = decodeURIComponent(lawsController.article.src_img);
                    $("#art-content").html(lawsController.article.content);
                });
            }
        }

        initData();
    }
]);
