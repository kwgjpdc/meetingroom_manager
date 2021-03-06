<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0">
	<title>fullcalendar-日程管理</title>
	<link href="${pageContext.request.contextPath }/packages/bootstrap/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/packages/fullcalendar/fullcalendar.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/packages/fullcalendar/fullcalendar.print.min.css" rel="stylesheet" media="print">
	<link href="${pageContext.request.contextPath }/packages/jquery-ui/jquery-ui-1.10.4.custom.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/packages/bootstrap/bootstrap-datepicker.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/packages/fullcalendar/jquery-ui.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/packages/artDialog/ui-dialog.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/packages/wickedpicker/wickedpicker.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath }/packages/jquery-ui/jquery-1.10.2.js"></script>
	<script src="${pageContext.request.contextPath }/packages/fullcalendar/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/packages/fullcalendar/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath }/packages/fullcalendar/moment.min.js"></script>
	<script src="${pageContext.request.contextPath }/packages/fullcalendar/fullcalendar.js"></script>
	<script src="${pageContext.request.contextPath }/packages/jquery-ui/jquery-ui-1.10.4.custom.min.js"></script>
	<script src="${pageContext.request.contextPath }/packages/artDialog/dialog-min.js"></script>
	<script src="${pageContext.request.contextPath }/packages/bootstrap/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/packages/wickedpicker/wickedpicker.min.js"></script>
	<script src="${pageContext.request.contextPath }/packages/bootstrap/bootstrap-datepicker.min.js"></script>
	<script src="${pageContext.request.contextPath }/packages/bootstrap/bootstrap-datepicker.zh-CN.min.js"></script>
	<style>
		body{
			margin:40px 10px;
			padding:0;
			background:white;
			font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
			font-size: 14px;
		}
		#calendar{
			width:950px;
			margin-top:100px;
			float: right;
		}
		.taxt{
			width:340px;
		}
		.time{
			width:100px;
		}
		.sear{
			width:85px;
		}
		.select{
			width:150px;
		}
		.textarea{
			width:300px;
		}
		.check{
			padding:8px;
		}
		.slidertext{
			padding-top:40px;
		}
		.timepicki{
			position:relative;
			z-index: 999;
		}
		#edit{
			position:relative;
			width:300px;
		}
		#edittitle{
			padding-bottom:10px;
			font-weight: bold;
			font-size: 18px;
		}
		#edittype{
			position:absolute;
			top:5px;
			right:5px;
			width:80px;
		}
	</style>
	<script type="text/javascript">
	$(function(){
		$("#calendar").fullCalendar({
			theme: true,
			customButtons:{
				button1:{
					text:"新建",
					click:function(){
						$(".datepicker").datepicker({
							language:"zh-CN",
							format:"yyyy-mm-dd",
							todayHighlight:true,
							autoclose:true,
							weekStart:0
						});
						$(".timepicki").wickedpicker({
							title:'',
							showSeconds:true,
							twentyFour:true
						});
						$("#isallday").click(function(){
							if($("#isallday").prop("checked") == true){
								$("#isallday").val("1");
								$("#starttime,#endtime").hide();
							}else{
								$("#isallday").val("0");
								$("#starttime,#endtime").show();
							};	
						});
						$("#end").click(function(){
							if($("#end").prop("checked") == true){
								$("#enddate").show();
							}else{
								$("#enddate").hide();
							};
						});
						$("#repeat").click(function(){
							if($("#repeat").prop("checked") == true){
								$("#repeattype,#repeattime").show();
							}else{
								$("#repeattype,#repeattime").hide();
							};
						});
						$("#repeatselect").change(function(){
							switch($("#repeatselect").val()){
								case "1":
									$("#repeatclock").show();
									$("#repeatmonth,#repeatweek,#repeatday").hide();
									break;
								case "2":
									$("#repeatmonth,#repeatday").hide();
									$("#repeatweek,#repeatclock").show();
									break;
								case "3":
									$("#repeatmonth,#repeatweek").hide();
									$("#repeatday,#repeatclock").show();
									break;
								case "4":
									$("#repeatweek").hide();
									$("#repeatmonth,#repeatday,#repeatclock").show();
									break;
								case "5":
									$("#repeatclock").show();
									$("#repeatmonth,#repeatweek,#repeatday").hide();
									break;
							}
						});
						dialog({
							title:"新建日程",
							content:$("#dialog-form"),
							okValue:"确定",
							ok:function(){
								var titledetail = $("#titledetail").val();
								var startdate = $("#startdate").val();
								var starttime = $("#starttime").val().split(" ").join("");
								var enddate = $("#stopdate").val();
								var endtime = $("#endtime").val().split(" ").join("");
								var allDay = $("#isallday").val();
								if(titledetail){
									$.ajax({
										url:'http://localhost/fullcalendar/detail.php',
				   						data:{title:titledetail,sdate:startdate,stime:starttime,edate:enddate,etime:endtime,allDay:allDay},
				   						type:'POST',
				   						dataType:'json',
				  						success:function(data){
				  							$("#calendar").fullCalendar("renderEvent",data,true);
				  						},
				  						error:function(){
				  							alert("Failed");
				  						}
				   						
									});
								};
							},
							cancelValue:"关闭",
							cancel:function(){
								//$("#ui-datepicker-div").remove();
							}
						}).showModal();
					}
				},
				button2:{
					text:"查询",
					click:function(){
						$(".datepicker").datepicker({
							language:"zh-CN",
							format:"yyyy-mm-dd",
							todayHighlight:true,
							autoclose:true,
							weekStart:0
						});
						dialog({
							title:"查询",
							content:$("#search"),
							okValue:"查询",
							ok:function(){
								$("#ui-datepicker-div").remove();
							},
							button:[{
								value:"打印"
							}],
							cancelValue:"返回",
							cancel:function(){
								$("#ui-datepicker-div").remove();
							}
						}).showModal();

					}
				},
				button3:{
					text:"设置",
					click:function(){
						$("#slider").slider({
							range:true,
							min:0,
							max:24,
							values:[8,18],
							slide: function( event, ui ) {
				        		$( "#amount" ).val(ui.values[ 0 ] + ":00 - " + ui.values[ 1 ]+":00");
				        		
				      		}
						});
						$( "#amount" ).val($( "#slider" ).slider( "values", 0 ) +
      ":00 - " + $( "#slider" ).slider( "values", 1 )+":00");
						dialog({
							title:"设置时间段",
							content:$("#set"),
							okValue:"确定",
							ok:function(){
								var minTime = $( "#slider" ).slider( "values", 0 )+":00:00";
				      			var maxTime = $( "#slider" ).slider( "values", 1 )+":00:00";
				      			$("#calendar").fullCalendar("option","minTime",minTime);
				      			$("#calendar").fullCalendar("option","maxTime",maxTime);
							},
							cancelValue:"关闭",
							cancel:function(){}
						}).showModal();
					}
				}
			},
			header: {
				left: 'prev,next today button3',
				center: 'title',
				right: 'button1 button2 month,agendaWeek,agendaDay,listMonth'
			},
			firstDay: 1,
			monthNames: ["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"],
			monthNamesShort: ["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"],
			dayNames:["星期日","星期一","星期二","星期三","星期四","星期五","星期六"],
			dayNamesShort:["日","一","二","三","四","五","六"],
			buttonText:{
				today: "今天",
				month: "月",
				week: "周",
				day: "天",
				listMonth:"列表"
			},
			allDayDefault:false,
			slotLabelFormat:"H",
			businessHours: {
				dow:[1,2,3,4,5],
				start:"9:00",
				end:"18:00"
			},
			allDaySlot: true,
			allDayText: "全天",
			timeFormat: "HH:mm",//设置的是添加的具体的日程上显示的时间
			views:{
				month:{
					titleFormat:"YYYY年M月"
				},
				week:{
					titleFormat:"YYYY年M月D日",
					columnFormat:"M.D dddd"
				},
				day:{
					titleFormat:"YYYY年M月D日 dddd",
					columnFormat:"M/D dddd"
				}
			},
			dayClick: function(date,allDay,jsEvent,view){
				var selDate = $.fullCalendar.formatDate(date,"YYYY-MM-DD");
				var d = dialog({
					title:"新建事件",
					content:"<textarea rows=5 class='taxt' placeholder='内容' id='eventall'></textarea><p>"+selDate+"</p>",
					width:460,
					button:[{
						value:"完整编辑",
						callback:function(){
							$(".datepicker").datepicker({
								language:"zh-CN",
								format:"yyyy-mm-dd",
								todayHighlight:true,
								autoclose:true,
								weekStart:0
							});
							$(".timepicki").wickedpicker({
								title:'',
								showSeconds:true,
								twentyFour:true
							});
							$("#isallday").click(function(){
								if($("#isallday").prop("checked") == true){
									$("#isallday").val("1");
									$("#starttime,#endtime").hide();
								}else{
									$("#isallday").val("0");
									$("#starttime,#endtime").show();
								};	
							});
							$("#end").click(function(){
								if($("#end").prop("checked") == true){
									$("#enddate").show();
								}else{
									$("#enddate").hide();
								};
							});
							$("#repeat").click(function(){
								if($("#repeat").prop("checked") == true){
									$("#repeattype,#repeattime").show();
								}else{
									$("#repeattype,#repeattime").hide();
								};
							});
							$("#repeatselect").change(function(){
								switch($("#repeatselect").val()){
									case "1":
										$("#repeatclock").show();
										$("#repeatmonth,#repeatweek,#repeatday").hide();
										break;
									case "2":
										$("#repeatmonth,#repeatday").hide();
										$("#repeatweek,#repeatclock").show();
										break;
									case "3":
										$("#repeatmonth,#repeatweek").hide();
										$("#repeatday,#repeatclock").show();
										break;
									case "4":
										$("#repeatweek").hide();
										$("#repeatmonth,#repeatday,#repeatclock").show();
										break;
									case "5":
										$("#repeatclock").show();
										$("#repeatmonth,#repeatweek,#repeatday").hide();
										break;
								}
							});
							dialog({
								title:"新建日程",
								content:$("#dialog-form"),
								okValue:"确定",
								ok:function(){
									var titledetail = $("#titledetail").val();
									var startdate = $("#startdate").val();
									var starttime = $("#starttime").val().split(" ").join("");
									var enddate = $("#stopdate").val();
									var endtime = $("#endtime").val().split(" ").join("");
									var allDay = $("#isallday").val();
									if(titledetail){
										$.ajax({
											url:'http://localhost/fullcalendar/detail.php',
					   						data:{title:titledetail,sdate:startdate,stime:starttime,edate:enddate,etime:endtime,allDay:allDay},
					   						type:'POST',
					   						dataType:'json',
					  						success:function(data){
					  							$("#calendar").fullCalendar("renderEvent",data,true);
					  						},
					  						error:function(){
					  							alert("Failed");
					  						}
					   						
										});
									};
								},
								cancelValue:"关闭",
								cancel:function(){}
							}).showModal();
						},	
					}],
					okValue:"确定",
					ok:function(){
						var titleall = $("#eventall").val();
						if(titleall){
							$.ajax({
								url:'http://localhost/fullcalendar/events.php',
		   						data:{title:titleall, start:selDate},
		   						type:'POST',
		   						dataType:'json',
		  						success:function(data){
		  							$("#calendar").fullCalendar("renderEvent",data,true);
		  						},
		  						error:function(){
		  							alert("Failed");
		  						}
		   						
							});
						};
					},
					cancelValue:"取消",
					cancel:function(){}
				});
				d.showModal();
				
			},
			eventClick:function(event,jsEvent,view){
				var editstarttime = $.fullCalendar.formatDate(event.start,"YYYY-MM-DD HH:mm:ss");
				$("#edittitle").html(event.title);
				var eventtitle = event.title;
				if(event.end){
					var editendtime = $.fullCalendar.formatDate(event.end,"YYYY-MM-DD HH:mm:ss");
					$("#edittime").html(editstarttime+"  至  "+editendtime);
				}else{
					$("#edittime").html(editstarttime);
				};
				// var time = '19:00:00';
				dialog({
					title:"编辑日程",
					content:$("#edit"),
					okValue:"编辑",
					ok:function(){
						$(".datepicker").datepicker({
							language:"zh-CN",
							format:"yyyy-mm-dd",
							todayHighlight:true,
							autoclose:true,
							weekStart:0
						});
						$(".timepicki").wickedpicker({
							// now: time,
							title:'',
							showSeconds:true,
							twentyFour:true
						});
						$("#isallday").click(function(){
							if($("#isallday").prop("checked") == true){
								$("#isallday").val("1");
								$("#starttime,#endtime").hide();
							}else{
								$("#isallday").val("0");
								$("#starttime,#endtime").show();
							};	
						});
						$("#end").click(function(){
							if($("#end").prop("checked") == true){
								$("#enddate").show();
							}else{
								$("#enddate").hide();
							};
						});
						$("#repeat").click(function(){
							if($("#repeat").prop("checked") == true){
								$("#repeattype,#repeattime").show();
							}else{
								$("#repeattype,#repeattime").hide();
							};
						});
						$("#repeatselect").change(function(){
							switch($("#repeatselect").val()){
								case "1":
									$("#repeatclock").show();
									$("#repeatmonth,#repeatweek,#repeatday").hide();
									break;
								case "2":
									$("#repeatmonth,#repeatday").hide();
									$("#repeatweek,#repeatclock").show();
									break;
								case "3":
									$("#repeatmonth,#repeatweek").hide();
									$("#repeatday,#repeatclock").show();
									break;
								case "4":
									$("#repeatweek").hide();
									$("#repeatmonth,#repeatday,#repeatclock").show();
									break;
								case "5":
									$("#repeatclock").show();
									$("#repeatmonth,#repeatweek,#repeatday").hide();
									break;
							}
						});
						dialog({
							title:"新建日程",
							content:$("#dialog-form"),
							okValue:"确定",
							ok:function(){
								var titledetail = $("#titledetail").val();
								var startdate = $("#startdate").val();
								var starttime = $("#starttime").val().split(" ").join("");
								var enddate = $("#stopdate").val();
								var endtime = $("#endtime").val().split(" ").join("");
								var allDay = $("#isallday").val();
								if(titledetail){
									$.ajax({
										url:'http://localhost/fullcalendar/detail.php',
				   						data:{title:titledetail,sdate:startdate,stime:starttime,edate:enddate,etime:endtime,allDay:allDay},
				   						type:'POST',
				   						dataType:'json',
				  						success:function(data){
				  							$("#calendar").fullCalendar("renderEvent",data,true);
				  						},
				  						error:function(){
				  							alert("Failed");
				  						}
				   						
									});
								};
							},
							cancelValue:"关闭",
							cancel:function(){
								//$("#ui-datepicker-div").remove();
							}
						}).showModal();
						$("#calendar").fullCalendar("removeEvents",function(event){
									if(event.title==eventtitle){
										return true;
									}else{
										return false;
									}
						});
					},
					button:[{
						value:"删除",
						callback:function(){
							$("#calendar").fullCalendar("removeEvents",function(event){
									if(event.title==eventtitle){
										return true;
									}else{
										return false;
									}
							});
						}
					}],
					cancelValue:"取消",
					cancel:function(){}
				}).showModal();
			}
		
		});
	});
	</script> 
