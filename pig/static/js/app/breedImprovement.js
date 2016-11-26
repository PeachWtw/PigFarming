var app = angular
	.module(
		'breedImprovement', ['ngRoute'],
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
					'/', {
						templateUrl: '/static/html/breedImprovement/articleList.html',
						controller: 'breedImprovementController'
					})
				.when(
					'/articleDetail', {
						templateUrl: '/static/html/breedImprovement/articleDetail.html',
						controller: 'breedImprovementController'
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

app.controller('breedImprovementController', [
	'$scope',
	'services',
	'$location',
	function($scope, services, $location) {
		// 养殖
		var breedImprovement = $scope;
        //获取文章列表分页
        breedImprovement.getArtList = function(page,articleType) {
				services.getArtList({
                    articleType : articleType,
					page : page
				}).success(function(data) {
					breedImprovement.articles = data.allList;
					breedImprovement.totalPage = data.page;
				});
			};

        //获取文章详细内容
        breedImprovement.getArticleDetail = function () {
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
                    breedImprovement.articles = data.allList;
                    breedImprovement.totalPage = data.page;
                    console.log("直接打印返回的数据："+breedImprovement.articles)
                    console.log("直接打印返回的数据："+breedImprovement.totalPage)
                    var $pages = $(".tcdPageCode");
                    if ($pages.length != 0) {
							$pages.createPage({
								pageCount : breedImprovement.totalPage,
								current : 1,
								backFn : function(p) {
                                 	breedImprovement.getArtList(p,articleType);// 点击页码时获取第p页的数据
								}
							});
						}
                });
        }
		// 初始化页面信息
		function initData() {
			console.log("初始化页面信息");
            if($location.path().indexOf('/') == 0) {//育种改良
				getArticleList("breedImprovement");
			} else if ($location.path().indexOf('/articleDetail') == 0) {//文章内容详情
                var articleId = window.sessionStorage.getItem('artId');
                services.getArtById({
                    'articleId': articleId
                }).success(function (data) {
                    console.log(data);
                    breedImprovement.article = data;
                });
            }
        }

        initData();
    }
]);
