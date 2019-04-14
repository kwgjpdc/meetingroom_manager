<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<input type="hidden" name="userid" id="userid" value="${USER_SESSION.id}">
<script>

</script>
<iframe style="display: none" id="myajaxfor" name="myajaxfor"></iframe>
<input type="hidden" id="who" value="${who}" />
<input type="hidden" id="fule" value="${fule}" />
<div class="title">
	<h3>会议室预订</h3>
	<div class="userinfo">
		您好：
		<% 
			String subofficename="";
			String username="";
			//获取到服务器中的用户对象 

		%>
		<%=subofficename%>
		<%=username %>
		<a href="${fule}logout">退出登录</a>
	</div>
</div>


<div class="modal-dialog" id="show-modal" tabindex="-1"
	style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button onclick="closeloding()" type="button" class="close"
					data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">提示消息</h4>
			</div>
			<div class="modal-body" id="infobody"
				style="text-align: center; font-size: large;">提示消息</div>
			<div class="modal-footer">
				<button id="leftBtn" type="button" class="btn btn-default"
					onclick="closeloding()" data-dismiss="modal">关闭</button>
				<button id="rightBtn2" type="button"
					class="rightBtn btn btn-primary" onclick="saveFun()">确定</button>
				<button id="rightBtn3" sytle="display:none;" type="button"
					class="rightBtn btn btn-primary" onclick="deleteFun()">确定</button>
				<button id="rightBtn4" sytle="display:none;" type="button"
					class="rightBtn btn btn-primary" onclick="submitFun()">确定</button>
			</div>
		</div>
	</div>
</div>