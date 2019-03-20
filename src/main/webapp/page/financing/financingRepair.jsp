<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String base = "http://" + request.getLocalAddr()+":"+request.getLocalPort();
String contextPath = this.getServletContext().getContextPath();
String fule = base + contextPath + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>滇中引水管理局</title>
<link rel="stylesheet" href="<%=contextPath%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=contextPath%>/css/bootstrap-table.min.css">
<link rel="stylesheet" href="<%=contextPath%>/css/bootstrap-select.min.css">
<link rel="stylesheet" href="<%=contextPath%>/css/bootstrap-editable.css">
<link rel="stylesheet" href="<%=contextPath%>/css/the-modal.css">
<link rel="stylesheet" href="<%=contextPath%>/css/base.css?ts=<%=request.getAttribute("ts") %>" type="text/css" />
<link rel="stylesheet" href="<%=contextPath%>/css/main.css?ts=<%=request.getAttribute("ts") %>" type="text/css" />
<script type="text/javascript" src="<%=contextPath%>/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/bootstrap-editable.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.the-modal.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/base.js?ts=<%=request.getAttribute("ts") %>"></script>
<script type="text/javascript" src="<%=contextPath%>/js/financingRepair.js?ts=<%=request.getAttribute("ts") %>"></script>

</head>
<body class="bgdiv" style="height:100%;background-image:url('/echart/image/loginbk1.jpg');" >

	<div id="head" >
		<%@include file="../menu.jsp" %>
	</div>
	<div id="content" class="content" >
		<div class="panel-body" style="padding-bottom:0px;">
		
		
        <div id="searchdiv" class="panel panel-default">
            <div class="panel-heading" style="height: 41px;">
            	财务填报 / 工程投资完成汇总数据补录
            	 <form id="formSearch" class="form-horizontal" style="margin-left: 130px;margin-top: -40px;">
                	<input type="hidden" id="yeardefault" value="<%=request.getAttribute("year") %>" >
                	 <input type="hidden" id="costtypedefault" value="<%=request.getAttribute("costtype") %>" >
                    <div class="form-group" style="margin-top:15px">
                        <div class="col-sm-1">
                        	<select id="year" onchange="reloadtable()" name="year" class="selectpicker" data-width="100px" >
                        	</select>
                        </div>
                        <div class="col-sm-1" style="margin-left: 5px;">
                        	<select id="month" onchange="reloadtable()" name="month" class="selectpicker" data-width="50px" >
                        	</select>
                        </div>
                    </div>
                </form>
            	<div id="operinfo" style="margin-top: -43px;">编辑数据后，请执行保存操作，以免数据丢失造成不便！</div >
            	<div id="toolbar" class="btn-group btn-group-right"  style="margin-top: -28px;">
		            <button id="btn_add" type="button" class="btn btn-default" onclick="saveRow()"
		            	data-toggle="modal" data-target="#myModal" >
		                <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>保存
		            </button>
		        </div>
            </div>
        </div>       

        <div id="bodydiv" >
			<form style="border:none;margin:0px;padding:0px;" id="editForm" 
				action="<%=fule %>financing/insertRepair.json" method="post" >
        		<table id="t_datagrid"></table>
			</form>
        </div>
	</div>
</div>

</body>

</html>