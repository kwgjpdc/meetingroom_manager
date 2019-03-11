$(document).ready(function(){
	var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth();

	$("#year").val(year);
	$("#month").val(month);
	//var oTable = new TableInit();
	//oTable.Init();
	$('#formSearch').bootstrapValidator({
		message: 'This value is not valid',
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			year: {
				validators: {
					notEmpty: {
						message: '年份不能为空'
					},
					stringLength: {
                        min: 4,
                        max: 4,
                        message: '年份长度为4位'
                    },
					regexp: {
						regexp: /^[0-9]+$/,
						message: '年份必须为数字'
					}
				}
			},
			month: {
				validators: {
					notEmpty: {
						message: '月份不能为空'
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
					title: '支付款项' ,
					rowspan: 2
				  }
				 ,{
						field: '',
						title: '支付金额' ,
						colspan: 5
				  }
				],
				[
				  {
						field: 'moneyyi',
						title: '2017年' ,
				  }
				 ,{
						field: 'moneyer',
						title: '2018年'
				  }
				 ,{
						field: 'moneysa',
						title: '2019年1月'
				  }
				 ,{
						field: 'moneysi',
						title: '2019年2月'
				  }
				 ,{
						field: 'moneyhj',
						title: '累计'
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