</head>
<body class="sidebar-fixed header-fixed" id="body">
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div id="calendar"></div>
		</div>
	</div>
</div>


	<%--<div id="set" style="display:none" class="taxt">
		<div id="slider"></div>
		<div style="text-align: center" class="slidertext">
			<input type="text" id="amount" style="border:0; color:#f6931f; font-weight:bold; text-align: center; font-size: 16px;">
		</div>
	</div>
	<div id="edit" style="display: none">
		<p id="edittitle"></p>
		<select id="edittype">
			<option value="">未进行</option>
			<option value="">进行中</option>
			<option value="">已完成</option>
			<option value="">已超时</option>
		</select>
		<p id="edittime"></p>
	</div>
	<div id="dialog-form" style="display:none">
		<form class="form-inline">
			<p>
				<label>事务标题：</label>
				<input type="text" class="form-control">
			</p>
			<p>
				<label>事务内容：</label>
				<textarea class="textarea" rows="4" placeholder="内容" id="titledetail"></textarea>
				<span>（必填）</span>
			</p>
			<p>
				<label>事务类型：</label>
				<select class="select">
					<option>工作事务</option>
					<option>个人事务</option>
				</select>
			</p>
			<p>
				<label>开始时间：</label>
				<input type="text" class="time datepicker" id="startdate">
				<input type="text" class="time timepicki" id="starttime">
			</p>
			<p style="display:none" id="enddate">
				<label>结束时间：</label>
				<input type="text" class="time datepicker" id="stopdate">
				<input type="text" class="time timepicki" id="endtime">
			</p>
			<p class="checkbox check">
				<label class="checkbox-inline"><input type="checkbox" id="isallday">全天</label>
				<label class="checkbox-inline"><input type="checkbox" id="end">结束时间</label>
				<label class="checkbox-inline"><input type="checkbox" id="repeat">重复</label>
			</p>
			<p id="repeattype" style="display: none">
				<label>重复类型：</label>
				<select class="select" id="repeatselect">
					<option value="1">按天重复</option>
					<option value="2">按周重复</option>
					<option value="3">按月重复</option>
					<option value="4">按年重复</option>
					<option value="5">按工作日重复</option>
				</select>
			</p>
			<p id="repeattime" style="display: none">
				<label>重复时间：</label>
				<select class="time" id="repeatmonth" style="display:none">
					<option value="">1月</option>
					<option value="">2月</option>
					<option value="">3月</option>
					<option value="">4月</option>
					<option value="">5月</option>
					<option value="">6月</option>
					<option value="">7月</option>
					<option value="">8月</option>
					<option value="">9月</option>
					<option value="">10月</option>
					<option value="">11月</option>
					<option value="">12月</option>
				</select>
				<select class="time" id="repeatday" style="display:none">
					<option value="">1日</option>
					<option value="">2日</option>
					<option value="">3日</option>
					<option value="">4日</option>
					<option value="">5日</option>
					<option value="">6日</option>
					<option value="">7日</option>
					<option value="">8日</option>
					<option value="">9日</option>
					<option value="">10日</option>
					<option value="">11日</option>
					<option value="">12日</option>
					<option value="">13日</option>
					<option value="">14日</option>
					<option value="">15日</option>
					<option value="">16日</option>
					<option value="">17日</option>
					<option value="">18日</option>
					<option value="">19日</option>
					<option value="">20日</option>
					<option value="">21日</option>
					<option value="">22日</option>
					<option value="">23日</option>
					<option value="">24日</option>
					<option value="">25日</option>
					<option value="">26日</option>
					<option value="">27日</option>
					<option value="">28日</option>
					<option value="">29日</option>
					<option value="">30日</option>
					<option value="">31日</option>
				</select>
				<select class="time" id="repeatweek" style="display:none">
					<option value="">星期一</option>
					<option value="">星期二</option>
					<option value="">星期三</option>
					<option value="">星期四</option>
					<option value="">星期五</option>
					<option value="">星期六</option>
					<option value="">星期日</option>
				</select>
				<input type="text" class="time timepicki" id="repeatclock">
			</p>
			<p>
				<label>&nbsp;&nbsp;&nbsp;参与者：</label>
				<textarea rows="3"></textarea>
			</p>
			<p></p>
		</form>
	</div>
	<div id="search" style="display:none">
		<form class="form-inline">
			<p>
				<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日期：</label>
				<input type="text" class="sear datepicker">
				<span>至</span>
				<input type="text" class="sear datepicker">
			</p>
			<p>
				<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;状态：</label>
				<select>
					<option value="">未进行</option>
					<option value="">进行中</option>
					<option value="">已完成</option>
					<option value="">已超时</option>
				</select>
			</p>
			<p>
				<label>事务类型：</label>
				<select>
					<option value="">工作事务</option>
					<option value="">个人事务</option>
				</select>
			</p>
			<p>
				<label>事务内容：</label>
				<input type="text">
			</p>
		</form>
	</div>--%>
</body>
</html>