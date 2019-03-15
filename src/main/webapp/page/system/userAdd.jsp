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
<script type="text/javascript" src="<%=contextPath%>/js/userAdd.js?ts=<%=request.getAttribute("ts") %>"></script>

</head>
<body class="bgdiv" style="height:100%;background-image:url('/echart/image/loginbk1.jpg');" >
	<div id="head" >
		<%@include file="../menu.jsp" %>
	</div>
	<div id="content" class="content" >
		<div class="panel-body" style="padding-bottom:0px;">
        <div class="panel panel-default">
            <div class="panel-heading">
            	系统管理 / 用户管理 / 用户添加
            </div>
            <div class="panel-body">
                	
					<div class="form-group">
						<label for="username">用户名</label>
						<input type="text" class="form-control" id="username" style="width: 400px;" placeholder="请输入用户名">
					</div>
					<div class="form-group">
						<label for="realname">真实姓名</label>
						<input type="text" class="form-control" id="realname" style="width: 400px;" placeholder="请输入真实姓名">
					</div>
					<div class="form-group">
						<label for="sex">性别</label>
						<select class="form-control" id="sex" name="sex" style="width: 200px;">
							<option value="M">男</option>
							<option value="F">女</option>
						</select>
					</div>
					<div class="form-group">
						<label for="password">密码</label>
						<input type="text" class="form-control" id="password" style="width: 200px;" placeholder="请输入密码">
					</div>
					<div class="form-group">
						<label for="email">邮箱</label>
						<input type="text" class="form-control" id="email" style="width: 400px;" placeholder="请输入邮箱">
					</div>
					<button onclick="save()" class="btn btn-primary">提交</button>
            </div>
        </div>       
		</div>
	</div>
</body>

</html>