$(document).ready(function(){
	$("#operinfo").css({'color':'red','font-weight':'bold','margin-left':(window.innerWidth/2-400)});
	$("#contentTablediv").height(window.innerHeight-$("#head").height()-$("#searchdiv").height()-40);
	initSelectPicker();
	initDateTable();
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
		url: $("#fule").val()+'/getCashListData.json',
		type: 'post',
		data: {"cashtype": "costtypes"},
		dataType: "json",
		success: function (data) {
			var checked = '';
			for(var i=0;i<data.length;i++){
				if($("#ctypedefault").val() == data[i].key){
					checked = 'selected';
				}else{
					checked = '';
				}
				$("#txt_search_ctype").append('<option lang="'+data[i].maintype+'" label="'+data[i].maintypedescribe
						+'" '+checked+' value="'+data[i].key+'">'+data[i].value+'</option>');
			}
			//这一步不要忘记 不然下拉框没有数据
			$("#txt_search_ctype").selectpicker("refresh");
		}
	});
}
function subofficeDataInit(){
	$.ajax({
		url: $("#fule").val()+'/getCashListData.json',
		type: 'post',
		data: {"cashtype": "suboffices"},
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
		url: $("#fule").val()+'/getCashListData.json',
		type: 'post',
		data: {"cashtype": "contracts"},
		dataType: "json",
		success: function (data) {
			for(var i=0;i<data.length;i++){
				$("#contractdata").append('<option label="'+data[i].subofficeid+'" value="'
						+data[i].contractid+'" lang="'+data[i].contractnum+'" >'+data[i].contractname+'</option>');
			}
		}
	});
}
function laterinitsub(_one){
	setTimeout("subofficeinputsel("+_one+")",300);
}
function laterinitcon(_one){
	setTimeout("contracinputsel("+_one+")",300);
}
function laterinitpayfordate(_one){
	setTimeout("inputpayfordate("+_one+")",300);
}
function inputpayfordate(_one){
	$("#payfordate"+_one).datepicker();
}
function subofficeinputsel(_one){

	var subofficeinput = null;

	if(_one == null){
		return;
	}else{
		subofficeinput = $("#subofficeid"+_one);
	}
	
	var subofficeOps = $("#subofficedata").find("option");
	var mysubofficeid = '';
	if(subofficeinput != null && subofficeinput != undefined){
		if(subofficeOps == null || subofficeOps == undefined){
			subofficeOps = new Array();
		}
		var outHtmls = '';
		mysubofficeid = $(subofficeinput).attr("lang");
		var onehtm = '';
		var hasChecked = false;
		for(var j = 0; j < subofficeOps.length; j++){
			onehtm = $(subofficeOps[j]).prop("outerHTML");
			if($(subofficeOps[j]).attr("value") == mysubofficeid){
				onehtm = onehtm.replace("<option","<option selected ");
				hasChecked = true;
			}
			outHtmls = outHtmls + onehtm;
		}
		if(hasChecked){
			outHtmls = '<option value="" >请选择分局</option>' + outHtmls;
		}else{
			outHtmls = '<option selected value="" >请选择分局</option>' + outHtmls;
		}
		$(subofficeinput).html(outHtmls);
		$(subofficeinput).selectpicker("refresh");
	}
}
function contracinputsel(_one){
	var contractinput = null;

	if(_one == null){
		return;
	}else{
		contractinput = $("#contractid_"+_one);
	}
	
	var contractOps = $("#contractdata").find("option");
	var mysubofficeid = '';
	if(contractinput != null && contractinput != undefined){
		if(contractOps == null || contractOps == undefined){
			contractOps = new Array();
		}
		var opscount = 0;
		var outHtmls = '';
		var oneHtm = '';
		var hasChecked = false;
		var mycheckv = $(contractinput).attr("lang");
		mysubofficeid = $("#subofficeid"+_one).val();
		opscount = 0;
		for(var j = 0; j < contractOps.length; j++){
			if($(contractOps[j]).attr("label") == mysubofficeid){
				oneHtm = $(contractOps[j]).prop("outerHTML");
				if(mycheckv == $(contractOps[j]).attr("value")){
					oneHtm = oneHtm.replace("<option","<option selected ");
					$("#contractno"+_one).html($(contractOps[j]).attr("lang"));
					hasChecked = true;
				}
				outHtmls = outHtmls + oneHtm;
				opscount++;
			}
		}
		$(contractinput).html(outHtmls);
		if(hasChecked){
			outHtmls = '<option value="" >请选择合同</option>' + outHtmls;
		}else{
			outHtmls = '<option selected value="" >请选择合同</option>' + outHtmls;
		}
		
		if(opscount == 0){
			$(contractinput).append('<option value="" >没有合同</option>');
		}
		$(contractinput).selectpicker("refresh");
	}
	
}
function setcontractno(_this){
	var index = _this.selectedIndex ;
	var _contractno = $(_this.options[index]).attr("lang");
	var _index = $(_this).attr("id").split("_")[1];
	$("#contractno"+_index).html(_contractno);
}
function initDateTable(){
	var _url = $("#fule").val()+'financing/getflistDetailData.json';
	//_url = _url + '?year='+$("#yeardefault").val()+'&costtype='+$("#ctypedefault").val();
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
				queryParams:function(params) {
					return {
						year:$("#yeardefault").val(),
						costtype:$("#ctypedefault").val()
					};
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
									var _index = document.getElementById("txt_search_ctype").selectedIndex;
									_val = $(document.getElementById("txt_search_ctype").options[_index]).attr("lang");
								}
								if(value == undefined) value = '';
								return (index+1)+'<input type="hidden" value="'+value+'" name="list['+index+'].id" />' 
								+'<input type="hidden" value="'+$("#txt_search_ctype").val()+'" name="list['+index+'].costtype" />'
								+'<input type="hidden" value="'+_val+'" name="list['+index+'].maintype" />'
								+'<input type="hidden" value="'+$("#txt_search_year").val()+'" name="list['+index+'].writeyear" />';
							}
					  },
					  {field:'costtype',visible:false},
					  {
							field: 'costtypeStr',align: 'center',title: '款项类型' ,valign : "middle",width : 100,
							formatter:function (value, row, index, field) {
								var _val = value;
								var _index = document.getElementById("txt_search_ctype").selectedIndex;
								_val = document.getElementById("txt_search_ctype").options[_index].text;
								return _val;
						    }
					  },
					  {field:'maintype',visible:false},
					  {
							field: 'maintypestr',align: 'center',title: '类型所属' ,valign : "middle",width : 100,
							formatter:function (value, row, index, field) {
								var _show = value;
								if(value == undefined || value == ''){
									var _index = document.getElementById("txt_search_ctype").selectedIndex;
									_show = document.getElementById("txt_search_ctype").options[_index].getAttribute("label");
								}
								return _show;
						    }
					  },
					  {
						  	field: 'subofficeid',align: 'center',title: '所属分局' ,valign : "middle",	width : 130,
						  	formatter:function (value, row, index, field) {
						  		laterinitsub(index);
						  		return '<select name="list['+index+'].subofficeid" onchange="contracinputsel(\''+index+'\')" class="form-control" id="subofficeid'+index+'" data-width="100px" style="width:100px" lang="'+value+'" ></select>';
						  	}
					  },
					  {
							field: 'contractid',align: 'center',title: '合同名称' ,valign : "middle",width : 230,
							formatter:function (value, row, index, field) {
						  		laterinitcon(index);
								return '<select name="list['+index+'].contractid" onchange="setcontractno(this)" subofficeid="'+row["subofficeid"]+'" class="form-control" id="contractid_'+index+'" data-width="200px" style="width:200px" lang="'+value+'" ></select>';
							}
					  },
					  {
						field: 'contractno',align: 'center',title: '合同编号' ,valign : "middle",width : 250,
						formatter:function (value, row, index, field) {
							if(value == undefined || value == null) value = '';
							return '<span id="contractno'+index+'">'+value+'</span>';
						}
					  },
					  {
							field: 'money',align: 'right',title: '应付款(元)' ,width : 150,
							formatter:function (value, row, index, field) {
								//class="editDiv"
								if(value == null || value == undefined) value = '';
						        return '<div id="inputmoney_'+index+'" contenteditable="true" onblur="$(this).html(fmoney($(this).html(),2))" >' + (fmoney(value,2) || "") + '</div>' + 
								'<input type="hidden" value="'+(value || "")+'" id="money'+index+'" name="list['+index+'].money" />';
						    }
					  },
					  {
						field: 'payfordate',align: 'center',title: '支付日期' ,valign : "middle",width : 250,
						formatter:function (value, row, index, field) {
							if(value == undefined){
								value = '';
							}
							laterinitpayfordate(index);
					        return '<input readonly="true" name="list['+index+'].payfordateStr" width="100" type="text" value="'+value+'" id="payfordate'+index+'" class="datetimepicker" data-date-format="yyyy-mm-dd" >';
					    }
					  },
					  {
						field: 'cashierno',align: 'center',title: '出纳编号' ,width : 100,
						formatter:function (value, row, index, field) {
							//class="editDiv"
					        return '<div id="inputcashierno_'+index+'" contenteditable="true" >' + (value || "") + '</div>' +
							'<input type="hidden" value="'+(value || "")+'" id="cashierno'+index+'" name="list['+index+'].cashierno" />';
					    }
					  },
					  {
						field: 'voucherno',align: 'center',title: '凭证号' ,
						formatter:function (value, row, index, field) {
							//class="editDiv"
					        return '<div id="inputvoucherno_'+index+'" contenteditable="true" >' + (value || "") + '</div>' +
							'<input type="hidden" value="'+(value || "")+'" id="voucherno'+index+'" name="list['+index+'].voucherno" />';
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
	    contracinputsel(count);
	    $("#payfordate"+count).datepicker();
	    hasnosave = true;
	}
}
function saveRow(){
	var length = 0;
	if(true){
		var rows = $("#t_datagrid").bootstrapTable('getData');
		length = rows.length; 
	}
	if(length == 0){
		modalTitle("没有可提交得数据",1,800,600);
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
	}

	modalTitle("未填写的支付日期会默认为当日，<br/>是否确定提交?",2);
}
function saveFun(){
	showloding();
	$.ajax({
		url: $("#fule").val()+'financing/insertFinancing.json',
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
/**
 * 删除一行数据
 */
function delRow(){

    var checkRow= $("#t_datagrid").bootstrapTable('getSelections');
    if(checkRow.length<=0){
		modalTitle("请选中一行",1);
    }else{
    	modalTitle("是否确定删除?",3);
    }
}
function deleteFun(){
    var checkRow= $("#t_datagrid").bootstrapTable('getSelections');
	var _id = checkRow[0]["id"] ;
	if(_id == null || _id == undefined || _id == 0){
		reloadtable();
		modalTitle("操作成功",1);
	    hasnosave = false;
	}else{
		$.ajax({
			url: $("#fule").val()+'financing/deleteFinancing.json',
			type: 'post',
			data: {id:_id},
			dataType: "json",
			success: function (data) {
				if(data.msgType == 1){
					reloadtable();
					modalTitle("操作成功",1);
				    hasnosave = false;
				}else{
					modalTitle("操作失败，请重试",1);
				}
			},error:function(data){
				modalTitle("操作失败，请重试",1);
			}
		});
	}
}

function reloadtable(){
    hasnosave = false;
	var _year= $('#txt_search_year').val();
    var _costtype= $('#txt_search_ctype').val();
    var options = $('#t_datagrid').bootstrapTable('refresh', {
        query: 
        {
        	year:_year,
        	costtype:_costtype
        }
    });
}