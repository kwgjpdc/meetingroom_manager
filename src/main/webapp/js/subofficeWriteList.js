$(document).ready(function(){
	var oTable = new TableInit();
	oTable.Init();
	$("#contentTablediv").height(window.innerHeight-$("#head").height()-$("#searchdiv").height()-40);
});

var TableInit = function () {
	var oTableInit = new Object();
	//初始化Table
	oTableInit.Init = function () {
		$('#t_datagrid').bootstrapTable({
			url: '/echart/subofficewrite/subofficewriteGetData.json',         //请求后台的URL（*）
			method: 'post',                      //请求方式（*）
			editable:true,//开启编辑模式
			toolbar: false,                //工具按钮用哪个容器
			striped: true,                      //是否显示行间隔色
			cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination: true,                   //是否显示分页（*）
			sortable: false,                     //是否启用排序
			sortOrder: "asc",                   //排序方式
			queryParams: oTableInit.queryParams,//传递参数（*）
			sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
			pageNumber: 1,                       //初始化加载第一页，默认第一页
			pageSize: 10,                       //每页的记录行数（*）
			pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
			search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
			contentType: "json",
			strictSearch: false,
			showColumns: false,                  //是否显示所有的列
			showRefresh: false,                  //是否显示刷新按钮
			minimumCountColumns: 2,             //最少允许的列数
			clickToSelect: true,                //是否启用点击选中行
			//height: 700,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
			uniqueId: "no",                     //每一行的唯一标识，一般为主键列
			showToggle: false,                    //是否显示详细视图和列表视图的切换按钮
			cardView: false,                    //是否显示详细视图
			detailView: false,                   //是否显示父子表
			height: window.innerHeight-$("#head").height()-$("#searchdiv").height()-50,
			columns: [
				[
				  {                    
                    checkbox: true,
                    rowspan: 2
	              },
				  {
					field: 'contractname',
					align: 'center',
					title: '合同名称' ,
					valign : "middle",
					width : 250,
					rowspan: 2
				  },
				  {
					field: 'contractnum',
					align: 'center',
					title: '合同编号' ,
					valign : "middle",
					width : 220,
					rowspan: 2
				  },
				  {
					field: 'constructioncontent',
					align: 'center',
					title: '主要建设内容' ,
					valign : "middle",
					width : 250,
					formatter:function (value, row, index, field) {
				        return '<div contenteditable="true">' + (value || "") + '</div>';
				    },
					rowspan: 2
				  },
				  {
					field: 'begindatestr',
					align: 'center',
					title: '开工时间' ,
					valign : "middle",
					width : 150,
					formatter:function (value, row, index, field) {
				        return '<div contenteditable="true">' + (value || "") + '</div>';
				    },
					rowspan: 2
				  },
				  {
					field: 'planfinishdatestr',
					align: 'center',
					title: '计划完工时间' ,
					valign : "middle",
					width : 150,
					formatter:function (value, row, index, field) {
				        return '<div contenteditable="true">' + (value || "") + '</div>';
				    },
					rowspan: 2
				  },
				  {
					field: 'budgetinvest',
					align: 'center',
					title: '概算投资<br/>(万元)' ,
					width : 100,
					formatter:function (value, row, index, field) {
				        return '<div contenteditable="true">' + (value || "") + '</div>';
				    },
					rowspan: 2
				  },
				  {
					field: '',
					align: 'center',
					title: '投资完成情况' ,
					width : 280,
					colspan: 3
				  },
				  {
					field: '',
					align: 'center',
					title: '计划执行情况' ,
					width : 500,
					colspan: 5
				  },
				  {
					field: '',
					align: 'center',
					title: '累计完成实物工程量' ,
					width : 300,
					colspan: 3
				  },
				  {
					field: 'nextmonthplaninvest',
					align: 'center',
					valign : "middle",
					title: '下一月度计划<br/>完成投资（万元）' ,
					width : 150,
					formatter:function (value, row, index, field) {
				        return '<div contenteditable="true">' + (value || "") + '</div>';
				    },
					rowspan: 2
				  },
				  {
					field: 'remark',
					align: 'center',
					valign : "middle",
					title: '备注' ,
					width : 150,
					formatter:function (value, row, index, field) {
				        return '<div contenteditable="true">' + (value || "") + '</div>';
				    },
					rowspan: 2
				  },
				  {
					field: 'overallimageprogress',
					align: 'center',
					valign : "middle",
					title: '总体形象进度（已完成的单项工程、正在进行的单项工程，完成工程占总工程的百分比）' ,
					width : 950,
					formatter:function (value, row, index, field) {
				        return '<div contenteditable="true">' + (value || "") + '</div>';
				    },
					rowspan: 2
				  }
				],
				[
				  {
						field: 'contractamount',
						align: 'center',
						title: '合同金额<br/>（万元）' ,
						width : 80,
						formatter:function (value, row, index, field) {
					        return '<div contenteditable="true">' + (value || "") + '</div>';
					    }
				  }
				 ,{
						field: 'finishinvest',
						align: 'center',
						title: '自开工以来累计<br/>完成投资<br/>（万元）',
						width : 120,
						formatter:function (value, row, index, field) {
					        return '<div contenteditable="true">' + (value || "") + '</div>';
					    }
				  }
				 ,{
						field: 'surplusinvest',
						align: 'center',
						title: '剩余投资<br/>（万元）',
						width : 80,
						formatter:function (value, row, index, field) {
					        return '<div contenteditable="true">' + (value || "") + '</div>';
					    }
				  }
				 ,{
						field: 'yearplaninvest',
						align: 'center',
						title: '本年度计划<br/>完成投资<br/>（万元）' ,
						width : 100,
						formatter:function (value, row, index, field) {
					        return '<div contenteditable="true">' + (value || "") + '</div>';
					    }
				  }
				 ,{
						field: 'monthplaninvest',
						align: 'center',
						title: '本月计划<br/>完成投资<br/>（万元）',
						width : 100,
						formatter:function (value, row, index, field) {
					        return '<div contenteditable="true">' + (value || "") + '</div>';
					    }
				  }
				 ,{
						field: 'yearrealityinvest',
						align: 'center',
						title: '本年度实际<br/>完成投资<br/>（万元）',
						width : 100,
						formatter:function (value, row, index, field) {
					        return '<div contenteditable="true">' + (value || "") + '</div>';
					    }
				  }
				 ,{
						field: 'monthrealityinvest',
						align: 'center',
						title: '本月实际<br/>完成投资<br/>（万元）',
						width : 100,
						formatter:function (value, row, index, field) {
					        return '<div contenteditable="true">' + (value || "") + '</div>';
					    }
				  }
				 ,{
						field: 'tendayrealityinvest',
						align: 'center',
						title: '本旬实际<br/>完成投资<br/>（万元）',
						width : 100,
						formatter:function (value, row, index, field) {
					        return '<div contenteditable="true">' + (value || "") + '</div>';
					    }
				  }
				 ,{
						field: 'earthwork',
						align: 'center',
						title: '土方<br/>（万方）',
						width : 100,
						formatter:function (value, row, index, field) {
					        return '<div contenteditable="true">' + (value || "") + '</div>';
					    }
				  }
				 ,{
						field: 'stonework',
						align: 'center',
						title: '石方<br/>（万方）',
						width : 100,
						formatter:function (value, row, index, field) {
					        return '<div contenteditable="true">' + (value || "") + '</div>';
					    }
				  }
				 ,{
						field: 'beton',
						align: 'center',
						title: '混凝土<br/>（万立方米）',
						width : 100,
						formatter:function (value, row, index, field) {
					        return '<div contenteditable="true">' + (value || "") + '</div>';
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
			offset:params.offset
		};
		return temp;
	};
	return oTableInit;
};

/**
 * 新增一行数据
 */
function addRow(){
    var count = $('#t_datagrid').bootstrapTable('getData').length;
    // newFlag == 1的数据为新规的数据
    $('#t_datagrid').bootstrapTable('insertRow',{index:count,row:{newFlag:"1"}});
}
/**
 * 删除一行数据
 */
function delRow(){
    var count = $('#t_datagrid').bootstrapTable('getData').length;
    var checkRow= $("#t_datagrid").bootstrapTable('getSelections');
    if(checkRow.length<=0){
		 alert("请选中一行")
	}else{
		var check=JSON.stringify(checkRow);
		console.log(check);
	}
    if (count == 1) {
        info("已经是最后一条，不能删除!");
        return;
    }
}