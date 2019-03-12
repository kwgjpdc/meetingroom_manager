$(document).ready(function(){
	$("#content").height(window.innerHeight-$("#head").height());
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