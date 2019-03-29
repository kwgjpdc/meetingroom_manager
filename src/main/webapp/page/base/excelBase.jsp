<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 页面导出选择数据页面 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.xlsText {
	mso-number-format: \@;
}

.jine {
	vnd .ms-excel.numberformat: #,##0 .00
}

.jingzhi {
	vnd .ms-excel.numberformat: #,##0 .0000
}

.riqi {
	vnd .ms-excel.numberformat: yyyy-mm-dd
}
</style>
<title>${fileName }</title>
</head>
<body>
	<table border="1" id="table1" cellspacing="0" cellpadding="0">
		<thead>
			<tr>
				<%
					String prowindex = "1";
					ArrayList<HashMap<String, Object>> titles = (ArrayList) request.getAttribute("titles");
					HashMap<String, Object> titlemap = (HashMap) request.getAttribute("titlemap");	
					for (int i = 0; i < titles.size(); i++) {
						if (!prowindex.equals(""+titles.get(i).get("rowindex"))) {
				%>
			</tr>
			<tr>
				<%
						}
				%>
				<%
					prowindex= titles.get(i).get("rowindex")+"";
					//request.setAttribute("prowindex", );
				%>
				<td id="<%=titles.get(i).get("tdid")%>"
					rowspan="<%=titles.get(i).get("mrowspan")%>"
					colspan="<%=titles.get(i).get("mcolspan")%>">
				<%
						if (titles.get(i).get("tdid") == null) {
				%> 
				<%=titles.get(i).get("showtitle")%>
				<%
 						} else {
 				%> 
 
 					<%=titlemap.get(titles.get(i).get("tdid"))%> 
 
 
 				<%
 						}
 				%> 			
 				</td>
 				<%
 					}
 				%>
				
			</tr>
		</thead>
		<tbody>
				<%
				ArrayList<HashMap<String, Object>> listData = (ArrayList) request.getAttribute("listData");
				ArrayList<HashMap<String, Object>> propertys = (ArrayList) request.getAttribute("propertys");
				String[] onerow = (String[]) request.getAttribute("onerow");
				for (int i = 0; i < listData.size(); i++) {
				%>
			<tr>
				<%
					for (int a = 0; a < propertys.size(); a++) {
				%>
				<td style="<%=propertys.get(a).get("formartstr")%>"
					align="<%=propertys.get(a).get("talign")%>"><%=listData.get(i).get(propertys.get(a).get("keyname"))%>
				</td>
				<%
					}
				%>
			</tr>
				<%
					}
				%>
		</tbody>
	</table>
</body>
</html>