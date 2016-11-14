$(function () {
    //编辑器
    KindEditor.ready(function(K) {
        window.editor = K.create('#content');
    });
    //获取页面中输入的内容并发送添加文章请求
    $('#addArticleBtn').click(function (e) {
        preventDefault(e);
        var $title    = encodeURIComponent($('#title').val().trim()),
            $type     = encodeURIComponent($('#type').val().trim()),
            $abstract = encodeURIComponent($('#abstract').val().trim()),
            $content  = encodeURIComponent(editor.html());

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