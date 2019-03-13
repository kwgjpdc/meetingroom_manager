$(document).ready(function(){
	$("#operinfo").css({'color':'red','font-weight':'bold','margin-left':(window.innerWidth/2-400)});
	initDateTable();
	$("#contentTablediv").height(window.innerHeight-$("#head").height()-$("#searchdiv").height()-40);
	initSelectPicker();
	initTableSelect();
	$(".datetimepicker").datetimepicker();
	$(".datetimepicker").width(110);
	
});
function initSelectPicker(){
	typeSelect();
	yaerSelect();
	subofficeDataInit();
	contractDataInit();
}
function yaerSelect(){
	var _nowyear = parseInt($("#yeardefault").val());
	
	for(var i = 20; i > 0; i--){
		$("#txt_search_year").append("<option value='"+(_nowyear-i)+"'>"+(_nowyear-i)+"</option>");
	}
	$("#txt_search_year").append('<option selected value="'+_nowyear+'">'+_nowyear+'</option>');
	for(var i = 1; i <= 20; i++){
		$("#txt_search_year").append("<option value='"+(_nowyear+i)+"'>"+(_nowyear+i)+"</option>");
	
	}

	//刷新select
	$("#txt_search_year").selectpicker("refresh");
}
function typeSelect(){
	$.ajax({
		url: $("#fule").val()+'systemcode/getCodeTypeList.json',
		type: 'post',
		data: {"codetype": "costtype"},
		dataType: "json",
		success: function (data) {
			var checked = '';
			for(var i=0;i<data.length;i++){
				if($("#ctypedefault").val() == data[i].key){
					checked = 'selected';
				}else{
					checked = '';
				}
				$("#txt_search_ctype").append('<option title="'+data[i].maintypedescribe
						+'" '+checked+' value="'+data[i].key+'">'+data[i].value+'</option>');
			}
			//这一步不要忘记 不然下拉框没有数据
			$("#txt_search_ctype").selectpicker("refresh");
		}
	});
}
function subofficeDataInit(){
	$.ajax({
		url: $("#fule").val()+'suboffice/subofficeGetData.json',
		type: 'post',
		data: {},
		dataType: "json",
		success: function (data) {
			for(var i=0;i<data.length;i++){
				$("#subofficedata").append('<option value="'
						+data[i].subofficeid+'">'+data[i].subofficename+'</option>');
			}
		}
	});
}
function contractDataInit(){
	$.ajax({
		url: $("#fule").val()+'contract/contractListGetData.json',
		type: 'post',
		data: {},
		dataType: "json",
		success: function (data) {
			for(var i=0;i<data.length;i++){
				$("#contractdata").append('<option subofficeid="'+data[i].subofficeid+'" value="'
						+data[i].contractid+'" contractnum="'+data[i].contractnum+'" >'+data[i].contractname+'</option>');
			}
		}
	});
}

