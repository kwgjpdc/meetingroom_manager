<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ page isELIgnored="false"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>会议管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/vendor/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/vendor/font-awesome/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/styles.css">
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
            <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">系统管理</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href=#"">MCU管理</a>
        </div>
        <hr>

        <div class="card-header bg-light">
            <div class="row">

                <div class="col-md-12">
                    <div >
                        <form class="navbar-form navbar-right">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#login">添加MCU</button>
                        </form>
                    </div>
                    <div >
                        <table class="table table-bordered">
                            <tr class="active">
                                <th class="active">
                                    <input type="checkbox" name="" id="" value="" />
                                </th>
                                <th>设备名称</th>
                                <th>型号</th>
                                <th>服务器主机名/IP地址</th>
                                <th>登录账号</th>
                                <th>会议号</th>
                                <th>是否启用</th>
                                <th>操作</th>
                            </tr>
                            <tr class="active">
                                <td class="active">
                                    <input type="checkbox" name=""  value="" />
                                </td>
                                <td><a href="#">mytest</a></td>
                                <td>CISCO_CMS</td>
                                <td>192.168.188.141</td>
                                <td>admin</td>
                                <td>66666</td>
                                <td><a href="#">启用</a></td>
                                <td class="text-center">
                                    <form class="navbar-form">
                                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#login">修改</button>
                                        <a href="#" class="btn btn-danger" onclick="return confirm('你确认要删除')">删除</a>
                                    </form>
                                </td>
                            </tr>
                            <tr class="active">
                                <td class="active">
                                    <input type="checkbox" name=""  value="" />
                                </td>
                                <td><a href="#">mytest</a></td>
                                <td>CISCO_CMS</td>
                                <td>192.168.188.141</td>
                                <td>admin</td>
                                <td>66666</td>
                                <td><a href="#">启用</a></td>
                                <td class="text-center">
                                    <form class="navbar-form">
                                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#login">修改</button>
                                        <a href="#" class="btn btn-danger" onclick="return confirm('你确认要删除')">删除</a>
                                    </form>
                                </td>
                            </tr>
                            <tr class="active">
                                <td class="active">
                                    <input type="checkbox" name=""  value="" />
                                </td>
                                <td><a href="#">mytest</a></td>
                                <td>CISCO_CMS</td>
                                <td>192.168.188.141</td>
                                <td>admin</td>
                                <td>66666</td>
                                <td><a href="#">启用</a></td>
                                <td class="text-center">
                                    <form class="navbar-form">
                                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#login">修改</button>
                                        <a href="#" class="btn btn-danger" onclick="return confirm('你确认要删除')">删除</a>
                                    </form>
                                </td>
                            </tr>
                            <tr class="active">
                                <td class="active">
                                    <input type="checkbox" name=""  value="" />
                                </td>
                                <td><a href="#">mytest</a></td>
                                <td>CISCO_CMS</td>
                                <td>192.168.188.141</td>
                                <td>admin</td>
                                <td>66666</td>
                                <td><a href="#">启用</a></td>
                                <td class="text-center">
                                    <form class="navbar-form">
                                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#login">修改</button>
                                        <a href="#" class="btn btn-danger" onclick="return confirm('你确认要删除')">删除</a>
                                    </form>
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 添加修改对话框开始 -->
<div id="login" class="modal fade" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <!--<h4 class="modal-title text-center">会议室名称:</h4>-->
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="username" class="control-label col-md-12">设备名称:</label>
                        <div class="col-md-12">
                            <input type="text" id="username1" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="username" class="control-label col-md-12">型号:</label>
                        <div class="col-md-12">
                            <input type="text" id="username" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password1" class="control-label col-md-12">服务器主机名/IP地址：</label>
                        <div class="col-md-12">
                            <input type="password" id="password1" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password2" class="control-label col-md-12">登录账号：</label>
                        <div class="col-md-12">
                            <input type="password" id="password2" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password3" class="control-label col-md-12">会议号：</label>
                        <div class="col-md-12">
                            <input type="password" id="password3" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 text-center">
                            <button type="button" class="btn btn-default" data-dismiss="modal">确认</button>
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
