<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ page isELIgnored="false"%>
<html>
<head>
<meta charset="UTF-8">
<title>会议室预订</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/base.css?ts=<%=request.getAttribute("ts")%>" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/main.css?ts=<%=request.getAttribute("ts")%>" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/base.js?ts=<%=request.getAttribute("ts")%>"></script>

</head>
<body class="bgdiv"
	style="height: 100%;">
	<div id="head">
		<!-- 页面头部 -->
		<%@include file="page/menu.jsp"%>
		<!-- 导航侧栏 -->
		<%@include file="page/aside.jsp"%>
	</div>
	<div id="bodydiv" >
		<div class="left" >
			<div style="font-size: 30px">yyyymmdd 区域楼层 会议主题</div>
			<div style="font-size: 30px">yyyymmdd 区域楼层 会议主题</div>
			<div style="font-size: 30px">yyyymmdd 区域楼层 会议主题</div>
			<div style="font-size: 30px">yyyymmdd 区域楼层 会议主题</div>
			<div style="font-size: 30px">yyyymmdd 区域楼层 会议主题</div>
			<div style="font-size: 30px">yyyymmdd 区域楼层 会议主题</div>
			<div style="font-size: 30px">yyyymmdd 区域楼层 会议主题</div>
			<div style="font-size: 30px">yyyymmdd 区域楼层 会议主题</div>
			<div style="font-size: 30px">yyyymmdd 区域楼层 会议主题</div>
			<div style="font-size: 30px">yyyymmdd 区域楼层 会议主题</div>
			<div style="font-size: 30px">yyyymmdd 区域楼层 会议主题</div>
			<div style="font-size: 30px">yyyymmdd 区域楼层 会议主题</div>
		</div>
		<div class="right" >
			<div style="font-size: 80pt;text-align: center;vertical-align: middle;padding:50px;">会议室<br/>预定</div>
		</div>
	</div>
</body>
</html>