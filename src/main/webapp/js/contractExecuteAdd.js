$(document).ready(function(){
	$("#content").height(window.innerHeight+60);
	$('#belongTime').datetimepicker({
		minView: 3,
		startView: 3,
		autoclose: true,
		format: 'yyyy-mm' });
	loadSubofficeData();
});
function loadSubofficeData(){
	$.ajax({
		url:$("#fule").val()+"suboffice/subofficeGetData.json",
		type:"POST",
		dataType:"json",
		success:function(data){
			var strHtml= '<option value="0">-请选择-</option>';
			$.each(data, function(key,value){
				strHtml+='<option value="'+value.subofficeid+'">'+value.subofficename+'</option>';
			});
			$("#suboffice").html(strHtml);
		},
		error:function(){
			
		}
	});
}
function loadContractData(subofficeid){
	$.ajax({
		url:$("#fule").val()+"contract/contractSignedListGetDatBySuboffice.json",
		type:"POST",
		dataType:"json",
		data: {subofficeid : subofficeid},
		success:function(data){
			var strHtml= '<option value="0">-请选择-</option>';
			$.each(data, function(key,value){
				strHtml+='<option value="'+value.contractid+'">'+value.contractname+'</option>';
			});
			$("#contract").html(strHtml);
		},
		error:function(){
			
		}
	});
}
function save(){
	var contractId = $("#contract").val();
	var monthamount = $("#monthamount").val();
	var belongTime = $("#belongTimeStr").val();
	var remark = $("#remark").val();
	if(contractId == '0'||contractId == ''){
    	alert('请选择合同');
        return false;
    }
	if(monthamount == ''){
    	alert('请输入当月结算额');
        return false;
    }
	if(belongTime == ''){
    	alert('请选择所属年月');
        return false;
    }
	$.ajax({
		url: $("#fule").val()+'contract/contractExecuteSave.json',
		type:"POST",
		dataType:"json",
		data: {
			contractId : contractId,
			monthamount : monthamount,
			belongTime : belongTime,
        	remark : remark
        },
		success:function(data){
			if (data.flag == 1) {
            	alert("操作成功");
            }else {
               alert("操作失败");
            }
			 window.location.href=$("#fule").val()+"contract/contractExecuteList.web";
		},
		error:function(){
			console.log("失败");
		}
	});
}