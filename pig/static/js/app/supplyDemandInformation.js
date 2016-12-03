var app = angular
    .module(
    'updateInformationControl', ['ngRoute'],
    function ($httpProvider) { // ngRoute引入路由依赖
        $httpProvider.defaults.headers.put['Content-Type'] = 'application/x-www-form-urlencoded';
        $httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';

        $httpProvider.defaults.transformRequest = [function (data) {
            var param = function (obj) {
                var query = '';
                var name, value, fullSubName, subName, subValue, innerObj, i;

                for (name in obj) {
                    value = obj[name];

                    if (value instanceof Array) {
                        for (i = 0; i < value.length; ++i) {
                            subValue = value[i];
                            fullSubName = name + '[' + i + ']';
                            innerObj = {};
                            innerObj[fullSubName] = subValue;
                            query += param(innerObj) + '&';
                        }
                    } else if (value instanceof Object) {
                        for (subName in value) {
                            subValue = value[subName];
                            fullSubName = name + '[' + subName +
                                ']';
                            innerObj = {};
                            innerObj[fullSubName] = subValue;
                            query += param(innerObj) + '&';
                        }
                    } else if (value !== undefined &&
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

app.run(['$rootScope', '$location', function ($rootScope, $location) {
    $rootScope.$on('$routeChangeSuccess', function (evt, next, previous) {
        //console.log('路由跳转成功');
        $rootScope.$broadcast('reGetData');
    });
}]);

// 路由配置
app
    .config([
        '$routeProvider',
        function ($routeProvider) {
            $routeProvider
                .when(
                '/supplyInformation', {
                    templateUrl: '/static/html/supplyDemandInformation/supplyInformation.html',
                    controller: 'updateInformationController'
                })
                .when(
                '/buyInformation', {
                    templateUrl: '/static/html/supplyDemandInformation/supplyInformation.html',
                    controller: 'updateInformationController'
                })
                .when(
                '/businessInformation', {
                    templateUrl: '/static/html/supplyDemandInformation/supplyInformation.html',
                    controller: 'updateInformationController'
                })

        }
    ]);
app.constant('baseUrl', '/static/');
app.factory('services', ['$http', 'baseUrl', function ($http, baseUrl) {
    var services = {};
    //根据title搜索信息
    services.selectByTitle = function (data) {
        return $http({
            method: 'get',
            url: '/pig/information/selectByTitle/',
            params: data
        });
    };

    //根据文章类型获取文章列表
    services.getInformationList = function (data) {
        //console.log("请求数据" + JSON.stringify(data));
        return $http({
            method: 'get',
            url: '/pig/information/getInformationList/',
            params: data
        });
    };

    return services;
}]);

app.controller('updateInformationController', [
    '$scope',
    'services',
    '$location',
    function ($scope, services, $location) {
        var updateInformation = $scope;

        updateInformation.selectByTitle = function () {
            services.selectByTitle({title: $("#titleInput").val()}).success(function (data) {
                updateInformation.information = data;
            });
        }

        //获取文章列表分页
        updateInformation.getInformationList = function (page, infoType) {
            services.getInformationList({
                infoType: infoType,
                page: page
            }).success(function (data) {
                updateInformation.informations = data.allList;
                updateInformation.totalPage = data.page;
            });
        };

        //页面初始化时获取文章列表，含分页
        function getInformationList(infoType) {
            services.getInformationList({
                'infoType': infoType,
                'page': '1'
            }).success(function (data) {
                updateInformation.informations = data.allList;
                updateInformation.totalPage = data.page;
                var $pages = $(".tcdPageCode");
                if ($pages.length != 0) {
                    $pages.createPage({
                        pageCount: updateInformation.totalPage,
                        current: 1,
                        backFn: function (p) {
                            updateInformation.getInformationList(p, infoType);// 点击页码时获取第p页的数据
                        }
                    });
                }
            });
        }

        // 初始化页面信息
        function initData() {
            //console.log("初始化页面信息");
            if ($location.path().indexOf('/supplyInformation') == 0) {//供应信息
                $("#secUrl").html("供应信息");
                getInformationList("supplyInformation");
            }
            else if ($location.path().indexOf('/buyInformation') == 0) {//求购信息
                $("#secUrl").html("求购信息");
                getInformationList("buyInformation");
            }
            else if ($location.path().indexOf('/businessInformation') == 0) {//商家信息
                $("#secUrl").html("赞助商家");
                getInformationList("businessInformation");
            }
        }

        initData();
    }
]);
