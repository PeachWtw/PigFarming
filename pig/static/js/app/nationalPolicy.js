/**
 * Created by Liuyawin on 2016/11/24.
 */
var app = angular
    .module(
    'nationalPolicy', ['ngRoute'],
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
        console.log('路由跳转成功');
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
                '/nationalPolicy', {
                    templateUrl: '/static/html/nationalPolicy/articleList.html',
                    controller: 'nationalPolicyController'
                }).when(
                '/climateKLine', {
                    templateUrl: '/static/html/nationalPolicy/climateKLine.html',
                    controller: 'nationalPolicyController'
                }).when(
                '/articleDetail', {
                    templateUrl: '/static/html/nationalPolicy/articleDetail.html',
                    controller: 'nationalPolicyController'
                })
        }
    ]);
app.constant('baseUrl', '/static/');
app.factory('services', ['$http', 'baseUrl', function ($http, baseUrl) {
    var services = {};
    //根据文章类型获取文章列表
    services.getArtList = function (data) {
        console.log("请求数据" + JSON.stringify(data));
        return $http({
            method: 'get',
            url: '/pig/article/getArtList/',
            params: data
        });
    };
    //根据文章id获取文章的详细内容
    services.getArtById = function (data) {
        console.log("请求数据" + JSON.stringify(data));
        return $http({
            method: 'get',
            url: '/pig/article/getArtById/',
            params: data
        });
    };
    //获取气候K线图所需的数据
    services.getClimateData = function () {
        return $http({
            method: 'get',
            url: '/pig/climate/getClimateData/'
        });
    }

    return services;
}]);

app.controller('nationalPolicyController', [
    '$scope',
    'services',
    '$location',
    function ($scope, services, $location) {
        // 养殖
        var nationalPolicy = $scope;
        //获取文章列表分页
        nationalPolicy.getArtList = function (page, articleType) {
            services.getArtList({
                //'articleType':artType,
                articleType: articleType,
                page: page
            }).success(function (data) {
                nationalPolicy.articles = data.allList;
                nationalPolicy.totalPage = data.page;
            });
        };

        //获取文章详细内容
        nationalPolicy.getArticleDetail = function () {
            var articleId = this.art.np_id;
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
                nationalPolicy.articles = data.allList;
                nationalPolicy.totalPage = data.page;
                var $pages = $(".tcdPageCode");
                if ($pages.length != 0) {
                    $pages.createPage({
                        pageCount: nationalPolicy.totalPage,
                        current: 1,
                        backFn: function (p) {
                            nationalPolicy.getArtList(p, articleType);// 点击页码时获取第p页的数据
                        }
                    });
                }
            });
        }

        // 初始化页面信息
        function initData() {
            console.log("初始化页面信息");
            if ($location.path().indexOf('/nationalPolicy') == 0) { //国家政策
                getArticleList("nationalPolicy");
            } else if ($location.path().indexOf('/articleDetail') == 0) { //国家政策
                var articleId = window.sessionStorage.getItem('artId');
                services.getArtById({
                    'articleId': articleId
                }).success(function (data) {
                    console.log(data);
                    nationalPolicy.article = data;
                });
            } else if ($location.path().indexOf('/climateKLine') == 0) {//气候k线
                services.getClimateData().success(function (data) {
                    console.log("从后台获取的气候K线数据："+data);
                    var temperature;//温度
                    var humidity;//湿度
                    var sunny;//阴晴
                    var data1 = {
                        elementId: '#chart1',
                        title: '湖北襄阳市每日温度K线图',
                        subtitle: '',
                        //xScale:['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec','lyy', 'Nov', 'Dec'],
                        yTitle: '温度 (℃)',
                        valueSuffix: '℃',
                        series: {name: '湖北襄阳', data: temperature}
                    }
                    var chart1 = new Chart(data1);
                    chart1.init();
                    var data2 = {
                        elementId: '#chart2',
                        title: '湖北襄阳市每日湿度K线图',
                        subtitle: '',
                        //xScale:['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec','lyy', 'Nov', 'Dec'],
                        yTitle: '湿度 (℃)',
                        valueSuffix: '℃',
                        series: {name: '湖北襄阳', data: humidity}
                    }
                    var chart2 = new Chart(data2);
                    chart2.init();
                    var data3 = {
                        elementId: '#chart3',
                        title: '湖北襄阳市每日天气K线图',
                        subtitle: '',
                        //xScale:['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec','lyy', 'Nov', 'Dec'],
                        yTitle: '天气',
                        valueSuffix: '',
                        series: {name: '湖北襄阳', data: sunny}
                    }
                    var chart3 = new Chart(data3);
                    chart3.init();
                });

            }
        }

        initData();
    }
]);

