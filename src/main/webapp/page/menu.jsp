<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<input type="hidden" name="userid" id="userid" value="${USER_SESSION.id}">
<script>
	//通过用户加载动态菜单加载菜单
	/*
	var userid = $("#userid").val();
	$.ajax({
		url:"${fule}menu/menuGetDataByUserId.json",
		type:"POST",
		dataType:"json",
		data:{"userid":userid},
		success:function(data){
			var strHtml= '<li id="mainpli" ><a href="#">首页</a></li>';
			var sondate = data;
			$.each(data, function(key,value){
				if(value.ismenu==1){
					//是父级菜单
					strHtml+='<li>';
					if(value.url!=undefined&&value.url!=''){
						strHtml+='<a href="${fule}"'+value.url+'">'+value.menuname+'</a>';
					}else{
						strHtml+='<a href="#" class="dropdown-toggle" data-toggle="dropdown">';
						strHtml+=value.menuname+'<b class="caret"></b>';
						strHtml+='</a>';
						strHtml+='<ul class="dropdown-menu">';
						var pid=value.id;
						//遍历子菜单
						$.each(sondate, function(sonkey,sonvalue){
							if(sonvalue.pid==pid){
								strHtml+='<li><a href="${fule}'+sonvalue.url+'">'+sonvalue.menuname+'</a></li>';
							}
						});
						strHtml+='</ul>';
					}
					strHtml+='</li>';
				}
			});
			$("#menuUl").html(strHtml);
		},
		error:function(){
			
		}
	});
	*/
</script>
<iframe style="display: none" id="myajaxfor" name="myajaxfor"></iframe>
<input type="hidden" id="who" value="${who}" />
<input type="hidden" id="fule" value="${fule}" />
<div class="title">
	<div class="userinfo">
		您好：
		<% 
			String subofficename="";
			String username="";
			//获取到服务器中的用户对象 
			/*
			UserEntity userSession=(UserEntity)request.getSession().getAttribute("USER_SESSION");
			//初始值为空
			//判断是否有值 如果有则赋值
		 	if(userSession.getSubofficename()!=null){
		 		subofficename=userSession.getSubofficename();
		 	}
		 	if(userSession.getUsername()!=null){
		 		username=userSession.getUsername();
		 	}
		 	*/
		%>
		<%=subofficename%>
		<%=username %>
		<a href="${fule}logout">退出登录</a>
	</div>
</div>
<nav class="navbar navbar-default navbar-static-top" role="navigation">
	<div class="container-fluid">
		<div>
			<ul class="nav navbar-nav" id="menuUl">
				<li id="mainpli"><a href="http://localhosst:8080/echart/login.json">我的会议</a></li>
				<li id="writeli"><a href="#" >预定会议室</a></li>
				<li id="writeli"><a href="#" >邮件通知日志</a></li>
				<li id="writeli"><a href="#" >区域楼层管理</a></li>
				<li id="writeli"><a href="#" >会议录入</a></li>
				
				<li>
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">系统管理 <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">用户管理</a></li>
						<li><a href="#">会议室管理</a></li>
						<li><a href="#">MCU管理</a></li>
						<li><a href="${fule}menu/meetingList.web">权限管理</a></li>
						<li><a href="#">日志</a></li>
					</ul>
				</li> 
				<li>
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">管理后台 <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">部门管理</a></li>
						<li><a href="#">用户管理</a></li>
						<li><a href="#">权限管理</a></li>
						<li><a href="#">会议统计</a></li>
					</ul>
				</li> 
				
			</ul>
		</div>
	</div>
</nav>

