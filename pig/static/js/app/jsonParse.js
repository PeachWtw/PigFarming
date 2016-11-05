/**
 * Created by Administrator on 2016/11/5.
 */
var jsonParse = (function(){
    var arrToJsons = function(arr){
        var objArr = [];
        for(var i=0;i<arr.length;i++){
            var str = arr[i][0];
            str = "{"+str+"}";
            console.log(str);
            var obj = JSON.parse(str);
            objArr[i] = obj;
        }
        console.log(objArr);
        return objArr;
    }

    return {
        arrToJsons: arrToJsons
    }
})();