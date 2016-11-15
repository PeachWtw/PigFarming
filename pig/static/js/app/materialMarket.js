$(function () {
    //定义左侧栏各个a标签的点击事件
    $("#material").delegate("a", "click", function (event) {
        //获取被点击a标签的href
        var index = this.href;
        var path = index.substring(index.lastIndexOf("/") + 1, index.length);
        var chartTitle = this.innerHTML;
        //改变被点击a标签的样式
        $(".n_contact a").css("background-color", "transparent");
        $(".n_contact a").css("color", "#666");
        $(event.target).css("background-color", "#159301");
        $(event.target).css("color", "#fff");
        getMaterialData(path, chartTitle);
    });
});