$(document).ready(function(){
	$("#content").height(window.innerHeight+60);
	loadParentMenuData();
});
function loadParentMenuData(){
	$.ajax({
		url:$("#fule").val()+"menu/menuParentGetData.json",
		type:"POST",
		dataType:"json",
		success:function(data){
			var strHtml= "";
			$.each(data, function(key,value){
				strHtml+='<option value="'+value.id+'">'+value.menuname+'</option>';
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
function save(){
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
		url: $("#fule").val()+"menu/menuSave.json",
		type:"POST",
		dataType:"json",
		data: {
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