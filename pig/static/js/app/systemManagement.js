var app = angular
	.module(
		'systemManagement', ['ngRoute'],
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
					'/addArticle', {
						templateUrl: '/static/html/systemManagement/addArticle.html',
						controller: 'systemManagementController'
					})
                .when(
					'/BreedManagement', {
						templateUrl: '/static/html/systemManagement/addArticle.html',
						controller: 'systemManagementController'
					})
		}
	]);
app.constant('baseUrl', '/CIMS/');
app.factory('services', ['$http', 'baseUrl', function($http, baseUrl) {
	var services = {};
	services.getContractList = function(data) {
		/* console.log("发送请求获取合同信息"); */
		return $http({
			method: 'post',
			url: baseUrl + 'contract/getContractList.do',
			data: data
		});
	};

	return services;
}]);

app.controller('systemManagementController', [
	'$scope',
	'services',
	'$location',
	function($scope, services, $location) {
		// 养殖
		var system = $scope;
		// 初始化页面信息
		function initData() {
			if($location.path().indexOf('/addArticle') == 0) { // 如果是添加文章页
                console.log("添加文章");

			} else if($location.path().indexOf('/BreedManagement') == 0) {
                $('#addArticle').css('display','none');
			} else if($location.path().indexOf('/feedManagement') == 0) {
				 $('#addArticle').css('display','none');
			}
		}

		initData();

	}
]);

// 合同状态过滤器
app.filter('conState', function() {
	return function(input) {
		var state = "";
		if(input == "0")
			state = "在建";
		else if(input == "1")
			state = "竣工";
		else if(input == "2")
			state = "停建";
		return state;
	}
});

app.directive('onFinishRenderFilters', function ($timeout) {
    return {
        restrict: 'A',
        link: function(scope, element, attr) {
            console.log($('#content'))


        }
    };
});