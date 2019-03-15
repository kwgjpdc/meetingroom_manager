<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%-- 页面导出选择数据页面 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="prowindex" scope ="request" value="1" />
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
	<table border="1" id="table1"  cellspacing="0" cellpadding="0">
		<thead>
			<tr>
	<c:forEach items="${titles}" var="ocolumn" varStatus="status" >
		<c:if test="${ocolumn.rowindex ne prowindex}" >
			</tr>
			<tr style="background:#ffff99">
		</c:if>
		<c:set var="prowindex" scope ="request" value="${ocolumn.rowindex }" />
				<td id="${ocolumn.tdid}" rowspan="${ocolumn.mrowspan}" colspan="${ocolumn.mcolspan}">
		<c:if test="${empty ocolumn.tdid}" >${ocolumn.showtitle}</c:if>
		<c:if test="${not empty ocolumn.tdid}" >${titlemap[ocolumn.tdid]}</c:if>
				</td>
	</c:forEach>
			</tr>
		</thead>
		
		<tbody>
	<c:forEach items="${listData}" var="onerow" varStatus="status" >
			<tr>
		<c:forEach items="${propertys}" var="ocolumn" varStatus="status" >
				<td style="${ocolumn.formartstr}" align="${ocolumn.talign}" >${onerow[ocolumn.keyname]}</td>
		</c:forEach>
			</tr>
	</c:forEach>
		</tbody>
	</table>
</body>
</html>