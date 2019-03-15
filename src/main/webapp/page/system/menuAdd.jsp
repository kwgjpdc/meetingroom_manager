<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String base = "http://" + request.getLocalAddr()+":"+request.getLocalPort();
String contextPath = this.getServletContext().getContextPath();
String fule = base + "/" + contextPath + "/";
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
<link rel="stylesheet" href="<%=contextPath%>/css/bootstrap-datetimepicker.min.css">
<script type="text/javascript" src="<%=contextPath%>/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/moment-with-locales.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/base.js?ts=<%=request.getAttribute("ts") %>"></script>
<script type="text/javascript" src="<%=contextPath%>/js/menuAdd.js?ts=<%=request.getAttribute("ts") %>"></script>

</head>
<body class="bgdiv" style="height:100%;background-image:url('/echart/image/loginbk1.jpg');" >
	<div id="head" >
		<%@include file="../menu.jsp" %>
	</div>
	<div id="content" class="content" >
		<div class="panel-body" style="padding-bottom:0px;">
        <div class="panel panel-default">
            <div class="panel-heading">
            	系统管理 / 菜单管理 / 菜单添加
            </div>
            <div class="panel-body">
                	
					<div class="form-group">
						<label for="menuname">菜单名称</label>
						<input type="text" class="form-control" id="menuname" style="width: 400px;" placeholder="请输入菜单名称">
					</div>
					<div class="form-group">
						<label for="url">URL</label>
						<input type="text" class="form-control" id="url" style="width: 400px;" placeholder="请输入url">
					</div>
					<div class="form-group">
						<label for="ismenu">是否父菜单</label>
						<select class="form-control" id="ismenu" name="ismenu" style="width: 200px;">
							<option value="1">是</option>
							<option value="0">否</option>
						</select>
					</div>
					<div class="form-group">
						<label for="pid">上级菜单</label>
						<select class="form-control" id="pid" name="pid" style="width: 200px;">
							<option value=""></option>
						</select>
					</div>
					<div class="form-group">
						<label for="priority">排序序号</label>
						<input type="text" class="form-control" id="priority" value="0" style="width: 400px;" placeholder="请输入排序序号">
					</div>
					<button onclick="save()" class="btn btn-primary">提交</button>
            </div>
        </div>       
		</div>
	</div>
</body>

</html>