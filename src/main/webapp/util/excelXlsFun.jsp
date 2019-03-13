<%@ page import="java.net.URLEncoder" %>
<%
if(new Integer(request.getAttribute("listcount").toString()) < 10000){
	String fileName = request.getAttribute("fileName").toString();
	response.setHeader("Content-disposition","attachment; filename="+ java.net.URLEncoder.encode(fileName, "UTF-8"));
}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%-- 页面导出选择数据页面 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	.xlsText{mso-number-format:\@;} 
	.jine{vnd.ms-excel.numberformat:#,##0.00}
	.jingzhi{vnd.ms-excel.numberformat:#,##0.0000}
	.riqi{vnd.ms-excel.numberformat:yyyy-mm-dd}
</style>
<title>${fileName }</title>
</head>
<body>

<c:if test="${listcount >= 10000}" >
<script>
	window.parent.maxAwarm();
</script>
</c:if>
<c:if test="${listcount < 10000}" >
	<table border="1" id="table1"  cellspacing="0" cellpadding="0">
		<thead>
			<tr style="background:#ffff99">
	<c:forEach items="${columns}" var="ocolumn" varStatus="status" >
				<td>${ocolumn.value}</td>
	</c:forEach>
			</tr>
		</thead>
		<tbody>
	<c:forEach items="${listData}" var="onerow" varStatus="status" >
			<tr>
		<c:forEach items="${columns}" var="ocolumn" varStatus="status" >
				<td style="${ocolumn.specailStr}">${onerow[ocolumn.key]}</td>
		</c:forEach>
			</tr>
	</c:forEach>
		</tbody>
	</table>
</c:if>
</body>
</html>