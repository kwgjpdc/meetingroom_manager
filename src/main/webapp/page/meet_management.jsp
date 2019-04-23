<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
            <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">会议室管理</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">会议室维护</a>
        </div>
        <hr>

        <div class="card-header bg-light">
            <div class="row">

                <div class="col-md-12">
                    <div >
                        <form class="navbar-form navbar-right">
                            <a href="${pageContext.request.contextPath }/page/meet_management/meet_manager_add.jsp" class="btn btn-primary">添加会议室</a>
                        </form>
                    </div>
                    <div >
                        <table class="table table-bordered" id="meetRoomList">
                            <tr class="active">
                                <th class="active">
                                    <input type="checkbox" name="" id="" value="" />
                                </th>
                                <th>名称</th>
                                <th>类型</th>
                                <th>容纳人数</th>
                                <th>地址</th>
                                <th>呼叫地址</th>
                                <th>管理员</th>
                                <th>是否启用</th>
                                <th>操作</th>
                            </tr>
                            <c:forEach items="${meetRoomList}" var="list">
                            <tr class="active">
                                <td class="active">
                                    <input type="checkbox" name=""  value="" id="'${list.roomId}'" />
                                </td>
                                <td><u><a href="#" style="color: #0c87eb">${list.roomName}</a></u></td>
                                <td>${list.roomType}</td>
                                <td>${list.personCount}</td>
                                <td>${list.roomAreaName}</td>
                                <td>${list.callIp}</td>
                                <td>${list.manager}</td>
                                <td><a href="#">启用</a></td>
                                <!--<td>xx</td>-->
                                <td class="text-center">
                                    <form class="navbar-form">
                                        <a href="${pageContext.request.contextPath}/meet/findOne?roomId=${list.roomId}" class="btn btn-default" >修改</a>
                                       <%-- <a href="${pageContext.request.contextPath}/page/meet_management/meet_manager_update.jsp" class="btn btn-default" >修改1</a>--%>
                                        <a href="${pageContext.request.contextPath}/meet/delete?roomId=${list.roomId}" class="btn btn-danger" >删除</a>
                                    </form>
                                </td>
                            </tr>
                            </c:forEach>
                           <%-- <tr class="active">
                                <td class="active">
                                    <input type="checkbox" name=""  value="" />
                                </td>
                                <td><u><a href="#" style="color: #0c87eb">504</a></u></td>
                                <td>本地会议室</td>
                                <td>20</td>
                                <td>武汉分部</td>
                                <!-- <td>-</td>-->
                                <td></td>
                                <td>6-6C3-06</td>
                                <td><a href="#">启用</a></td>
                                <!--<td>xx</td>-->
                                <td class="text-center" >
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
                                <td><u><a href="#" style="color: #0c87eb">408</a></u></td>
                                <td>语音会议室</td>
                                <td>18</td>
                                <td>上海分部</td>
                                <!--<td>H323</td>-->
                                <td>192.168.188.55</td>
                                <td>1M-O6-1M28</td>
                                <td><a href="#">启用</a></td>
                               <!-- <td>xx</td>-->
                                <td class="text-center">
                                    <form class="navbar-form">
                                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#login">修改</button>
                                        <a href="#" class="btn btn-danger" onclick="return confirm('你确认要删除')">删除</a>
                                    </form>
                                </td>
                            </tr>--%>
                        </table>
                    </div>
                    <div>
                        <div class="box-border pull-right">
                            <ul class="pagination">
                                <li><a href="#" aria-label="Previous">首页</a></li>
                                <li><a href="#">上一页</a></li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">下一页</a></li>
                                <li><a href="#" aria-label="Next">尾页</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 添加修改对话框开始 -->
<%--<div id="login" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title text-center">添加会议室:</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>

            </div>
            <div class="modal-body">
                <form class="form-control-file" action="${pageContext.request.contextPath}/meet/add" method="post">
                    <div class="form-group">
                        <label for="roomName" class="control-label col-md-3">会议室名称:</label>
                        <div class="col-md-12">
                            <input type="text"  name="roomName" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="roomArea" class="control-label col-md-3">会议室区域:</label>
                        <div class="col-md-12">
                            <input type="text"  name="roomArea" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="roomFloor" class="control-label col-md-3">会议室楼层:</label>
                        <div class="col-md-12">
                            <input type="text"  name="roomFloor" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="personCount" class="control-label col-md-3">容纳人数:</label>
                        <div class="col-md-12">
                            <input type="text"   name="personCount" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="roomType" class="control-label col-md-3">会议室类型:</label>
                        <div class="col-md-12">
                            <input type="text"  name="roomType"  class="form-control" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="meetingSubdept" class="control-label col-md-3">所属分部：</label>
                        <div class="col-md-12">
                            <input type="text"  name="meetingSubdept" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="manager" class="control-label col-md-3">管理人：</label>
                        <div class="col-md-12">
                            <input type="text"  name="manager" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="callIp" class="control-label col-md-3">呼叫地址：</label>
                        <div class="col-md-12">
                            <input type="text"  name="callIp" class="form-control" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="isStart" class="control-label col-md-3">是否启用：</label>
                        <div class="col-md-12">
                            <input type="text"  name="isStart" class="form-control" />
                        </div>
                    </div>
                   <div class="col-md-offset-2 text-center">
                       <input type="submit" class="btn btn-primary" />
                       <button type="button" class="btn btn-default" >取消</button>
                   </div>
                </form>
            </div>
        </div>
    </div>
</div>--%>

<!-- 添加修改对话框结束 -->

</body>
<script>
    $(document).ready(function(){
        //alert("第一种方法。");
    });

</script>
<%
    if ((String)request.getAttribute("addInfo") == "success") { %>
<script>
    alert("添加成功！");
    window.location.reload();
</script>
<%}%><%
    if ((String)request.getAttribute("deleteInfo") == "success") { %>
<script>
    alert("删除成功！");
    window.location.reload();
</script>
<%}%>

<script>

</script>

</html>
