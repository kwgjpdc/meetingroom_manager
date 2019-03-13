$(document).ready(function(){
	$("#content").height(window.innerHeight-$("#head").height());
	$("#bodydiv").height(window.innerHeight-$("#head").height()-$("#searchdiv").height()-45);
	
	$("#navbar").find("li").removeClass("active");
	if($("#who").val() != '' && $("#who").val() != 'null'){
		$("#"+$("#who").val()+"li").addClass("active");
	}else{
		$("#mainpli").addClass("active");
	}
	
});


function print(){
	alert('工程师正在努力实现中');
}

function doexcel(){
	alert('工程师正在努力实现中');
}

function modalTitle(_msg,_type){
	$("#rightBtn").hide();
	$("#modalfooter").show();
	$("#infobody").html(_msg);
	if(_type == 2){
		$("#rightBtn").show();
	}
}
function showloding(){
	$("#modalfooter").hide();
	$("#infobody").html("处理中，请稍等！");
}
function closeloding(){
	$('#myModal').modal('hide');
}