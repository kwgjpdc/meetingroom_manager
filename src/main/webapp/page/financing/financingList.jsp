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
<title>滇中引水管理局</title>
<link rel="stylesheet" href="<%=contextPath%>/css/base.css?ts=<%=request.getAttribute("ts") %>" type="text/css" />
<link rel="stylesheet" href="<%=contextPath%>/css/main.css?ts=<%=request.getAttribute("ts") %>" type="text/css" />
<link rel="stylesheet" href="<%=contextPath%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=contextPath%>/css/bootstrap-table.min.css">
<link rel="stylesheet" href="<%=contextPath%>/css/bootstrap-editable.css">
<link rel="stylesheet" href="<%=contextPath%>/css/bootstrap-select.min.css">
<script type="text/javascript" src="<%=contextPath%>/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/bootstrap-editable.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/base.js?ts=<%=request.getAttribute("ts") %>"></script>
<script type="text/javascript" src="<%=contextPath%>/js/financingList.js?ts=<%=request.getAttribute("ts") %>"></script>
<style type="text/css">
	.table {table-layout:fixed;}
</style>
</head>
<body class="bgdiv" style="height:100%;background-image:url('/echart/image/loginbk1.jpg');" >
	<div id="head" >
		<%@include file="../menu.jsp" %>
	</div>
	<div id="content" class="content" >
		<div class="panel-body" style="padding-bottom:0px;">
        <div id="searchdiv" class="panel panel-default">
            <div class="panel-heading">
            	填报管理 / 财务填报 
            	<div id="toolbar" class="btn-group btn-group-right" >
		            <button id="printbtn" type="button" class="btn btn-default" onclick="print()" >
		                <span class="glyphicon" aria-hidden="true" >打印</span>
		            </button>
		            <button id="excelbtn" type="button" class="btn btn-default" onclick="doexcel(this)" >
		                <span class="glyphicon" aria-hidden="true"  >导出</span>
		            </button>
		        </div>
            </div>
            <div class="panel-body">
                <form id="formSearch" class="form-horizontal" autosubmit="return false;" method="post" >
                	<input type="hidden" name="dcdytype" value="cwtbhzczlb" />
                	<input type="hidden" name="fileName" id="fileName" />
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" for="year" >所属年份</label>
                        <div class="col-sm-2">
                        	<select id="writeyear" lang="<%=request.getAttribute("year") %>" onchange="reloadtable()" name="writeyear" class="selectpicker" data-width="100px" >
                        	</select>
                        </div>
                        <!-- 
                        <div class="col-sm-2" style="text-align:left;">
                            <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                        </div>
                         -->
                    </div>
                </form>
            </div>
        </div>       

        <div id="bodydiv" >
        	<table id="t_datagrid"></table>
        </div>
	</div>
</div>
</body>

</html>