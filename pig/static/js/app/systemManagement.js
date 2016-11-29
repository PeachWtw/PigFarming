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
        Trend            :{currentInternational:'国际同行现状',trendInternational:'前沿趋势模',feedInternational:'饲料行情走势',futuresInternational:'大豆、期货走势'}
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

    $("#picInput").change(function(){
        var picName = $(this).val();
        var fileType = (picName.substring(picName.lastIndexOf(".") + 1, picName.length)).toLowerCase();
        if(fileType!="png"&&fileType!="jpg"&&fileType!="gif"&&fileType!="jpeg"){
            alert("图片格式不正确！");
            $("#addArticleBtn").css("visibility","hidden");
        }
    });
    $("#picInput").click(function(){
            $("#addArticleBtn").css("visibility","visible ");
    });
    //获取页面中输入的内容并发送添加文章请求
    $('#addArticleBtn').click(function (e) {
        preventDefault(e);
        var $title    = $('#title').val().trim(),
            $type1    = $('#type1').val().trim(),
            $type2    = "",
            $abstract = $('#abstract').val().trim(),
            $content  = encodeURIComponent(editor.html());

        if($('#type2').val()){
            $type2 = $('#type2').val().trim();
        }

        if ($title==""||$content==""||$("#picInput").val()==""){
            alert("标题或内容或上传图片不能为空！");
            return false;
        } else{
            var params = {
                title   : $title,
                type1   : $type1,
                type2   : $type2,
                abstract: $abstract,
                imgUrl  : "hehe",
                content : $content
            }
            $.post("/pig/article/addArticle/", params,
                function(data){
                    //上传图片
                    var form = $("<form action='/pig/article/uploadPic/' enctype='multipart/form-data' method='post'></form>");
                    var picLi = $("#pic-li");
                    form.append(picLi);
                    form.submit();
                    //alert(data);
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