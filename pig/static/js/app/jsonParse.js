/**
 * Created by Administrator on 2016/11/5.
 */
var jsonParse = (function(){
    var arrToJsons = function(arr){
        var objArr = [];
        for(var i=0;i<arr.length;i++){
            var str = arr[0][0];
            str = "{"+str+"}";
            console.log(str);
            //str = '{"title":"dsadasd", "abstract":"问题问题"}';//{'title':dsadasd, 'abstract':问题问题, 'content':王桃伟, 'publish_time':2016-11-01 22:52:56+00:00, 'click_times':100, 'src_img':1, 'type':None}
            var obj = JSON.parse(str);
            objArr[i] = obj;
        }
        return objArr;
    }

    return {
        arrToJsons: arrToJsons
    }
})();