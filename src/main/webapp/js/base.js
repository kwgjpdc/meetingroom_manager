$(document).ready(function(){
	$("#content").height(window.innerHeight-$("#head").height());
	$("#bodydiv").height(window.innerHeight-$("#head").height()-$("#searchdiv").height()-45);
	
	$("#navbar").find("li").removeClass("active");
	if($("#who").val() != '' && $("#who").val() != 'null'){
		$("#"+$("#who").val()+"li").addClass("active");
	}else{
		$("#mainpli").addClass("active");
	}
	$(".icon-arrow-right").addClass("icon-angle-right");
	
	$.fn.serializeObj=function(){
	    var serializeObj={};
	    var array=this.serializeArray();
	    var str=this.serialize();
	    $(array).each(function(){
	        if(serializeObj[this.name]){
	            if($.isArray(serializeObj[this.name])){
	                serializeObj[this.name].push(this.value);
	            }else{
	                serializeObj[this.name]=[serializeObj[this.name],this.value];
	            }
	        }else{
	            serializeObj[this.name]=this.value; 
	        }
	    });
	    return serializeObj;
	};
});


function print(){
	modalTitle('工程师正在努力实现中<br/>您可以导入后打印',1);
}

function doexcel(_this){
	$("#formSearch").attr('action',$("#fule").val()+"excel/toExcelXlsExecute.web");
	$("#fileName").val(encodeURI($(_this).attr("lang")));
	$("#formSearch").submit();
}

function modalTitle(_msg,_type){
	$("#infobody").html(_msg);
	$("#rightBtn1").hide();
	$("#rightBtn2").hide();
	$("#leftBtn").show();

	if(_type == 3){
		$("#rightBtn2").show();
	}if(_type == 2){
		$("#rightBtn1").show();
	}
	$('#show-modal').modal().open();
}
function showloding(){
	$("#leftBtn").hide();
	$("#rightBtn1").hide();
	$("#rightBtn2").hide();
	$("#infobody").html('<img width="50" src="'+$("#fule").val()+'/image/loading.gif" />处理中，请稍等！');
	$('#show-modal').modal().open();
}
function closeloding(){
	$.modal().close();
}

function fmoney(s, n) {
	if(s == null || s == undefined || s == ''){
		if(n != undefined && n != 2 && n > 0) {
			var result = '';
			while(result.length < n){
				result = result + 0;
			}
			return '0.' + result;
		}else return '0.00';
	}
	
	while((""+s).indexOf(",") != -1){
		s = s.replace(",","");
	}
	n = n > 0 && n <= 20 ? n : 2;
	s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
	var l = s.split(".")[0].split("").reverse(), r = s.split(".")[1];
	t = "";
	for (i = 0; i < l.length; i++) {
		t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
	}
	return t.split("").reverse().join("") + "." + r;
}
