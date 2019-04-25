<%@ page language="java" contentType="text/html; charset=UTF-8"

pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%@ page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>会议管理系统</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath }/vendor/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/vendor/font-awesome/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/styles.css">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">--%>
    <script src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/popper.js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/chart.js/chart.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/carbon.js"></script>
    <script src="${pageContext.request.contextPath }/js/demo.js"></script>


</head>
<body class="sidebar-fixed header-fixed">
<div class="content">
    <div class="container-fluid">
        <div class="card-header bg-light">
            <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">管理后台</a><span>&nbsp&nbsp >&nbsp&nbsp
        </span><a href="#">用户管理</a>
        </div>
        <hr>

        <div class="card-header bg-light">
            <div class="row">

                <div class="col-md-12">
                    <div >
                        <form class="right">
                            <a class="btn btn-danger"
                               href="${pageContext.request.contextPath }/page/meet_manager/meet_manager_dept_add.jsp">
                                添加部门</a>
                        </form>
                    </div>
                    <div >


                        <table class="table table-bordered">
                            <tr class="active">
                                <th class="active">
                                    <input type="checkbox" name="" id="" value="" />
                                </th>
                                <th class="text-center">用户名称</th>
                                <th class="text-center">用户性别</th>
                                <th class="text-center">用户职位</th>
                                <th class="text-center">用户邮箱</th>
                                <th class="text-center">用户电话</th>
                                <!-- <th>呼叫方式</th>-->
                                <th class="text-center">用户所属分部</th>


                                <!--<th>管理者</th>-->
                                <th class="text-center">操作</th>
                            </tr>
                            <c:forEach items="${meetuserlist}" var="list">
                                <tr class="active">
                                    <td class="active">
                                        <input type="checkbox" name=""  value="" />
                                    </td>
                                    <td class="text-center">${list.username}</td>
                                    <td class="text-center">${list.sex}</td>
                                    <td class="text-center">${list.rolename}</td>
                                    <td class="text-center">${list.email}</td>
                                    <td class="text-center">${list.tel}</td>
                                    <td class="text-center">${list.suboffice}</td>

                                    <!--<td>xx</td>-->
                                    <td class="text-center">
                                        <form class="navbar-form">
                                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#login">修改</button>
                                            <a href="#" class="btn btn-danger" onclick="return confirm('你确认要删除')">删除</a>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 添加修改对话框开始 -->
<div id="login" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title text-center">添加用户:</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>

            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="${pageContext.request.contextPath}/user/add">
                    <div class="form-group">
                        <label for="roomName" class="control-label col-md-3">用户名称:</label>
                        <div class="col-md-12">
                            <input type="text" id="roomName" name="username" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="roomArea" class="control-label col-md-3">用户性别:</label>
                        <div class="col-md-12">
                            <input type="text" id="roomArea" name="sex" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">用户职位:</label>
                        <div class="col-md-12">
                            <select   name="rolename"  onchange="okIS(this.options[selectedIndex].value)" >
                                <option value="1">超级管理员</option>
                                <option value="2">审批用户</option>
                                <option value="10" >普通用户</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="personCount" class="control-label col-md-3">用户邮箱:</label>
                        <div class="col-md-12">
                            <input type="text"  id="personCount" name="email" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="personCount" class="control-label col-md-3">用户电话:</label>
                        <div class="col-md-12">
                            <input type="text"  id="personCoun" name="tel" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="roomType" class="control-label col-md-3">用户所属分部:</label>
                        <div class="col-md-12">
                            <input type="text" id="roomType" name="suboffice" class="form-control" />
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-md-offset-2 text-center">
                            <input type="submit" class="btn btn-default"></input>
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 添加修改对话框结束 -->



</body>


</html>
