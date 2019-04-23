<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ page isELIgnored="false"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Carbon - Admin Template</title>
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
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header bg-light">
                    <span class="fa fa-home">>我的历史会议 </span>
                </div>

                <div class="card-body">
                    <div class="table-responsive ">

                        <table class="table ">
                            <thead>
                            <tr>
                                <th class="active">
                                    <input type="checkbox" name="" id="" value="" />
                                </th>
                                <th>主持</th>
                                <th>会议名称</th>
                                <th>会议类型</th>
                                <th>开始时间</th>
                                <!-- <th>结束时间</th>-->
                                <th>时长</th>
                                <th>会议室</th>
                                <th>状态</th>
                                <th>操作</th>

                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="active">
                                    <input type="checkbox" name=""  value="" />
                                </td>
                                <td class="text-nowrap">Samsung Galaxy S8</td>
                                <td>人事会议</td>
                                <td>本地会议</td>
                                <td>2018-12-24 9:30</td>
                                <!--<td>2018-12-24 10:30</td>-->
                                <td>1小时</td>
                                <td>508</td>
                                <td>完结</td>
                                <td class="text-center">
                                    <form class="navbar-form">
                                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#login">参会人员</button>
                                        <a href="#" class="btn btn-default" onclick="return confirm('确认')">继续发起会议</a>
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <td class="active">
                                    <input type="checkbox" name=""  value="" />
                                </td>
                                <td class="text-nowrap">Samsung Galaxy S8</td>
                                <td>财务会议</td>
                                <td>视频会议</td>
                                <td>2018-12-24 9:30</td>
                                <!--<td>2018-12-24 10:30</td>-->
                                <td>1小时</td>
                                <td>508</td>
                                <td>完结</td>
                                <td class="text-center">
                                    <form class="navbar-form">
                                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#login">参会人员</button>
                                        <a href="#" class="btn btn-default" onclick="return confirm('确认')">继续发起会议</a>
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <td class="active">
                                    <input type="checkbox" name=""  value="" />
                                </td>
                                <td class="text-nowrap">Samsung Galaxy S8</td>
                                <td>人事会议</td>
                                <td>语音会议</td>
                                <td>2018-12-24 9:30</td>
                                <!--<td>2018-12-24 10:30</td>-->
                                <td>1小时</td>
                                <td>508</td>
                                <td>完结</td>
                                <td class="text-center">
                                    <form class="navbar-form">
                                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#login">参会人员</button>
                                        <a href="#" class="btn btn-default" onclick="return confirm('确认')">继续发起会议</a>
                                    </form>
                                </td>
                            </tr>

                            </tbody>
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
            <div class="row">
                <div class="col-md-12">
                    <div class="card" >
                        <div class="card-header bg-light">
                            <span class="fa fa-home">>参会人员信息 </span>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive ">

                                <table class="table ">
                                    <thead>
                                    <tr>

                                        <th>姓名</th>
                                        <th>部门</th>
                                        <th>性别</th>
                                        <!--<th>职位</th>-->
                                        <th>联系方式</th>
                                        <th>邮箱</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="text-nowrap">张山</td>
                                        <td>人事部</td>
                                        <td>男</td>
                                        <!--<td>人事部主任</td>-->
                                        <td>13456789087</td>
                                        <td>samsung@xx.com</td>
                                    </tr>
                                    <tr>
                                        <td class="text-nowrap">离斯</td>
                                        <td>人事部</td>
                                        <td>男</td>
                                        <!--<td>人事部主任</td>-->
                                        <td>13456789087</td>
                                        <td>samsung@xx.com</td>
                                    </tr>
                                    <tr>
                                        <td class="text-nowrap">旺吴</td>
                                        <td>人事部</td>
                                        <td>男</td>
                                        <!--<td>人事部主任</td>-->
                                        <td>13456789087</td>
                                        <td>samsung@xx.com</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 添加修改对话框结束 -->



</body>

	
</html>
