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
                '/updateInformation', {
                    templateUrl: '/static/html/productionControl/articleList.html',
                    controller: 'updateInformationController'
                })

        }
    ]);
app.constant('baseUrl', '/static/');
app.factory('services', ['$http', 'baseUrl', function ($http, baseUrl) {
    var services = {};
    //根据文章类型获取文章列表
    services.getArtList = function (data) {
        //console.log("请求数据" + JSON.stringify(data));
        return $http({
            method: 'get',
            url: '/pig/article/getArtList/',
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
        // 养殖
        var updateInformation = $scope;
        //获取文章列表分页
        updateInformation.getArtList = function (page, articleType) {
            services.getArtList({
                //'articleType':artType,
                articleType: articleType,
                page: page
            }).success(function (data) {
                updateInformation.articles = data.allList;
                for(var i=0;i<updateInformation.articles.length;i++){
                    var time = updateInformation.articles[i].publish_time;
                    updateInformation.articles[i].publish_time = time.substring(0,time.indexOf("T"));
                    updateInformation.articles[i].src_img = decodeURIComponent(updateInformation.articles[i].src_img);
                }
                updateInformation.totalPage = data.page;
            });
        };

        //获取文章详细内容
        updateInformation.getArticleDetail = function () {
            var articleId = this.art.pc_id;
            window.sessionStorage.setItem('artId', articleId);
            //console.log("获取文章id：" + articleId)

        };
        //页面初始化时获取文章列表，含分页
        function getArticleList(articleType) {
            services.getArtList({
                //'articleType':'pigFarmManagement',
                //更改了这个部分！！！！
                'articleType': articleType,
                'page': '1'
            }).success(function (data) {
                updateInformation.articles = data.allList;
                for(var i=0;i<updateInformation.articles.length;i++){
                    var time = updateInformation.articles[i].publish_time;
                    updateInformation.articles[i].publish_time = time.substring(0,time.indexOf("T"));
                    updateInformation.articles[i].src_img = decodeURIComponent(updateInformation.articles[i].src_img);
                }
                updateInformation.totalPage = data.page;
                var $pages = $(".tcdPageCode");
                if ($pages.length != 0) {
                    $pages.createPage({
                        pageCount: updateInformation.totalPage,
                        current: 1,
                        backFn: function (p) {
                            updateInformation.getArtList(p, articleType);// 点击页码时获取第p页的数据
                        }
                    });
                }
                //productionControl.articles = jsonParse.arrToJsons(data);
            });
        }

        // 初始化页面信息
        function initData() {
            //console.log("初始化页面信息");
            if ($location.path().indexOf('/pigFarmManagement') == 0) { //猪场管理
                $("#secUrl").html("猪场管理");
                getArticleList("pigFarmManagement");
                sessionStorage.setItem("secondary","pigFarmManagement");
            } /*else if ($location.path().indexOf('/breedManagement') == 0) {//繁育管理
                $("#secUrl").html("繁育管理");
                getArticleList("breedManagement");
                sessionStorage.setItem("secondary","breedManagement");
            } */
        }

        initData();
    }
]);
