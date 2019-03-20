$(document).ready(function(){
	initSelectPicker();
	$("#operinfo").css({'color':'red','font-weight':'bold','margin-left':(window.innerWidth/2-250)});
	initDateTable();
});
function initSelectPicker(){
	var nowdate = new Date();
	console.log(nowdate.getMonth());
	yaerSelect(2019);
	monthSelect(3);	
}
function monthSelect(_nowmonth){
	for(var i = 0; i < 12; i++){
		if(_nowmonth == i){
			$("#month").append("<option selected value='"+(i+1)+"'>"+(i+1)+"</option>");
		}else{
			$("#month").append("<option value='"+(i+1)+"'>"+(i+1)+"</option>");
		}
	}

	//刷新select
	$("#month").selectpicker("refresh");
}
function yaerSelect(_nowyear){
	for(var i = 20; i > 0; i--){
		$("#year").append("<option value='"+(_nowyear-i)+"'>"+(_nowyear-i)+"</option>");
	}
	$("#year").append('<option selected value="'+_nowyear+'">'+_nowyear+'</option>');
	for(var i = 1; i <= 20; i++){
		$("#year").append("<option value='"+(_nowyear+i)+"'>"+(_nowyear+i)+"</option>");
	
	}

	//刷新select
	$("#year").selectpicker("refresh");
}
function initDateTable(){
	var _url = $("#fule").val()+'financing/getFinancingRepairData.json';
	//_url = _url + '?year='+$("#txt_search_year").val()+'&costtype='+$("#txt_search_ctype").val();
	var TableInit = function () {
		var oTableInit = new Object();
		//初始化Table
		oTableInit.Init = function () {
			$('#t_datagrid').bootstrapTable({
				url: _url,         					//请求后台的URL（*）
				method: 'post',                    	//请求方式（*）
				contentType :'application/x-www-form-urlencoded; charset=UTF-8',
				editable:true,						//开启编辑模式
				toolbar: false,                		//工具按钮用哪个容器
				striped: true,                      //是否显示行间隔色
				cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
				pagination: true,                   //是否显示分页（*）
				sortable: false,                    //是否启用排序
				sortOrder: "asc",                   //排序方式
				queryParamsType: "limit", 			//参数格式,发送标准的RESTFul类型的参数请求  
				queryParams:{
					year:$("#year").val(),
					month:$("#month").val(),
					classes:1
				},//传递参数（*）
				sidePagination: "server",			//分页方式：client客户端分页，server服务端分页（*）
				pageNumber: 1,         				//初始化加载第一页，默认第一页
				pageSize: 10,                       //每页的记录行数（*）
				pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
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
				height: window.innerHeight-$("#head").height()-$("#searchdiv").height()-50,
				//如果没有设置height属性，表格自动根据记录条数觉得表格高度
				columns: [
					[
					  {checkbox: true},
					  {title: '序号',field:'id',align:'center',width:50,
							formatter:function (value, row, index, field) {
								var _val = row["maintype"];
								if(_val == undefined || _val == ''){
									var _index = document.getElementById("costtype").selectedIndex;
									_val = $(document.getElementById("costtype").options[_index]).attr("lang");
								}
								if(value == undefined) value = '';
								return (index+1)+'<input type="hidden" value="'+value+'" name="list['+index+'].id" />' 
								+'<input type="hidden" value="'+$("#costtype").val()+'" name="list['+index+'].costtype" />'
								+'<input type="hidden" value="'+_val+'" name="list['+index+'].maintype" />'
								+'<input type="hidden" value="'+$("#year").val()+'" name="list['+index+'].writeyear" />';
							}
					  },
					  {
							field: 'ctype',align: 'center',title: '款项类型' ,valign : "middle",width : 100,
							formatter:function (value, row, index, field) {
								var _val = value;
								var _index = document.getElementById("costtype").selectedIndex;
								_val = document.getElementById("costtype").options[_index].text;
								return _val;
						    }
					  },
					  {
							field: 'cmoney',align: 'right',title: '(合同、协议)<br/>总金额(万元)' ,width : 150,
							formatter:function (value, row, index, field) {
								//class="editDiv"
								if(value == null || value == undefined) value = '';
						        return '<div id="inputmoney_'+index+'" contenteditable="true" onblur="$(this).html(fmoney($(this).html(),2))" >' + fmoney(value,2) + '</div>' + 
								'<input type="hidden" value="'+(value || "")+'" id="money'+index+'" name="list['+index+'].money" />';
						    }
					  },
					  {
						field: 'summoney',align: 'right',title: '开工以来累计完成<br/>投资(万元)' ,width : 100,
						formatter:function (value, row, index, field) {
							return '<div id="inputcashierno_'+index+'" contenteditable="true" >' + (value || "") + '</div>' +
							'<input type="hidden" value="'+(value || "")+'" id="cashierno'+index+'" name="list['+index+'].cashierno" />';
					    }
					  },
					  {
						field: 'tytmmoney',align: 'right',title: '2019年至2月完成<br/>投资(万元)' ,width : 100,
						formatter:function (value, row, index, field) {
							return '<div id="inputvoucherno_'+index+'" contenteditable="true" >' + (value || "") + '</div>' +
							'<input type="hidden" value="'+(value || "")+'" id="voucherno'+index+'" name="list['+index+'].voucherno" />';
					    }
					  },
					  {
						field: 'mmoney',align: 'right',title: '2019年2月完成<br/>投资(万元)' ,width : 100,
						formatter:function (value, row, index, field) {
							return '<div id="inputpayee_'+index+'" contenteditable="true" >' + (value || "") + '</div>' +
							'<input type="hidden" value="'+(value || "")+'" id="payee'+index+'" name="list['+index+'].payee" />';
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
		
		return oTableInit;
	};
	
	var oTable = new TableInit();
	oTable.Init();
	
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
		_money = $("#inputmoney_"+i).html();
		if(_money != null && _money != undefined)
		while(_money.indexOf(",") != -1){
			_money = _money.replace(",","");
		}
		$("#money"+i).val(_money);
		$("#voucherno"+i).val($("#inputvoucherno_"+i).html());
		$("#cashierno"+i).val($("#inputcashierno_"+i).html());
		$("#payee"+i).val($("#inputpayee_"+i).html());
		$("#payeedescribe"+i).val($("#inputpayeedescribe_"+i).html());
	}

	modalTitle("未填写的支付日期会默认为当日，<br/>是否确定提交?",2);
}

function saveFun(){
	showloding();
	$.ajax({
		url: $("#fule").val()+'financing/insertFRepair.json',
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

function reloadtable(){
    hasnosave = false;
    var options = $('#t_datagrid').bootstrapTable('refresh', {
        query: $("#formSearch").serializeObj()
    });
}