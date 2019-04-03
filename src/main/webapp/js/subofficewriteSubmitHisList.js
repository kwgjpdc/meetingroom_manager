$(document).ready(function(){
	$("#operinfo").css({'color':'red','font-weight':'bold','margin-left':(window.innerWidth/2-400)});
	initSelectPicker();
	initTableSelect();
	var oTable = new TableInit();
	oTable.Init();
	$("#contentTablediv").height(window.innerHeight-$("#head").height()-$("#searchdiv").height()-40);
});
function initSelectPicker(){
	subofficeDataInit();
}
var TableInit = function () {
	var oTableInit = new Object();
	//初始化Table
	oTableInit.Init = function () {
		$('#t_datagrid').bootstrapTable({
			url: $("#fule").val()+'subofficewrite/subofficewriteSubmitHisGetData.json',         //请求后台的URL（*）
			method: 'post',                     //请求方式（*）
			editable:true,						//开启编辑模式
			contentType :'application/x-www-form-urlencoded; charset=UTF-8',
			toolbar: false,                		//工具按钮用哪个容器
			striped: true,                      //是否显示行间隔色
			cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination: false,                   //是否显示分页（*）
			sortable: false,                     //是否启用排序
			sortOrder: "asc",                   //排序方式
			queryParams: oTableInit.queryParams,//传递参数（*）
			sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
			pageNumber: 1,                       //初始化加载第一页，默认第一页
			pageSize: 10,                       //每页的记录行数（*）
			pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
			search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
			strictSearch: false,
			showColumns: false,                  //是否显示所有的列
			showFooter: true,		                  
			showRefresh: false,                  //是否显示刷新按钮
			minimumCountColumns: 2,             //最少允许的列数
			clickToSelect: true,                //是否启用点击选中行
			uniqueId: "no",                     //每一行的唯一标识，一般为主键列
			showToggle: false,                    //是否显示详细视图和列表视图的切换按钮
			cardView: false,                    //是否显示详细视图
			detailView: false,                   //是否显示父子表
			height: window.innerHeight-$("#head").height()-$("#searchdiv").height()-50,
			onLoadSuccess: function(data){
	            var footths = $(".fixed-table-footer").find("th");
	            var bodytds = $($("#t_datagrid").find(".oddn")[0]).find("td");
	            
	            if(bodytds != undefined){
	            	for(var i = 0; i < bodytds.length; i++){
	            		$(footths[i]).width($(bodytds[i]).outerWidth()-2);
	            	}
	            }
	        },
	        
	    
			columns: [
				[
				  {                    
                    checkbox: true,
                    valign : "middle",
                    width : 40,
                    formatter:function (value, row, index, field) {
                    	var defaultValue = row["subofficewriteid"];
						if(defaultValue==undefined){
							defaultValue="0";
						}
						return '<input type="hidden" name="list['+index+'].subofficewriteid" value="'+defaultValue+'" />'; 
				    },
				    footerFormatter: function (value) {
				    	return '-';
				    },
                    rowspan: 2
	              },
	              {
					field: 'year',
					align: 'center',
					title: '年份' ,
					valign : "middle",
					width : 70,
					rowspan: 2
				  },
				  {
					field: 'month',
					align: 'center',
					title: '月份' ,
					valign : "middle",
					width : 50,
					rowspan: 2
				  },
				  {
					field: 'typestr',
					align: 'center',
					title: '类型' ,
					valign : "middle",
					width : 50,
					rowspan: 2
				  },
	              {
					field: 'statusstr',
					align: 'center',
					title: '状态' ,
					valign : "middle",
					width : 100,
					rowspan: 2
				  },

				  {
					field: 'contractid',
					align: 'center',
					title: '合同名称' ,
					valign : "middle",
					width : 250,
					rowspan: 2,
					formatter:function (value, row, index, field) {
						var subofficeid = $("#subofficeid"+index).val();
						var strHtml= '<option value="0">-请选择-</option>';
						if(subofficeid==0){
							
						}else{
							var data = loadContractDataBySubofficeid(row["subofficeid"]);
							$.each(data, function(key,value2){
								if(value2.contractid==value){
									strHtml+='<option value="'+value2.contractid+'" title="'+value2.contractnum+'"  amount="'+value2.amount+'" selected="selected">'+value2.contractname+'</option>';
								}else{
									strHtml+='<option value="'+value2.contractid+'" title="'+value2.contractnum+'" amount="'+value2.amount+'">'+value2.contractname+'</option>';
								}
							});
						}
						return '<select name="list['+index+'].contractid" disabled="disabled" onchange="setcontractnum(this)" subofficeid="'+row["subofficeid"]+'" class="form-control" id="contractid_'+index+'" data-width="200px" value="'+value+'" >'+strHtml+'</select>';
					},
				    footerFormatter: function (value) {
				    	return '-';
				    }
				  },
				  {
					field: 'contractnum',
					align: 'center',
					title: '合同编号' ,
					valign : "middle",
					width : 220,
					rowspan: 2,
					formatter:function (value, row, index, field) {
						return '<span id="contractnum'+index+'">' + (value || "") + '</span>';
				    },
				    footerFormatter: function (value) {
				    	return '-';
				    }
				  },
				  {
					field: 'constructioncontent',
					align: 'center',
					title: '主要建设内容' ,
					valign : "middle",
					width : 250,
				    footerFormatter: function (value) {
				    	return '-';
				    },
					rowspan: 2
				  },
				  {
					field: 'begindatestr',
					align: 'center',
					title: '开工时间' ,
					valign : "middle",
					width : 150,
					rowspan: 2,
				    footerFormatter: function (value) {
				    	return '-';
				    }
				  },
				  {
					field: 'planfinishdatestr',
					align: 'center',
					title: '计划完工时间' ,
					valign : "middle",
					width : 150,
					rowspan: 2,
				    footerFormatter: function (value) {
				    	return '合计';
				    }
				  },
				  {
					field: 'budgetinvest',
					align: 'right',
					title: '概算投资<br/>(万元)' ,
					width : 120,
				    footerFormatter: function (value) {
				        var summ = 0;
				        for (var i in value) {
				        	summ += parseFloat(value[i].budgetinvest);
				        }
				        return fmoney(summ,4);
				    },
					rowspan: 2
				  },
				  {
						field: 'contractamount',
						align: 'right',
						title: '合同金额<br/>（万元）' ,
						width : 120,
						formatter:function (value, row, index, field) {
							return '<span id="contractamount'+index+'" >' + fmoney(value,4) + '</span>';
						},
					    footerFormatter: function (value) {
					        var summ = 0;
					        for (var i in value) {
					        	summ += parseFloat(value[i].contractamount);
					        }
					        return fmoney(summ,4);
					    },
						rowspan: 2
				  },
				  {
					field: '',
					align: 'center',
					title: '投资完成情况' ,
					width : 270,
					colspan: 2
				  },
				  {
					field: '',
					align: 'center',
					title: '计划执行情况' ,
					width : 600,
					colspan: 5
				  },
				  {
					field: '',
					align: 'center',
					title: '累计完成实物工程量' ,
					width : 350,
					colspan: 3
				  },
				  {
					field: 'nextmonthplaninvest',
					align: 'right',
					valign : "middle",
					title: '下一月度计划<br/>完成投资（万元）' ,
					width : 150,
					rowspan: 2
				  },
				  {
					field: 'remark',
					align: 'center',
					valign : "middle",
					title: '备注' ,
					width : 150,
					rowspan: 2
				  },
				  {
					field: 'overallimageprogress',
					align: 'center',
					valign : "middle",
					title: '总体形象进度（已完成的单项工程、正在进行的单项工程，完成工程占总工程的百分比）' ,
					width : 1200,
					rowspan: 2
				  }
				],
				[{
						field: 'finishinvest',
						align: 'right',
						title: '自开工以来累计<br/>完成投资（万元）',
						width : 190,
					    footerFormatter: function (value) {
					        var summ = 0;
					        for (var i in value) {
					        	summ += parseFloat(value[i].finishinvest);
					        }
					        return fmoney(summ,4);
					    }
				  }
				 ,{
						field: 'surplusinvest',
						align: 'right',
						title: '剩余投资<br/>（万元）',
						width : 80,
					    footerFormatter: function (value) {
					        var summ = 0;
					        for (var i in value) {
					        	summ += parseFloat(value[i].surplusinvest);
					        }
					        return fmoney(summ,4);
					    }
				  }
				 ,{
						field: 'yearplaninvest',
						align: 'right',
						title: '本年度计划完成<br/>投资（万元）' ,
						width : 120,
					    footerFormatter: function (value) {
					        var summ = 0;
					        for (var i in value) {
					        	summ += parseFloat(value[i].yearplaninvest);
					        }
					        return fmoney(summ,4);
					    }
				  }
				 ,{
						field: 'monthplaninvest',
						align: 'right',
						title: '本月计划完成<br/>投资（万元）',
						width : 120,
					    footerFormatter: function (value) {
					        var summ = 0;
					        for (var i in value) {
					        	summ += parseFloat(value[i].monthplaninvest);
					        }
					        return fmoney(summ,4);
					    }
				  }
				 ,{
						field: 'yearrealityinvest',
						align: 'right',
						title: '本年度实际完成<br/>投资（万元）',
						width : 120,
					    footerFormatter: function (value) {
					        var summ = 0;
					        for (var i in value) {
					        	summ += parseFloat(value[i].yearrealityinvest);
					        }
					        return fmoney(summ,4);
					    }
				  }
				 ,{
						field: 'monthrealityinvest',
						align: 'right',
						title: '本月实际完成<br/>投资（万元）',
						width : 120,
					    footerFormatter: function (value) {
					        var summ = 0;
					        for (var i in value) {
					        	summ += parseFloat(value[i].monthrealityinvest);
					        }
					        return fmoney(summ,4);
					    }
				  }
				 ,{
						field: 'tendayrealityinvest',
						align: 'right',
						title: '本旬实际完成<br/>投资（万元）',
						width : 120,
					    footerFormatter: function (value) {
					        var summ = 0;
					        for (var i in value) {
					        	summ += parseFloat(value[i].tendayrealityinvest);
					        }
					        return fmoney(summ,4);
					    }
				  }
				 ,{
						field: 'earthwork',
						align: 'right',
						title: '土方<br/>（万方）',
						width : 100,
					    footerFormatter: function (value) {
					        var summ = 0;
					        for (var i in value) {
					        	summ += parseFloat(value[i].earthwork);
					        }
					        return fmoney(summ,2);
					    }
				  }
				 ,{
						field: 'stonework',
						align: 'right',
						title: '石方<br/>（万方）',
						width : 100,
					    footerFormatter: function (value) {
					        var summ = 0;
					        for (var i in value) {
					        	summ += parseFloat(value[i].stonework);
					        }
					        return fmoney(summ,2);
					    }
				  }
				 ,{
						field: 'beton',
						align: 'right',
						title: '混凝土<br/>（万立方米）',
						width : 150,
					    footerFormatter: function (value) {
					        var summ = 0;
					        for (var i in value) {
					        	summ += parseFloat(value[i].beton);
					        }
					        return fmoney(summ,2);
					    }
				  }
				]
			],
			//隔行变色
			rowStyle: function (row, index) {
				var classesArr = ['oddn', 'evenn'];
				var strclass = "";
				if (index % 2 === 0) {//偶数行
					strclass = classesArr[0];
				} else {//奇数行
					strclass = classesArr[1];
				}
				return { classes: strclass };
			}
		});
	};
	
	//得到查询的参数
	oTableInit.queryParams = function (params) {
		var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
			limit: params.limit,   //页面大小
			offset:params.offset,
			subofficeid:$("#subofficeid").val()
		};
		return temp;
	};
	return oTableInit;
};
function laterinitbegindate(_one){
	setTimeout("inputbegindate("+_one+")",300);
}
function laterinitplanfinishdate(_one){
	setTimeout("inputplanfinishdate("+_one+")",300);
}
function inputbegindate(_one){
	$("#begindate"+_one).datetimepicker({
		autoclose:true,
		minView:2,
		startView:2,
		language:'zh-CN'
	});
	$("#begindate"+_one).width(110);
}
function inputplanfinishdate(_one){
	$("#planfinishdate"+_one).datetimepicker({
		autoclose:true,
		minView:2,
		startView:2,
		language:'zh-CN'
	});
	$("#planfinishdate"+_one).width(110);
}
function subofficeDataInit(){
	$.ajax({
		url: $("#fule").val()+'suboffice/mysubofficeGetData.json',
		type: 'post',
		data: {},
		dataType: "json",
		success: function (data) {
			if(data.length == 1){
				$("#subofficedata").append('<option selected value="'
						+data[0].subofficeid+'">'+data[0].subofficename+'</option>');
				$("#subofficeid").val(data[0].subofficeid);
			}else{
				$("#subofficedata").append('<option value="0">-请选择-</option>');
				for(var i=0;i<data.length;i++){
					$("#subofficedata").append('<option value="'
							+data[i].subofficeid+'">'+data[i].subofficename+'</option>');
				}
			}
		}
	});
}
function initTableSelect(){
	//初始分局
	$(".subofficeinputsel").html($("#subofficedata").html());
}
function contracinputsel(_one){
	var subofficeid = $("#subofficeid"+_one).val();
	var data = loadContractDataBySubofficeid(subofficeid);
	var strHtml= '<option value="0">-请选择-</option>';
	$.each(data, function(key,value){
		strHtml+='<option value="'+value.contractid+'" title="'+value.contractnum+'" amount="'+value.amount+'">'+value.contractname+'</option>';
	});
	$("#contractid_"+_one).html(strHtml);
}
function loadContractDataBySubofficeid(subofficeid){
	var returnData;
	$.ajax({
		url:$("#fule").val()+"contract/contractSignedListGetDatBySuboffice.json",
		type:"POST",
		dataType:"json",
		async :false,
		data: {subofficeid : subofficeid},
		success:function(data){
			returnData = data;
		},
		error:function(){
			
		}
	});
	return returnData;
}
function setcontractnum(_this){
	$("#contractnum"+_index).html("");
	var index = _this.selectedIndex ;
	var _contractnum = $(_this.options[index]).attr("title");
	var _contractamount = $(_this.options[index]).attr("amount");
	var _index = $(_this).attr("id").split("_")[1];
	$("#contractnum"+_index).html(_contractnum);
	$("#contractamount"+_index).html(fmoney(_contractamount));
	
}

function submitFun(flag){
	var checkRow= $("#t_datagrid").bootstrapTable('getSelections');
	if(checkRow.length<=0){
		modalTitle("请选择一行",1);
		 return;
	}else{
		var checkIds = "";
		$.each(checkRow,function(key,value){
			checkIds+=value.subofficewriteid+",";
		});
		if(checkIds.length>0){
			checkIds=checkIds.substring(0,checkIds.length-1);
		}
		showloding();
		$.ajax({
			url: $("#fule").val()+'subofficewrite/submitSubofficewriteApprove.json?flag='+flag+'&checkIds='+checkIds,
			type: 'post',
			dataType: "json",
			success: function (data) {
				console.log(data)
				if(data.msgType == 1){
					modalTitle("操作成功",1);
					window.location.reload();
				}else{
					modalTitle(data.message,1);
				}
			},error:function(data){
				closeloding();
				modalTitle("操作失败，请重试",1);
			}
		});
	}
}