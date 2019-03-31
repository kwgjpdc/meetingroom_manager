<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String base = "http://" + request.getLocalAddr()+":"+request.getLocalPort();
String contextPath = this.getServletContext().getContextPath();
String fule = base + "" + contextPath + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>月度统计表</title>
<link rel="stylesheet" href="<%=contextPath%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=contextPath%>/css/bootstrap-table.min.css">
<link rel="stylesheet" href="<%=contextPath%>/css/bootstrapValidator.min.css">
<link rel="stylesheet" href="<%=contextPath%>/css/the-modal.css">
<link rel="stylesheet" href="<%=contextPath%>/css/base.css?ts=<%=request.getAttribute("ts") %>" type="text/css" />
<link rel="stylesheet" href="<%=contextPath%>/css/main.css?ts=<%=request.getAttribute("ts") %>" type="text/css" />
<link rel="stylesheet" href="<%=contextPath%>/css/monthTotalList.css?ts=<%=request.getAttribute("ts") %>" type="text/css" />
<script type="text/javascript" src="<%=contextPath%>/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/echarts.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.the-modal.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/base.js?ts=<%=request.getAttribute("ts") %>"></script>
<script type="text/javascript" src="<%=contextPath%>/js/contractExecuteMonthTotalList.js?ts=<%=request.getAttribute("ts") %>"></script>

</head>
<body class="bgdiv" style="height:100%;background-image:url('/echart/image/loginbk1.jpg');" >
<div id="head" >
	<%@include file="../menu.jsp" %>
</div>
<div id="content" class="content" >
	<div class="panel-body" style="padding-bottom:0px;">
    	<div id="searchdiv" class="panel panel-default">
            <div class="panel-heading">
            	统计报表 / 合同月度统计表
            	<div id="toolbar" class="btn-group btn-group-right" >
		            <button id="printbtn" type="button" class="btn btn-default" onclick="print()" >
		                <span class="glyphicon" aria-hidden="true" >打印</span>
		            </button>
		            <button id="excelbtn" type="button" class="btn btn-default" onclick="doexcel()" >
		                <span class="glyphicon" aria-hidden="true"  >导出</span>
		            </button>
		            <button id="btn_changeCahart" style="display:none;" type="button" 
		            	class="btn btn-default" onclick="dochange()" >
		                <span class="glyphicon" aria-hidden="true"  >切换视图</span>
		            </button>
		            <button id="btn_change" type="button" class="btn btn-default" onclick="changeView()" >
		                <span class="glyphicon" aria-hidden="true" id="btnLabber" >图表视图</span>
		            </button>
		        </div>
            </div>
            <div class="panel-body">
                <form id="formSearch" class="form-horizontal" method="post" autosubmit="return false;" >
                	<input type="hidden" name="dcdytype" value="htzxytjb" />
                	<input type="hidden" name="filename" id="filename" />
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" for="department">部门</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="department" name="department" >
                        </div>
                        <label class="control-label col-sm-1" for="year">年份</label>
                        <div class="col-sm-1">
                            <input type="text" class="form-control" id="year" name="year" >
                        </div>
                        <label class="control-label col-sm-1" for="month">月份</label>
                        <div class="col-sm-1">
                            <input type="text" class="form-control" id="month" name="month" >
                        </div>
                        <div class="col-sm-2" style="text-align:left;">
                            <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>       
		<div id="contentTablediv" >
        	<table id="t_datagrid"></table>
        </div>
		<div id="pieEchartdiv1" style="display:none;width:100%;height:100%;" >
			<div id="onepiediv1" class="pieone" ></div>
			<div id="onepiediv2" class="pieone" ></div>
			<div id="onepiediv3" class="pieone" ></div>
			<div id="onepiediv4" class="pieone" ></div>
			<div id="onepiediv5" class="pieone" ></div>
			<div id="onepiediv6" class="pieone" ></div>
		</div>
		<div id="pieEchartdiv2" style="display:none;width:100%;height:100%;" >
			<div id="onepie2div1" class="pieone" ></div>
			<div id="onepie2div2" class="pieone" ></div>
			<div id="onepie2div3" class="pieone" ></div>
			<div id="onepie2div4" class="pieone" ></div>
			<div id="onepie2div5" class="pieone" ></div>
			<div id="onepie2div6" class="pieone" ></div>
			<div id="onepie2div7" class="pieone" ></div>
		</div>
        </div>
</div>
</body>
</html>