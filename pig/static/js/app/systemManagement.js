$(function () {
    $('#addArticleBtn').click(function (e) {
        preventDefault(e);
        console.log($('#ke-content'));
        var $title    = encodeURIComponent($('#title').val().trim()),
            $type     = encodeURIComponent($('#type').val().trim()),
            $abstract = encodeURIComponent($('#abstract').val().trim()),
            $content  = encodeURIComponent(document.getElementById("ke-content").innerHTML);
        console.log($title);
        console.log($type);
        console.log($abstract);
        console.log($content);
        if ($title==""||$type==""||$abstract==""||$content==""){
            alert("输入框不能为空！");
            return false;
        } else{
            var params = {
                title   : $title,
                type    : $type,
                abstract: $abstract,
                content : $content
            }
            $.get("http://127.0.0.1:8000/pig/article/addArticle/", params,
                function(data){
                alert("添加文章成功！");
            });
        }
    });
})

function preventDefault(e) {
	if (e && e.preventDefault) {
		// 阻止默认浏览器动作(W3C)
		e.preventDefault();
	} else {
		// IE中阻止函数器默认动作的方式
		window.event.returnValue = false;
		return false;
	}
}