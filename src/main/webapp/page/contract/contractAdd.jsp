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
<script type="text/javascript" src="<%=contextPath%>/js/contractAdd.js?ts=<%=request.getAttribute("ts") %>"></script>

</head>
<body class="bgdiv" style="height:100%;background-image:url('/echart/image/loginbk1.jpg');" >
	<div id="head" >
		<%@include file="../menu.jsp" %>
	</div>
	<div id="content" class="content" >
		<div class="panel-body" style="padding-bottom:0px;">
        <div class="panel panel-default">
            <div class="panel-heading">
            	合同管理 / 合同添加
            </div>
            <div class="panel-body">
                	<div class="form-group">
						<label for="suboffice">所属分局</label>
						<select class="form-control" id="suboffice" name="suboffice" style="width: 200px;">
							<option>5</option>
						</select>
					</div>
					<div class="form-group">
						<label for="contractName">合同名称</label>
						<input type="text" class="form-control" id="contractName" style="width: 400px;" placeholder="请输入合同名称">
					</div>
					<div class="form-group">
						<label for="contractNum">合同编号</label>
						<input type="text" class="form-control" id="contractNum" style="width: 400px;" placeholder="请输入合同编号">
					</div>
					<div class="form-group">
						<label for="amount">合同金额(万元)</label>
						<input type="text" class="form-control" id="amount" style="width: 200px;" placeholder="请输入合同金额">
					</div>
					<div class="form-group">
						<label for="durationTime">合同工期</label>
						<input type="text" class="form-control" id="durationTime" style="width: 200px;" placeholder="请输入合同工期">
					</div>
					<div class="form-group">
						<label for="signTime">合同签订日期</label>
						<div class='input-group date' id='signTime' style="width: 200px;">
			                <input type='text' class="form-control" name="signTimeStr" id="signTimeStr"/>
			                <span class="input-group-addon">
			                    <span class="glyphicon glyphicon-calendar"></span>
			                </span>
			            </div>
<!-- 						<input type="text" class="form-control" id="signTime" style="width: 200px;" placeholder="请输入合同签订日期"> -->
					</div>
					<div class="form-group">
						<label for="contractPartyB">合同乙方</label>
						<input type="text" class="form-control" id="contractPartyB" style="width: 200px;" placeholder="请输入合同乙方">
					</div>
					<div class="form-group">
						<label for="remark">备注</label>
						<input type="text" class="form-control" id="remark" style="width: 200px;" placeholder="请输入备注">
					</div>
					<button onclick="save()" class="btn btn-primary">提交</button>
            </div>
        </div>       
		</div>
	</div>
</body>

</html>