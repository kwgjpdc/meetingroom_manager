$(document).ready(function(){
	$("#content").height(window.innerHeight+60);
	$('#signTime').datetimepicker({
        format: 'YYYY-MM-DD',
        locale: moment.locale('zh-cn')
    });
	loadSubofficeData();
	//validatef();
});
function loadSubofficeData(){
	$.ajax({
		url:"/echart/suboffice/subofficeGetData.json",
		type:"POST",
		dataType:"json",
		success:function(data){
			var strHtml= "";
			$.each(data, function(key,value){
				strHtml+='<option value="'+value.subofficeid+'">'+value.subofficename+'</option>';
			});
			$("#suboffice").html(strHtml);
		},
		error:function(){
			
		}
	});
}
function validatef(){
	$('#formInsert').bootstrapValidator({
		message: 'This value is not valid',
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			amount: {
				validators: {
					notEmpty: {
						message: '合同金额不能为空'
					},
					stringLength: {
                        min: 1,
                        max: 2,
                        message: '月份长度为1到2位'
                    },
					regexp: {
						regexp: /^[0-9]+$/,
						message: '月份必须为位数字'
					}
				}
			}
		}
	});
}
function save(){
	var subofficeId = $("#suboffice").val();
	var contractName = $("#contractName").val();
	var contractNum = $("#contractNum").val();
	var amount = $("#amount").val();
	var durationTime = $("#durationTime").val();
	var signTime = $("#signTimeStr").val();
	var contractPartyB = $("#contractPartyB").val();
	var remark = $("#remark").val();
	$.ajax({
		url: '/echart/contract/contractSave.json',
		type:"POST",
		dataType:"json",
		data: {
			subofficeId : subofficeId,
        	contractName : contractName,
        	contractNum : contractNum,
        	amount : amount,
        	durationTime : durationTime,
        	signTime : signTime,
        	contractPartyB : contractPartyB,
        	remark : remark
        },
		success:function(data){
			 alert("操作成功");
			 window.location.href="/echart/contract/contractList.web";
		},
		error:function(){
			console.log("失败");
		}
	});
}