var app = angular
	.module(
		'produce', ['ngRoute'],
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
					'/pig', {
						templateUrl: '/static/html/produce/article.html',
						controller: 'ProduceController'
					})
				.when(
					'/chicken', {
						templateUrl: '/static/html/produce/article.html',
						controller: 'ProduceController'
					})
				.when(
					'/fish', {
						templateUrl: '/static/html/produce/article.html',
						controller: 'ProduceController'
					})
				.when(
					'/articleDetail', {
						templateUrl: '/static/html/produce/articleDetail.html',
						controller: 'ProduceController'
					})

		}
	]);
app.constant('baseUrl', '/CIMS/');
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

	return services;
}]);

app.controller('ProduceController', [
	'$scope',
	'services',
	'$location',
	function($scope, services, $location) {
		// 养殖
		var produce = $scope;

        //获取文章详细内容
        produce.getArticleDetail = function() {
            var articleId = this.art.bi_id;
            window.sessionStorage.setItem('artId', articleId);
            console.log("获取文章id：" + articleId)
		};
        //页面初始化时获取文章列表，含分页
        function getArticleList(articleType) {
            services.getArtList({
                //'articleType':'pigFarmManagement',
                //更改了这个部分！！！！
                'articleType': articleType,
                'page': '1'
            }).success(function (data) {
                console.log(data);
                produce.articles = data.allList;
                produce.totalPage = data.page;
                var $pages = $(".tcdPageCode");
                if ($pages.length != 0) {
                    $pages.createPage({
                        pageCount: produce.totalPage,
                        current: 1,
                        backFn: function (p) {
                            produce.getArtList(p, articleType);// 点击页码时获取第p页的数据
                        }
                    });
                }
                //productionControl.articles = jsonParse.arrToJsons(data);
            });
        }

		// 初始化页面信息
		function initData() {
			console.log("初始化页面信息");

			if($location.path().indexOf('/pig') == 0) { // 如果是合同列表页
				getArticleList("pigBreeding");
			} else if($location.path().indexOf('/chicken') == 0) {
				getArticleList("chickenBreeding");
			} else if($location.path().indexOf('/fish') == 0) {
				getArticleList("fishBreeding");
			} else if($location.path().indexOf('/articleDetail') == 0) {
                var articleId = window.sessionStorage.getItem('artId');
                services.getArtById({
                    'articleId': articleId
                }).success(function (data) {
                    console.log(data);
                    produce.article = data;
                });
			}
		}

		initData();

	}
]);
