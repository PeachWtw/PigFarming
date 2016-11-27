$(function () {
    //编辑器
    KindEditor.ready(function(K) {
        window.editor = K.create('#content');
    });
    var type2Select = {
        BreedPig         :{status:'生产现状',scale:'生产规模',situation:'行业状况'},
        BreedChicken     :{status:'生产现状',scale:'生产规模',situation:'行业状况'},
        BreedFish        :{status:'生产现状',scale:'生产规模',situation:'行业状况'},
        NationalPolicy   :{},
        ProductionControl:{pigFarmManagement:'猪场建设',breedManagement:'繁育管理',feedManagement:'饲养管理',dailyManagement:'日常管理'},
        BreedImprovement :{},
        Environment      :{lawsEnvironment:'养殖排污法规',projectEnvironment:'先进治污方案',facilityEnvironment:'设施工艺'},
        Trend            :{current:'国际同行现状',tendency:'前沿趋势模',feedstuff:'饲料行情走势',futures:'大豆、期货走势'}
    }
    //第一个下拉框值变化时第二个下拉框联动
    $("#type1").change(function(){
        var selectedObj = type2Select[$("#type1").val()];
        var select2 = $("#type2");
        select2.empty();
        for(var key in selectedObj){
            var opt = $("<option></option>")
            opt.val(key);
            opt.html(selectedObj[key]);
            select2.append(opt);
        }

    });
    //获取页面中输入的内容并发送添加文章请求
    $('#addArticleBtn').click(function (e) {
        preventDefault(e);
        var $title    = $('#title').val().trim(),
            $type1    = $('#type1').val().trim(),
            $type2    = "",
            $abstract = $('#abstract').val().trim(),
            $imgUrl = encodeURIComponent($('#imgUrl').val().trim()),
            $content  = encodeURIComponent(editor.html());

        if($('#type2').val()){
            $type2 = $('#type2').val().trim();
        }

        if ($title==""||$content==""){
            alert("标题或内容不能为空！");
            return false;
        } else{
            var params = {
                title   : $title,
                type1   : $type1,
                type2   : $type2,
                abstract: $abstract,
                imgUrl  : $imgUrl,
                content : $content
            }
            $.get("http://127.0.0.1:8000/pig/article/addArticle/", params,
                function(data){
                alert(data);
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