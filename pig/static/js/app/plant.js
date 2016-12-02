$(function () {
    //定义左侧栏各个a标签的点击事件
    $("#food").delegate("a", "click", function (event) {
        $("#secUrl").html(">>"+$(this).html());
        //获取被点击a标签的href
        var index = this.href;
        var path = index.substring(index.lastIndexOf("/") + 1, index.length);
        var chartTitle = this.innerHTML;
        //改变被点击a标签的样式
        $(".n_contact a").css("background-color", "transparent");
        $(".n_contact a").css("color", "#666");
        $(event.target).css("background-color", "#159301");
        $(event.target).css("color", "#fff");
        getFoodData(path, chartTitle);
    });
    $("#trees").delegate("a", "click", function (event) {
        $("#secUrl").html(">>"+$(this).html());
        //获取被点击a标签的href
        var index = this.href;
        var path = index.substring(index.lastIndexOf("/") + 1, index.length);
        var chartTitle = this.innerHTML;
        //console.log(path);
        //console.log(chartTitle);
        //改变被点击a标签的样式
        $(".n_contact a").css("background-color", "transparent");
        $(".n_contact a").css("color", "#666");
        $(event.target).css("background-color", "#159301");
        $(event.target).css("color", "#fff");
        getFoodData(path, chartTitle);
    });
    //发送ajax请求获取数据，成功之后生成图表http://127.0.0.1:8000/pig/article/getArtList/
    function getFoodData(path, chartTitle) {
        $.get("/pig/charts/getChartData/",{plantName:path},function(data){
            var dataObj = JSON.parse(data);
            var data1 = {
                elementId: '#chart1',
                title: chartTitle + '种植规模',
                subtitle: '',
                //xScale:['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec','lyy', 'Nov', 'Dec'],
                yTitle: '种植规模 (°C)',
                valueSuffix: '°C',
                series: {name: 'Beijing', data: dataObj.price}
            }
            var chart1 = new Chart(data1);
            chart1.init();

            var data2 = {
                elementId: '#chart2',
                title: chartTitle + '产量/销售量',
                subtitle: '',
                //xScale:['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec','lyy', 'Nov', 'Dec'],
                yTitle: '产量 (°C)',
                valueSuffix: '°C',
                series: {name: 'Beijing', data: dataObj.production}
            }
            var chart2 = new Chart(data2);
            chart2.init();

            var data3 = {
                elementId: '#chart3',
                title: chartTitle + '价格',
                subtitle: '',
                //xScale:['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec','lyy', 'Nov', 'Dec'],
                yTitle: '价格 (°C)',
                valueSuffix: '°C',
                series: {name: 'Beijing', data: dataObj.scale}
            }
            var chart3 = new Chart(data3);
            chart3.init();
        });

    }
    /*function getTreesData(path, chartTitle) {
        $.get("/pig/charts/getChartData/",{plantName:path},function(data){
            var dataObj = JSON.parse(data);
            var data1 = {
                elementId: '#chart1',
                title: chartTitle + '种植规模',
                subtitle: '',
                //xScale:['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec','lyy', 'Nov', 'Dec'],
                yTitle: '种植规模 (°C)',
                valueSuffix: '°C',
                series: {name: 'Beijing', data: dataObj.price}
            }
            var chart1 = new Chart(data1);
            chart1.init();

            var data2 = {
                elementId: '#chart2',
                title: chartTitle + '产量',
                subtitle: '',
                //xScale:['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec','lyy', 'Nov', 'Dec'],
                yTitle: '产量 (°C)',
                valueSuffix: '°C',
                series: {name: 'Beijing', data: dataObj.production}
            }
            var chart2 = new Chart(data2);
            chart2.init();

            var data3 = {
                elementId: '#chart3',
                title: chartTitle + '价格',
                subtitle: '',
                //xScale:['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec','lyy', 'Nov', 'Dec'],
                yTitle: '价格 (°C)',
                valueSuffix: '°C',
                series: {name: 'Beijing', data: dataObj.scale}
            }
            var chart3 = new Chart(data3);
            chart3.init();
        });

    }*/
})
