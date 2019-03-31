var sumIndex = [0,9,14,21,25,26];
$(document).ready(function(){
	$("#reportDate").datetimepicker({
		autoclose:true,
		minView:2,
		startView:2,
		language:'zh-CN'
	});
	$("#btn_query").click(reloadtable);
	var now = new Date();
	$("#reportDate").val(now.getFullYear()+'-'+(1+now.getMonth()));
	setFormVal("#reportDate");

	var oTable = new TableInit();
	oTable.Init();
});
function reloadtable(){
	var _reportDate = $("#reportDate").val();
	if(_reportDate == ''){
		modalTitle("请选择填报日期",1);
		return;
	}
	var arrstr = _reportDate.split("-");
	$(".changeyear").html(arrstr[0]);
	$(".changemonth").html(arrstr[1]);
	var options = $('#t_datagrid').bootstrapTable('refresh', {
        query: $("#formSearch").serializeObj()
    });
}
function setFormVal(_this){
	var _reportDate = $(_this).val();

	if( _reportDate == ''){
		$("#year").val('');
		$("#month").val('');
		$("#yearn").val('');
		$("#monthn").val('');
		$("#filename").val('');
		$("#yearmonth").val('');
	}else{
		var arrstr = _reportDate.split("-");
		$("#year").val(arrstr[0]);
		$("#month").val(parseInt(arrstr[1]));
		$("#yearmonth").val('('+arrstr[0]+'_'+arrstr[1]+')');
		$("#yearn").val(arrstr[0]+"年至"+arrstr[1]+"月");
		$("#monthn").val(arrstr[0]+"年"+arrstr[1]+"月");
		$("#reportDaten").val(arrstr[0]+"年"+arrstr[1]+"月"+arrstr[2]+"日");
		$("#filename").val("工程投资完成汇总月统计表("+arrstr[0]+"年"+arrstr[1]+"月)");
	}
}
function setFootWidth(){
    var footths = $(".fixed-table-footer").find("th");
    var bodytds = $($("#t_datagrid").find(".oddn")[0]).find("td");
    
    if(bodytds != undefined){
    	for(var i = 0; i < bodytds.length; i++){
    		$(footths[i]).width($(bodytds[i]).outerWidth()-2);
    	}
    }
}
function setTailer(){
	$.ajax({
		url: $("#fule").val()+'financing/getFinancingReportTwoBcData.json',
		type: 'post',
		data:{
			year:$("#year").val(),
			month:$("#month").val()
		},
		dataType: "json",
		success: function (data) {
			if(data != null && data != undefined){
				var tailers = ["taileyi","taileer","tailesan","tailesi","tailewu"];
				var resultstr = '资金来源：'+
					'截止2月25日，2019年累计到位#taileyi#万元（2018年结余转结资金），'+
					'其中①中央补助#taileer#万元'+
					'②省级配套#tailesan#万元'+
					'③地方水利建设基金#tailesi#万元'+
					'④银行贷款#tailewu#万元。';
				for(var i = 0; i < tailers.length; i++){
					resultstr = resultstr.replace('#'+tailers[i]+'#',data[tailers[i]]);
				}

				$("#tailestr").val(resultstr);
				$("#spantailestr").html(resultstr);
			}
		}
	});
}
var TableInit = function () {
	var oTableInit = new Object();
	//初始化Table
	oTableInit.Init = function () {
		$('#t_datagrid').bootstrapTable({
			showFooter: true,					//是否合计
			url: $("#fule").val()+'financing/getFinancingReportTwoData.json',//请求后台的URL（*）
			method: 'post',                    	//请求方式（*）
			contentType :'application/x-www-form-urlencoded; charset=UTF-8',
			editable:true,						//开启编辑模式
			toolbar: false,                		//工具按钮用哪个容器
			striped: true,                      //是否显示行间隔色
			cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination: false,                   //是否显示分页（*）
			sortable: false,                    //是否启用排序
			sortOrder: "asc",                   //排序方式
			queryParamsType: "limit", 			//参数格式,发送标准的RESTFul类型的参数请求  
			queryParams:{
				year:$("#year").val(),
				month:$("#month").val(),
				reportDate:$("#reportDate").val()
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
			height: window.innerHeight-$("#head").height()-$("#searchdiv").height()-90,
			//如果没有设置height属性，表格自动根据记录条数觉得表格高度
			columns: [
				[
				  {field:'typename',title: '序号-项目类型',align:'left',width:300,
					    footerFormatter: function (value) {
					        return '合计';
					    }
				  },
				  {field: 'contractmoney',title: '（合同、协议）<br/>总金额（万元）',align: 'right',align : "right",width : 120,
						formatter:function (value, row, index, field) {
							return fmoney(value,2);
						},
					    footerFormatter: function (value) {
					        var summ = 0;
					    	if(value.length > 0)
					        for (var i in sumIndex) {
					        	summ += mparseFloat(value[sumIndex[i]].contractmoney);
					        }
					    	var result = fmoney(summ,2);
					    	$("#tailyyi").val(result);
					        return result;
					    }
				  },
				  {field: 'contractfinish',align: 'right',title: '开工以来累计<br/>完成投资（万元）' ,align : "right",width : 120,
						formatter:function (value, row, index, field) {
							return fmoney(value,2);
						},
					    footerFormatter: function (value) {
					        var summ = 0;
					    	if(value.length > 0)
					        for (var i in sumIndex) {
					        	summ += mparseFloat(value[sumIndex[i]].contractfinish);
					        }
					    	var result = fmoney(summ,2);
					    	$("#tailyer").val(result);
					        return result;
					    }
				  },
				  {field: 'nytnmmoney',align: 'right',align : "right",width : 120,
					  title:'<span class="changeyear">'+$("#year").val()+'</span>年至<span class="changemonth">'+$("#month").val()+'</span>月<br/>完成投资（万元）',
						formatter:function (value, row, index, field) {
							return fmoney(value,2);
						},
					    footerFormatter: function (value) {
					    	var summ = 0;
					    	if(value.length > 0)
					        for (var i in sumIndex) {
					        	summ += mparseFloat(value[sumIndex[i]].nytnmmoney);
					        }
					    	var result = fmoney(summ,2);
					    	$("#tailysan").val(result);
					        return result;
					    }
				  },
				  {field: 'nymonth',align: 'right',align : "right",width : 120,
					  title:'<span class="changeyear">'+$("#year").val()+'</span>年<span class="changemonth">'+$("#month").val()+'</span>月<br/>完成投资（万元）',
						formatter:function (value, row, index, field) {
							return fmoney(value,2);
						},
					    footerFormatter: function (value) {
					        var summ = 0;
					    	if(value.length > 0)
					        for (var i in sumIndex) {
					        	summ += mparseFloat(value[sumIndex[i]].nymonth);
					        }
					    	var result = fmoney(summ,2);
					    	$("#tailysi").val(result);
					        return result;
					    }
				  }
				]
			],
			onLoadSuccess: function(data){
				setFootWidth();
				setTailer();
	        },
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