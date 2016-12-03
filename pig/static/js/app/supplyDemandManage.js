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
                    templateUrl: '/static/html/systemManagement/supplyInformation.html',
                    controller: 'updateInformationController'
                })
                .when(
                '/buyInformation', {
                    templateUrl: '/static/html/systemManagement/supplyInformation.html',
                    controller: 'updateInformationController'
                })
                .when(
                '/businessInformation', {
                    templateUrl: '/static/html/systemManagement/supplyInformation.html',
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
    //添加信息
    services.addInformation = function (data) {
        return $http({
            method: 'get',
            url: '/pig/information/addInformation/',
            params: data
        });
    };
    //根据id获取信息
    services.getInfoById = function (data) {
        return $http({
            method: 'get',
            url: '/pig/information/getInfoById/',
            params: data
        });
    };
    //根据id删除信息
    services.deleteInfoById = function (data) {
        return $http({
            method: 'get',
            url: '/pig/information/deleteInfoById/',
            params: data
        });
    };

    services.updateInfoById = function (data) {
        //console.log("请求数据" + JSON.stringify(data));
        return $http({
            method: 'get',
            url: '/pig/information/updateInfoById/',
            params: data
        });
    };
    //获取信息列表
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
        var information = $scope;

        information.selectByTitle = function () {
            services.selectByTitle({title: $("#titleInput").val()}).success(function (data) {
                //updateInformation.information = data;
            });
        }

        information.modify = function () {
            var id = this.inf.id;
            services.getInfoById({id: id}).success(function (data) {
                information.information = data;
            });
            $(".overlayer").fadeIn(200);
            $("#tipType").fadeIn(200);
        }
        information.updateInformation = function () {
                services.updateInfoById({information: information.information}).success(function (data) {
            });
            $(".overlayer").fadeOut(200);
            $("#tipType").fadeOut(200);
        }

        $("#disModify").click(function () {
            $(".overlayer").fadeOut(200);
            $("#tipType").fadeOut(200);
        });

        $("#cancelModify").click(function () {
            /* sessionStorage.setItem("conId", ""); */
            $(".overlayer").fadeOut(100);
            $("#tipType").fadeOut(100);
        });

        information.add = function () {
            $(".overlayer").fadeIn(200);
            $("#tipType1").fadeIn(200);
        }

        $("#disAdd").click(function () {
            $(".overlayer").fadeOut(200);
            $("#tipType1").fadeOut(200);
        });

        $("#cancleAdd").click(function () {
            /* sessionStorage.setItem("conId", ""); */
            $(".overlayer").fadeOut(100);
            $("#tipType1").fadeOut(100);
        });

        information.addInformation = function () {
            console.log(information.info);
            services.addInformation({information:information.info}).success(function () {
                alert("添加信息成功！");
            });
        }

        information.delete = function () {
            var id = this.inf.id;
            console.log(id);
            services.deleteInfoById({id: id}).success(function () {
                alert("删除信息成功！");
            });
        }
        //获取文章列表分页
        information.getInformationList = function (page, infoType) {
            services.getInformationList({
                infoType: infoType,
                page: page
            }).success(function (data) {
                information.informations = data.allList;
                information.totalPage = data.page;
            });
        };

        //获取文章详细内容
        information.getArticleDetail = function () {
            var articleId = this.art.pc_id;
            window.sessionStorage.setItem('artId', articleId);
            //console.log("获取文章id：" + articleId)

        };
        //页面初始化时获取文章列表，含分页
        function getInformationList(infoType) {
            services.getInformationList({
                infoType: infoType,
                page: '1'
            }).success(function (data) {
                information.informations = data.allList;
                information.totalPage = data.page;
                var $pages = $(".tcdPageCode");
                if ($pages.length != 0) {
                    $pages.createPage({
                        pageCount: information.totalPage,
                        current: 1,
                        backFn: function (p) {
                            information.getInformationList(p, infoType);// 点击页码时获取第p页的数据
                        }
                    });
                }
            });
        }

        // 初始化页面信息
        function initData() {
            //console.log("初始化页面信息");
            if ($location.path().indexOf('/supplyInformation') == 0) {//供应信息
                getInformationList("supplyInformation");
            }
            else if ($location.path().indexOf('/buyInformation') == 0) {//求购信息
                information.informations = [
                    {id: 1, title: "呵呵能恩能够答案是aihsjfdal;asfiodasofjasaihsjfdal;asfiodasofjasaihsjfdal;asfiodasofjas", abstract: "aihsjfdal;asfiodasofjas", url: "asdfsadfasdfasdf", priority: "23"},
                    {id: 2, title: "呵呵aihsjfdal;asfiodasofjasaihsjfdal;asfiodasofjasaihsjfdal;asfiodasofjas", abstract: "aihsjfdal;asfiodasofjasaihsjfdal;asfiodasofjasaihsjfdal;asfiodasofjas", url: "asdfsadfasdfasdf", priority: "23"},
                    {id: 3, title: "呵呵", abstract: "aihsjfdal;asfiodasofjas", url: "asdfsadfasdfasdf", priority: "23"},
                    {id: 4, title: "呵呵", abstract: "aihsjfdal;asfiodasofjas", url: "asdfsadfasdfasdf", priority: "23"},
                    {id: 5, title: "呵呵", abstract: "aihsjfdal;asfiodasofjas", url: "asdfsadfasdfasdf", priority: "23"},
                    {id: 6, title: "呵呵", abstract: "aihsjfdal;asfiodasofjas", url: "asdfsadfasdfasdf", priority: "23"},
                    {id: 7, title: "呵呵", abstract: "aihsjfdal;asfiodasofjasaihsjfdal;asfiodasofjasaihsjfdal;asfiodasofjasaihsjfdal;asfiodasofjas", url: "asdfsadfasdfasdf", priority: "23"}


                ]
            }
            else if ($location.path().indexOf('/businessInformation') == 0) {//商家信息
                information.informations = [
                    {id: 1, title: "哈哈", abstract: "aihsjfdal;asfiodasofjas", url: "asdfsadfasdfasdf", priority: "23"},
                    {id: 2, title: "哈哈", abstract: "aihsjfdal;asfiodasofjas", url: "asdfsadfasdfasdf", priority: "23"},
                    {id: 3, title: "哈哈", abstract: "aihsjfdal;asfiodasofjas", url: "asdfsadfasdfasdf", priority: "23"},
                    {id: 4, title: "哈哈", abstract: "aihsjfdal;asfiodasofjas", url: "asdfsadfasdfasdf", priority: "23"},
                    {id: 5, title: "哈哈", abstract: "aihsjfdal;asfiodasofjas", url: "asdfsadfasdfasdf", priority: "23"},
                    {id: 6, title: "哈哈", abstract: "aihsjfdal;asfiodasofjas", url: "asdfsadfasdfasdf", priority: "23"},
                    {id: 7, title: "哈哈", abstract: "aihsjfdal;asfiodasofjas", url: "asdfsadfasdfasdf", priority: "23"}


                ]
            }
        }

        initData();
    }
]);
