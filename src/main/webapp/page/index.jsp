<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ page isELIgnored="false"%>
<html>
<head>
<meta charset="UTF-8">
<title>SmartMeetingRoom</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/base.css?ts=<%=request.getAttribute("ts")%>" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/main.css?ts=<%=request.getAttribute("ts")%>" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/base.js?ts=<%=request.getAttribute("ts")%>"></script>

</head>
<body class="bgdiv" style="height: 100%;">
<div id="head">
	<!-- 页面头部 -->
	<%@include file="top.jsp"%>
	<!-- 导航侧栏 -->
	<%@include file="aside.jsp"%>
</div>
</body>
</html>