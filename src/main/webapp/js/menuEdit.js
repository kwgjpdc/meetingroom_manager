$(document).ready(function(){
	$("#content").height(window.innerHeight+60);
	loadParentMenuData();
});
function loadParentMenuData(){
	var pidid = $("#pidid").val();
	var ismenuid = $("#ismenuid").val();
	$("#ismenu").val(ismenuid);
	if(ismenuid==1){
		$("#pid_div").hide();
	}
	if(ismenuid==0){
		$("#pid_div").show();
	}
	$.ajax({
		url:$("#fule").val()+"menu/menuParentGetData.json",
		type:"POST",
		dataType:"json",
		success:function(data){
			var strHtml= "";
			$.each(data, function(key,value){
				if(pidid!=''){
					if(value.id==pid){
						strHtml+='<option value="'+value.id+'" selected="selected">'+value.menuname+'</option>';
					}else{
						strHtml+='<option value="'+value.id+'">'+value.menuname+'</option>';
					}
				}else{
					strHtml+='<option value="'+value.id+'">'+value.menuname+'</option>';
				}
			});
			$("#pid").html(strHtml);
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
function changeIsMenu(value){
	if(value==1){
		$("#pid_div").hide();
	}
	if(value==0){
		$("#pid_div").show();
	}
}
function save(){
	var roleid = $("#id").val();
	var menuname = $("#menuname").val();
	var url = $("#url").val();
	var ismenu = $("#ismenu").val();
	var pid = $("#pid").val();
	var priority = $("#priority").val();
	if(menuname == ''){
    	alert('请输入菜单名称');
        return false;
    }
	$.ajax({
		url: $("#fule").val()+"menu/menuEditSave.json",
		type:"POST",
		dataType:"json",
		data: {
			roleid : roleid,
			menuname : menuname,
			url : url,
			ismenu : ismenu,
			pid : pid,
			priority : priority
        },
		success:function(data){
			 alert("操作成功");
			 window.location.href=$("#fule").val()+"menu/menuList.web";
		},
		error:function(){
			console.log("失败");
		}
	});
}