function initTableSelect(){
	//初始分局
	$(".subofficeinputsel").html($("#subofficedata").html());
	
	//初始合同
	var contractinputs = $(".contractdatainputsel");
	var contractOps = $("#contractdata").find("option");
	var mysubofficeid = '';
	if(contractinputs != null && contractinputs != undefined 
			&& contractOps != null && contractOps != undefined)
	for(var i = 0; i < contractinputs.length; i++){
		mysubofficeid = $(contractinputs[i]).attr("subofficeid");
		for(var j = 0; i < contractOps.length; j++){
			if($(contractOps[j]).attr("subofficeid") == mysubofficeid){
				$(contractinputs[i]).append($(contractOps[j]));
			}
		}
	}
	
    $("select").selectpicker("refresh");
}
function inputdownforv(_this){
	var showstr = $(_this).html();
	var value = $(_this).html();
	
	var _id = $(_this).parent().parent().attr("id");
	var indexinfo = _id.split("_");
	$("#"+indexinfo[0]+indexinfo[1]).val(value);
	$("#"+indexinfo[0]+"span"+indexinfo[1]).html(showstr);
}
function initDateTable(){
	var tparam = {
			year:$("#txt_search_year").val(),
			costType:$("#txt_search_ctype").val()
	};
	var TableInit = function () {
		var oTableInit = new Object();
		//初始化Table
		oTableInit.Init = function () {
			$('#t_datagrid').bootstrapTable({
				url: '/echart/financing/getflistDetailData.json',         //请求后台的URL（*）
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
							field: 'costtype',
							align: 'center',
							title: '款项类型' ,
							valign : "middle",
							width : 100,
							formatter:function (value, row, index, field) {
								var _val = value;
								if(value == undefined || value == ''){
									var index = document.getElementById("txt_search_ctype").selectedIndex;
									_val = document.getElementById("txt_search_ctype").options[index].text;;
								}
								return _val;
						    }
					  },
					  {
							field: 'maintype',
							align: 'center',
							title: '类型所属' ,
							valign : "middle",
							width : 100,
							formatter:function (value, row, index, field) {
								var _val = value;
								if(value == undefined || value == ''){
									var index = document.getElementById("txt_search_ctype").selectedIndex;
									_val = document.getElementById("txt_search_ctype").options[index].getAttribute("title");;
								}
								return _val;
						    }
					  },
					  {
						field: 'subofficeid',
						align: 'center',
						title: '所属分局' ,
						valign : "middle",
						width : 100,
						formatter:function (value, row, index, field) {
					        return '<select class="subofficeinputsel" id="subofficeid'+index+'" data-width="100px" value="'+value+'" ></select>';
					    }
					  },
					  {
							field: 'contractname',
							align: 'center',
							title: '合同名称' ,
							valign : "middle",
							width : 200,
							formatter:function (value, row, index, field) {
								return '<select subofficeid="'+row["subofficeid"]+'" class="contractinputsel" id="contractid'+index+'" data-width="100px" value="'+value+'" ></select>';
							}
					  },
					  {
						field: 'contractno',
						align: 'center',
						title: '合同编号' ,
						valign : "middle",
						width : 150,
						formatter:function (value, row, index, field) {
							if(value == undefined || value == null) value = '';
							return '<span id="contractno'+index+'"></span>';
						}
					  },
					  {
							field: 'money',
							align: 'center',
							title: '应付款(元)' ,
							width : 150,
							formatter:function (value, row, index, field) {
						        return '<div contenteditable="true" class="editDiv">' + (value || "") + '</div>';
						    }
					  },
					  {
						field: 'payfordate',
						align: 'center',
						title: '支付日期' ,
						valign : "middle",
						width : 120,
						formatter:function (value, row, index, field) {
							if(value == undefined){
								value = '';
							}
					        return '<div class="col-sm-1"><input width="100" type="text" value="'+value+'" id="payfordate'+index+'" class="datetimepicker" data-date-format="yyyy-mm-dd" ></div>';
					    }
					  },
					  {
						field: 'cashierno',
						align: 'center',
						title: '出纳编号' ,
						width : 100,
						formatter:function (value, row, index, field) {
					        return '<div contenteditable="true" class="editDiv">' + (value || "") + '</div>';
					    }
					  },
					  {
						field: 'voucherno',
						align: 'center',
						title: '凭证号' ,
						width : 100,
						formatter:function (value, row, index, field) {
					        return '<div contenteditable="true" class="editDiv">' + (value || "") + '</div>';
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
			/*
			var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
				limit: params.limit,   //页面大小
				offset:params.offset,
				year:params.year
			};
			*/
			return params;
		};
		return oTableInit;
	};
	
	var oTable = new TableInit();
	oTable.Init();
	
}
/**
 * 新增一行数据
 */
var hasnosave = false;
function addRow(){
	if(hasnosave){
		alert("您尚有未完成的操作，请保存当前行");
	}else{
	    var count = $('#t_datagrid').bootstrapTable('getData').length;
	    // newFlag == 1的数据为新规的数据
	    $('#t_datagrid').bootstrapTable('insertRow',{index:count,row:{newFlag:"1"}});
		$("#subofficeid"+count).html($("#subofficedata").html());
	    $("#subofficeid"+count).selectpicker("refresh");
	    $("#payfordate"+count).datepicker();
	    $("#payfordate"+count).width(110);
	    hasnosave = true;
	}
}
function saveRow(){
	if(!hasnosave){
		modalTitle("没有可保存的数据，请先新增行",1,null);
		return;
	}
	var rows = $("#t_datagrid").bootstrapTable('getData');
	var datas = rows[rows.length-1];

	modalTitle(rows.length,1,null);
	
	/*
	$.ajax({
		url: $("#fule").val()+'systemcode/getCodeTypeList.json',
		type: 'post',
		data: datas,
		dataType: "json",
		success: function (data) {
			if(data.mesType == 0){
				hasnosave = false;
				Modal.alert({
					title:'提示',
					msg: data.msg,
					btnok: '确定'
				}).on(function (e) {
					if(callback){
						//callback();
					}
				});
			}else{
				
			}
		}
	});
	*/
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