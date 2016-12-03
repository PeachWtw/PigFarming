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
                console.log("接到的数据：" + data);
                information.informations = data;
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
                $(".overlayer").fadeOut(200);
                $("#tipType").fadeOut(200);
                getInformationList(sessionStorage.getItem("pageType"));
                alert("更新成功！")
            });

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
            information.info.type = "supplyInformation";
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
            if (information.info.title == "") {
                alert("标题不能为空！")
                return false;
            }
            if (information.info.url == "") {
                alert("URL不能为空！")
                return false;
            }
            if (!isNaN(information.info.priority)) {
                alert("优先级必须为整数！")
                return false;
            }
            if (information.info.abstract) {
                if (information.info.abstract.length > 200) {
                    alert("摘要内容不能超过100字！")
                    return false;
                }
            }

            console.log(information.info);
            services.addInformation({information: information.info}).success(function () {
                getInformationList(sessionStorage.getItem("pageType"));
                alert("添加信息成功！");
            });
        }

        information.delete = function () {
            var id = this.inf.id;
            console.log(id);
            services.deleteInfoById({id: id}).success(function () {
                getInformationList(sessionStorage.getItem("pageType"));
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
                sessionStorage.setItem("pageType", "supplyInformation")
                getInformationList("supplyInformation");
            }
            else if ($location.path().indexOf('/buyInformation') == 0) {//求购信息
                sessionStorage.setItem("pageType", "buyInformation")
                getInformationList("buyInformation");
            }
            else if ($location.path().indexOf('/businessInformation') == 0) {//商家信息
                sessionStorage.setItem("pageType", "businessInformation")
                getInformationList("businessInformation");
            }
        }

        initData();
    }
]);
