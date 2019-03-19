$(document).ready(function(){
	yaerSelect();
	var oTable = new TableInit();
	oTable.Init();
	$("#contentTablediv").height(window.innerHeight-$("#head").height()-$("#searchdiv").height()-40);
	$("#fileName").val($("#writeyear").val()+"财务填报费用类型分类汇总表");
});

function reloadtable(){
	$("#fileName").val($("#writeyear").val()+"财务填报费用类型分类汇总表");
    var options = $('#t_datagrid').bootstrapTable('refresh', {
        query: $("#formSearch").serializeObj()
    });
}
function yaerSelect(){
	var _nowyear = parseInt($("#writeyear").attr("lang"));
	
	for(var i = 20; i > 0; i--){
		$("#writeyear").append("<option value='"+(_nowyear-i)+"'>"+(_nowyear-i)+"</option>");
	}
	$("#writeyear").append('<option selected value="'+_nowyear+'">'+_nowyear+'</option>');
	for(var i = 1; i <= 20; i++){
		$("#writeyear").append("<option value='"+(_nowyear+i)+"'>"+(_nowyear+i)+"</option>");
	}

	//刷新select
	$("#writeyear").selectpicker("refresh");
}
function showDetail(_year,_costType){
	window.location.href = $("#fule").val()+'financing/financingListDetail.web?year='+_year+'&costtype='+_costType;
}
function addDetail(){
	
}
var TableInit = function () {
	var oTableInit = new Object();
	//初始化Table
	oTableInit.Init = function () {
		var _writeyear = $("#writeyear").val();
		$('#t_datagrid').bootstrapTable({
			url: $("#fule").val()+'financing/getfinancingListData.json',         //请求后台的URL（*）
			method: 'post',      				//请求方式（*）
			contentType :'application/x-www-form-urlencoded; charset=UTF-8',
			editable:true,						//开启编辑模式
			toolbar: false,                		//工具按钮用哪个容器
			striped: true,                      //是否显示行间隔色
			cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination: false,         			//是否显示分页（*）
			sortable: false, 					//是否启用排序
			sortOrder: "asc",     				//排序方式
			queryParams: $("#formSearch").serializeObj(),//传递参数（*）
			sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
			pageNumber: 1,        				//初始化加载第一页，默认第一页
			pageSize: 10,                       //每页的记录行数（*）
			pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
			search: false,               		//是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
			strictSearch: false,
			showColumns: false,        			//是否显示所有的列
			showRefresh: false,          		//是否显示刷新按钮
			minimumCountColumns: 2,             //最少允许的列数
			clickToSelect: true,                //是否启用点击选中行
			//height: 700,               		//行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
			uniqueId: "no",                     //每一行的唯一标识，一般为主键列
			showToggle: false,        			//是否显示详细视图和列表视图的切换按钮
			cardView: false,                    //是否显示详细视图
			detailView: false,         			//是否显示父子表
			height: window.innerHeight-$("#head").height()-$("#searchdiv").height()-50,
			columns: [
				[
				  {field: 'costType',visible: false},
				  {field: 'costTypeStr',align: 'left',title: '款项类型' ,valign : "middle",width : 100},
				  {field: 'mainType',visible: false},
				  {field: 'mainTypeStr',align: 'center',title: '款项所属' ,valign : "middle",width : 100},
				  {field: 'year',align: 'center',title: '所属年份' ,valign : "middle",width : 120,
						formatter:function (value, row, index, field) {
							return $("#writeyear").val();
						}
				  },
				  {field: 'total',align: 'right',title: '累计金额' ,width : 150,
						formatter:function (value, row, index, field) {
							return fmoney(value,2);
						}
				  },
				  {field: '',align: 'center',title: '操作' ,width : 150,
						formatter:function (value, row, index, field) {
					        return [
							      //'<button type="button" onclick="addDetail('+_writeyear+',\''+row["costType"]+'\')" class="RoleOfdelete btn btn-primary  btn-sm" style="margin-right:15px;">增加明细</button>',
							      '<button type="button" onclick="showDetail('+_writeyear+',\''+row["costType"]+'\')" class="RoleOfedit btn btn-primary  btn-sm" style="margin-right:15px;">查看明细</button>'
							      ].join('');
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