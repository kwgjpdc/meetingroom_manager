<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<input type="hidden" id="who" value="<%=request.getAttribute("who") %>" />
<input type="hidden" id="fule" value="<%=fule %>" />
	<div class="title" >
		滇中引水管理局
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
	            <li id="writeli" >
	                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	                	填报管理 <b class="caret"></b>
	                </a>
	                <ul class="dropdown-menu">
	                    <li><a href="<%=fule %>subofficewrite/subofficewriteList.web">分局填报</a></li>
	                    <li><a href="<%=fule %>financing/financingList.web">财务填报</a></li>
	                </ul>
	            </li>
	            <li id="projectli" > 
	                <a href="#" class="dropdown-toggle" data-toggle="dropdown" >
	                	合同管理 <b class="caret"></b>
	                </a>
	                <ul class="dropdown-menu">
	                     <li><a href="<%=fule %>contract/contractList.web">合同签订</a></li>
	                    <li><a href="" >合同执行</a></li>
	                </ul>
	            </li>
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
	            <li><a href="#">绩效管理</a></li>
	            <li><a href="#">账户管理</a></li>
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
	                    <li><a href="<%=fule %>report/monthTotalList.web">合同执行月统计</a></li>
	                    <li><a href="#">建设资金支付统计表</a></li>
	               	 	<li><a href="#">分局数据统计</a></li>
	               	 	<li><a href="#">财务数据统计</a></li>
	               	 	<li><a href="#">工程建设开工进度、投资完成情况月统计</a></li>
	               	 	<li><a href="#">工程投资完成汇总月统计</a></li>
	               	 	<li><a href="#">工程建设资金支付情况月统计</a></li>
	               	 	<li><a href="#">招投标情况统计</a></li>
	                    <li><a href="#">合同签订情况统计</a></li>
	                    <li><a href="#">已签合同执行情况统计</a></li>
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
	

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="myModalLabel">提示消息</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="infobody" >是否保存新增编辑的数据</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" >关闭</button>
        <button type="button" class="btn btn-primary" id="rightBtn" >保存</button>
      </div>
    </div>
  </div>
</div>