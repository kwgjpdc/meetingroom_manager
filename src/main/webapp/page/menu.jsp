<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<input type="hidden" id="who" value="<%=request.getAttribute("who") %>" />
	<div class="title" >
		长江勘测规划设计研究院
		<div class="userinfo" >您好：admin</div>
	</div>
	<nav class="navbar navbar-default navbar-static-top" role="navigation">
	    <div class="container-fluid">
	    <!-- 
	    <div class="navbar-header">
	        <a class="navbar-brand" href="#">系统菜单</a>
	    </div>
	     -->
	    <div>
	        <ul class="nav navbar-nav">
	            <li id="mainpli" ><a href="#">首页</a></li>
	            <li><a href="#">供应商管理</a></li>
	            <li><a href="#">合同管理</a></li>
	            <li id="projectli" > 
	                <a href="#" class="dropdown-toggle" data-toggle="dropdown" >
	                	项目管理 <b class="caret"></b>
	                </a>
	                <ul class="dropdown-menu">
	                    <li><a href="#">进度管理</a></li>
	                    <li><a href="<%=fule %>project/payforList.web" >支付申请</a></li>
	                </ul>
	            </li>
	            <li><a href="#">费用管理</a></li>
	            <li><a href="#">采购管理</a></li>
	            <li><a href="#">物资管理</a></li>
	            <li><a href="#">人事管理</a></li>
	            <li><a href="#">绩效管理</a></li>
	            <li><a href="#">账户管理</a></li>
	            <li><a href="#">银企直联</a></li>
	            <li>
	            	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
	                	财务管理<b class="caret"></b>
	                </a>
	                <ul class="dropdown-menu">
	                    <li><a href="#">头寸管理</a></li>
	                    <li><a href="#">付费管理</a></li>
	                </ul>
	            </li>
	            <li id="reportli" >
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
	                	统计报表<b class="caret"></b>
	                </a>
	                <ul class="dropdown-menu">
	                    <li><a href="<%=fule %>report/monthTotalList.web">合同月度统计表</a></li>
	                    <li><a href="#">建设资金支付统计表</a></li>
	                </ul>
				</li>
	            <li><a href="#">流程管理</a></li>
	            <li>
	                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	                	系统管理 <b class="caret"></b>
	                </a>
	                <ul class="dropdown-menu">
	                    <li><a href="#">用户管理</a></li>
	                    <li><a href="#">部门管理</a></li>
	                    <li><a href="#">菜单管理</a></li>
	                </ul>
	            </li>
	        </ul>
	    </div>
	    </div>
	</nav>