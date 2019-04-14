<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<aside>
	<section>
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu"  >
			<li class="header">菜单</li>
			<li id="admin-index"><a href="index.html"><i class="fa fa-dashboard"></i> <span>首页</span></a></li>

			<!-- 菜单 -->
			<li class="treeview">
				<a href="#">
					<i class="fa fa-folder"></i>
					<span>我的会议</span>
					<span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
				</a>
				<ul class="treeview-menu">

					<li id="admin-login1">
						<a href="#" target="iframe">
							<i class="fa fa-circle-o"></i>会议室预订
						</a>
					</li>
					<li id="admin-login2">
						<a href="#" target="iframe">
							<i class="fa fa-circle-o"></i>我的预订
						</a>
					</li>
					<li id="admin-login3">
						<a href="#" target="iframe">
							<i class="fa fa-circle-o"></i>视频会议
						</a>
					</li>
					<li id="admin-login4">
						<a href="#" target="iframe">
							<i class="fa fa-circle-o"></i>我的历史会议
						</a>
					</li>
				</ul>
			</li>
			<li class="treeview">
				<a href="#">
					<i class="fa fa-folder"></i>
					<span>会议室管理</span>
					<span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
				</a>
				<ul class="treeview-menu">

					<li id="meet_template">
						<a href="brand.html" target="iframe">
							<i class="fa fa-circle-o"></i>会议模板
						</a>
					</li>
					<li id="meet_room">
						<a href="specification.html" target="iframe">
							<i class="fa fa-circle-o"></i>常用会议室
						</a>
					</li>

				</ul>
			</li>

			<li class="treeview">
				<a href="#">
					<i class="fa fa-folder"></i>
					<span>会议统计</span>
					<span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
				</a>
				<ul class="treeview-menu">

					<li id="hystory1">
						<a href="contentCategory.html" target="iframe">
							<i class="fa fa-circle-o"></i>历史会议
						</a>
					</li>
					<li id="hystory2">
						<a href="content.html" target="iframe">
							<i class="fa fa-circle-o"></i>会议报表
						</a>
					</li>
				</ul>
			</li>
			<!-- 会议审批 /-->

			<li class="treeview">
				<a href="#">
					<i class="fa fa-folder"></i>
					<span>会议审批</span>
					<span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
				</a>
				<ul class="treeview-menu">

					<li id="meet_template1">
						<a href="brand.html" target="iframe">
							<i class="fa fa-circle-o"></i>会议审批进度
						</a>
					</li>
					<li id="meet_room2">
						<a href="specification.html" target="iframe">
							<i class="fa fa-circle-o"></i>审批历史
						</a>
					</li>

				</ul>
			</li>
			<%--	系统管理	--%>
			<li class="treeview">
				<a href="#">
					<i class="fa fa-folder"></i>
					<span>系统管理</span>
					<span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
				</a>
				<ul class="treeview-menu">

					<li id="meet_template2">
						<a href="brand.html" target="iframe">
							<i class="fa fa-circle-o"></i>视频会议室管理
						</a>
					</li>
					<li id="meet_room3">
						<a href="specification.html" target="iframe">
							<i class="fa fa-circle-o"></i>MCU管理
						</a>
					</li>
					<li id="meet_room32">
						<a href="specification.html" target="iframe">
							<i class="fa fa-circle-o"></i>资源管理
						</a>
					</li>
					<li id="meet_room31">
						<a href="specification.html" target="iframe">
							<i class="fa fa-circle-o"></i>邮件发送
						</a>
					</li>
				</ul>
			</li>
			<%-- 管理后台--%>
			<li class="treeview">
				<a href="#">
					<i class="fa fa-folder"></i>
					<span>管理后台</span>
					<span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
				</a>
				<ul class="treeview-menu">

					<li id="meet_template23">
						<a href="brand.html" target="iframe">
							<i class="fa fa-circle-o"></i>部门管理
						</a>
					</li>
					<li id="meet_room222">
						<a href="specification.html" target="iframe">
							<i class="fa fa-circle-o"></i>用户管理
						</a>
					</li>
					<li id="meet_room221">
						<a href="specification.html" target="iframe">
							<i class="fa fa-circle-o"></i>权限管理
						</a>
					</li>
					<li id="meet_room223">
						<a href="specification.html" target="iframe">
							<i class="fa fa-circle-o"></i>日志管理
						</a>
					</li>

					<li id="meet_room22">
						<a href="specification.html" target="iframe">
							<i class="fa fa-circle-o"></i>配置管理
						</a>
					</li>

				</ul>
			</li>

		</ul>
	</section>

</aside>




