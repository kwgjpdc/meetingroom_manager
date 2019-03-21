$(document).ready(function(){
	$("#operinfo").css({'color':'red','font-weight':'bold','margin-left':(window.innerWidth/2-250)});
	var oTable = new TableInit();
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
	}).on();
	oTable.Init();
	$("#contentTablediv").height(window.innerHeight-$("#head").height()-$("#searchdiv").height()-40);
});
var TableInit = function () {
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
			pagination: true,                   //是否显示分页（*）
			sortable: false,                    //是否启用排序
			sortOrder: "asc",                   //排序方式
			queryParams: oTableInit.queryParams,//传递参数（*）
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
			columns: [
				[
				  {                    
                    checkbox: true
	              }
				  ,{
						field: 'value',
						title: '款项类型'
				  }
				  , {
						field: 'cmoney',align: 'right',title: '(合同、协议)<br/>总金额(万元)' ,width : 150,
						formatter:function (value, row, index, field) {
							//class="editDiv"
							if(value == null || value == undefined) value = '';
					        return '<div id="inputmoney_'+index+'" contenteditable="true" onblur="$(this).html(fmoney($(this).html(),2))" >' + fmoney(value,2) + '</div>' + 
							'<input type="hidden" value="'+(value || "")+'" id="money'+index+'" name="list['+index+'].money" />';
					    }
				  },{
						field: 'summoney',align: 'right',title: '开工以来累计完成<br/>投资(万元)' ,width : 100,
						formatter:function (value, row, index, field) {
							return '<div id="inputcashierno_'+index+'" contenteditable="true" >' + fmoney(value,2) + '</div>' +
							'<input type="hidden" value="'+(value || "")+'" id="cashierno'+index+'" name="list['+index+'].cashierno" />';
					    }
				  }
				  ,{
						field: 'tytmmoney',align: 'right',title: '2019年至2月完成<br/>投资(万元)' ,width : 100,
						formatter:function (value, row, index, field) {
							return '<div id="inputvoucherno_'+index+'" contenteditable="true" >' + fmoney(value,2) + '</div>' +
							'<input type="hidden" value="'+(value || "")+'" id="voucherno'+index+'" name="list['+index+'].voucherno" />';
					    }
					}
				  , {
						field: 'mmoney',align: 'right',title: '2019年2月完成<br/>投资(万元)' ,width : 100,
						formatter:function (value, row, index, field) {
							return '<div id="inputpayee_'+index+'" contenteditable="true" >' + fmoney(value,2) + '</div>' +
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
	
	//得到查询的参数
	oTableInit.queryParams = function (params) {
		var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
			limit: params.limit,   //页面大小
			offset:params.offset,
			contractname:$("#contractname").val(),
			suboffice:$("#suboffice").val(),
			belongTimeStr:$("#belongTimeStr").val()
		};
		return temp;
	};
	return oTableInit;
};
