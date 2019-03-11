$(document).ready(function(){
	var oTable = new TableInit();
	oTable.Init();
});

var TableInit = function () {
	var oTableInit = new Object();
	//初始化Table
	oTableInit.Init = function () {
		$('#t_datagrid').bootstrapTable({
			url: '/echart/project/payforGetData.json',         //请求后台的URL（*）
			method: 'post',                      //请求方式（*）
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
			columns: [
				[
				  {
					field: 'payType',
					title: '序号' ,
					rowspan: 2
				  },
				  {
					field: 'payType',
					title: '合同名称' ,
					rowspan: 2
				  },
				  {
					field: 'payType',
					title: '合同编号' ,
					rowspan: 2
				  },
				  {
					field: 'payType',
					title: '主要建设内容' ,
					rowspan: 2
				  },
				  {
					field: 'payType',
					title: '计划完工时间' ,
					rowspan: 2
				  },
				  {
					field: 'payType',
					title: '概算投资(万元)' ,
					rowspan: 2
				  },
				  {
					field: '',
					title: '投资完成情况' ,
					colspan: 3
				  },
				  {
					field: '',
					title: '计划执行情况' ,
					colspan: 5
				  },
				  {
					field: '',
					title: '累计完成实物工程量' ,
					colspan: 3
				  },
				  {
					field: 'payType',
					title: '总体形象进度（已完成的单项工程、正在进行的单项工程，完成工程占总工程的百分比）' ,
					rowspan: 2
				  },
				  {
					field: 'payType',
					title: '下一月度计划完成投资（万元）' ,
					rowspan: 2
				  },
				  {
					field: 'payType',
					title: '备注' ,
					rowspan: 2
				  }
				],
				[
				  {
						field: 'moneyyi',
						title: '合同金额（万元）' ,
				  }
				 ,{
						field: 'moneysi',
						title: '自开工以来累计完成投资（万元）'
				  }
				 ,{
						field: 'moneysa',
						title: '剩余投资（万元）'
				  }
				 ,{
						field: 'moneyyi',
						title: '本年度计划完成投资（万元）' ,
				  }
				 ,{
						field: 'moneysi',
						title: '本月计划完成投资（万元）'
				  }
				 ,{
						field: 'moneysa',
						title: '本年度实际完成投资（万元）'
				  }
				 ,{
						field: 'moneysa',
						title: '本月实际完成投资（万元）'
				  }
				 ,{
						field: 'moneysa',
						title: '本旬实际完成投资（万元）'
				  }
				 ,{
						field: 'moneysa',
						title: '土方（万方）'
				  }
				 ,{
						field: 'moneysa',
						title: '石方（万方）'
				  }
				 ,{
						field: 'moneysa',
						title: '混凝土（万立方米）'
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