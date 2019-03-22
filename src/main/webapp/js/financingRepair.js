$(document).ready(function(){
	$("#operinfo").css({'color':'red','font-weight':'bold','margin-left':(window.innerWidth/2-250)});
	var date=new Date;
	var year=date.getFullYear(); 
	var month=date.getMonth()+1;
	if(month<10){
		month="0"+month;
	}
	$("#belongTimeStr").val(year+"-"+month);
	$('#belongTime').datetimepicker({
		minView: 3,
		startView: 3,
		language:'zh-CN',
		autoclose: true,
		format: 'yyyy-mm' 
	}).on('changeDate',reloadtable);
	var oTable = new TableInit();
	oTable.Init();
	$("#contentTablediv").height(window.innerHeight-$("#head").height()-$("#searchdiv").height()-40);
	loadFinancingRepairSourceMoney();
});
function loadFinancingRepairSourceMoney(){
	$.ajax({
		url: $("#fule").val()+'financing/getFinancingRepairSourceMoney.json',
		type: 'post',
		data: {belongTimeStr:$("#belongTimeStr").val()},
		dataType: "json",
		success: function (data) {
			if(data.msgType==1){
				if(data.isCount==1){
					$("#sourceMoneyId").val(data.sourceMoneyId);
					$("#totalmoney").val(data.totalmoney);
					$("#centralmoney").val(data.centralmoney);
					$("#provincemoney").val(data.provincemoney);
					$("#localmoney").val(data.localmoney);
					$("#bankmoney").val(data.bankmoney);
				}else{
					$("#sourceMoneyId").val(0);
					$("#sourceMoneyId").val(0);
					$("#totalmoney").val(0);
					$("#centralmoney").val(0);
					$("#provincemoney").val(0);
					$("#localmoney").val(0);
					$("#bankmoney").val(d0);
				}
			}
		}
	});
}
var TableInit = function () {
	var belongTimeStr = $("#belongTimeStr").val();
	var yearStr = belongTimeStr.substring(0,4);
	var monthStr = belongTimeStr.substring(5,7);
	var oTableInit = new Object();
	//初始化Table
	oTableInit.Init = function () {
		$('#t_datagrid').bootstrapTable({
			url: $("#fule").val()+'financing/getFinancingRepair.json',         //请求后台的URL（*）
			method: 'post',                      //请求方式（*）
			contentType :'application/x-www-form-urlencoded; charset=UTF-8',
			editable:true,						//开启编辑模式
			toolbar: false,                		//工具按钮用哪个容器
			striped: true,                      //是否显示行间隔色
			cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			sortable: false,                    //是否启用排序
			sortOrder: "asc",                   //排序方式
			queryParams: oTableInit.queryParams,//传递参数（*）
			sidePagination: "server",			//分页方式：client客户端分页，server服务端分页（*）
			search: false,               		//是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
			strictSearch: false,
			showColumns: false,       			//是否显示所有的列
			showRefresh: false,     			//是否显示刷新按钮
			minimumCountColumns: 2,      		//最少允许的列数
			clickToSelect: true,                //是否启用点击选中行
			uniqueId: "no",                     //每一行的唯一标识，一般为主键列
			showToggle: false,   				//是否显示详细视图和列表视图的切换按钮
			cardView: false,                    //是否显示详细视图
			detailView: false,           		//是否显示父子表
			singleSelect:true,
			height: window.innerHeight-$("#head").height()-$("#searchdiv").height()-245,
			columns: [
				[
				  {                    
                    checkbox: true,
                    formatter:function (value, row, index, field) {
                    	var defaultValue = row["id"];
						if(defaultValue==undefined){
							defaultValue="0";
						}
						return '<input type="hidden" name="list['+index+'].id" value="'+defaultValue+'" /><input type="hidden" name="list['+index+'].ctype" value="'+row["key"]+'" />'; 
				    }
	              }
				  ,{
						field: 'value',
						title: '款项类型'
				  }
				  , {
						field: 'cmoney',align: 'right',title: '(合同、协议)<br/>总金额(万元)' ,width : 150,
						formatter:function (value, row, index, field) {
							return '<div id="cmoney_'+index+'" contenteditable="true" >' + fmoney(value,2) + '</div>' +
							'<input type="hidden" value="'+(value || "")+'" id="cmoney'+index+'" name="list['+index+'].cmoney" />';
					    }
				  },{
						field: 'summoney',align: 'right',title: '开工以来累计完成<br/>投资(万元)' ,width : 100,
						formatter:function (value, row, index, field) {
							return '<div id="summoney_'+index+'" contenteditable="true" >' + fmoney(value,2) + '</div>' +
							'<input type="hidden" value="'+(value || "")+'" id="summoney'+index+'" name="list['+index+'].summoney" />';
					    }
				  }
				  ,{
						field: 'tytmmoney',align: 'right',title: yearStr+'年至'+monthStr+'月完成<br/>投资(万元)' ,width : 100,
						formatter:function (value, row, index, field) {
							return '<div id="tytmmoney_'+index+'" contenteditable="true" >' + fmoney(value,2) + '</div>' +
							'<input type="hidden" value="'+(value || "")+'" id="tytmmoney'+index+'" name="list['+index+'].tytmmoney" />';
					    }
					}
				  , {
						field: 'mmoney',align: 'right',title: yearStr+'年'+monthStr+'月完成<br/>投资(万元)' ,width : 100,
						formatter:function (value, row, index, field) {
							return '<div id="mmoney_'+index+'" contenteditable="true" >' + fmoney(value,2) + '</div>' +
							'<input type="hidden" value="'+(value || "")+'" id="mmoney'+index+'" name="list['+index+'].mmoney" />';
					    }
					  }
				]
			],
			rowStyle: function (row, index) {
				var classesArr = ['oddn', 'evenn'];
				var strclass = "";
				if (index % 2 === 0) {//偶数行
					strclass = classesArr[0];
				} else {//奇数行
					strclass = classesArr[1];
				}
				return { classes: strclass };
			},//隔行变色
		});
	};
	
	//得到查询的参数
	oTableInit.queryParams = function (params) {
		var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
			contractname:$("#contractname").val(),
			suboffice:$("#suboffice").val(),
			belongTimeStr:$("#belongTimeStr").val()
		};
		return temp;
	};
	return oTableInit;
};
function reloadtable(){
	loadFinancingRepairSourceMoney();
	$.ajax({
		url: $("#fule").val()+'financing/getFinancingRepair.json',
		data: {belongTimeStr:$("#belongTimeStr").val()},
		type: "post",
		dataType:"json",
		success : function(json) {
			$("#t_datagrid").bootstrapTable('load', json);
		}
	});
}
function saveRow(){
	var length = 0;
	if(true){
		var rows = $("#t_datagrid").bootstrapTable('getData');
		length = rows.length; 
	}
	if(length == 0){
		modalTitle("没有可提交得数据",1);
		return;
	}
	var _money = '';
	for(var i = 0; i < length; i++){
		
		_cmoney = $("#cmoney_"+i).html();
		if(_cmoney != null && _money != undefined)
		while(_cmoney.indexOf(",") != -1){
			_cmoney = _cmoney.replace(",","");
		}
		$("#cmoney"+i).val(_cmoney);
		
		_summoney = $("#summoney_"+i).html();
		if(_summoney != null && _money != undefined)
		while(_summoney.indexOf(",") != -1){
			_summoney = _summoney.replace(",","");
		}
		$("#summoney"+i).val(_summoney);
		
		_tytmmoney= $("#tytmmoney_"+i).html();
		if(_tytmmoney != null && _tytmmoney != undefined)
		while(_tytmmoney.indexOf(",") != -1){
			_tytmmoney = _tytmmoney.replace(",","");
		}
		$("#tytmmoney"+i).val(_tytmmoney);
		
		_mmoney= $("#mmoney_"+i).html();
		if(_mmoney != null && _mmoney != undefined)
		while(_mmoney.indexOf(",") != -1){
			_mmoney = _mmoney.replace(",","");
		}
		$("#mmoney"+i).val(_mmoney);
		
	}

	modalTitle("是否确定提交?",2);
}

function saveFun(){
	showloding();
	$.ajax({
		url: $("#fule").val()+'financing/insertFRepair.json?sourceMoneyId='+$("#sourceMoneyId").val()+'&totalmoney='+$("#totalmoney").val()+'&centralmoney='+$("#centralmoney").val()+'&provincemoney='+$("#provincemoney").val()+'&localmoney='+$("#localmoney").val()+'&bankmoney='+$("#bankmoney").val()+'&belongTimeStr='+$("#belongTimeStr").val(),
		type: 'post',
		data: $("#editForm").serialize(),
		dataType: "json",
		success: function (data) {
			if(data.msgType == 1){
				reloadtable();
				modalTitle("操作成功",1);
			}else{
				modalTitle("操作失败，请重试",1);
			}
		},error:function(data){
			modalTitle("操作失败，请重试",1);
		}
	});
}

