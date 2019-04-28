<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
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
                                <th class="active" class="text-center">
                                    <input type="checkbox" name="" id="" value="" />
                                </th>
                                <th class="text-center">主持</th>
                                <th class="text-center">会议名称</th>
                                <th class="text-center">会议类型</th>
                                <th class="text-center">开始时间</th>
                                <!-- <th>结束时间</th>-->
                                <th class="text-center">时长</th>
                                <th class="text-center">会议室</th>
                                <th class="text-center">状态</th>
                                <th class="text-center">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${pageInfo.list}" var="list">
                                <tr>
                                    <td class="active text-nowrap">
                                        <input type="checkbox" name=""  value="" />
                                    </td>
                                    <td class="text-center">${list.originator}</td>
                                    <td  class="text-center">${list.meetName}</td>
                                    <td  class="text-center">${list.meetType}</td>
                                    <td  class="text-center">${list.starttime}</td>
                                    <!--<td>2018-12-24 10:30</td>-->
                                    <td  class="text-center">${list.duration}</td>
                                    <td  class="text-center">${list.meetRoom}</td>
                                    <td  class="text-center">完结</td>
                                        <td class="text-center">
                                        <form class="navbar-form">
                                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#login">参会人员</button>
                                            <%--<a href="#" class="btn btn-default" onclick="return confirm('确认')">继续发起会议</a>--%>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <div>
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    总共${pageInfo.pages}页，共${pageInfo.total} 条数据。 每页
                                   10条
                                </div>
                            </div>
                            <div>
                                <ul class="pagination">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/meetroom/meet_history?page=1&size=${pageInfo.pageSize}"
                                           aria-label="Previous">首页</a>
                                        <%-- <a href="${pageContext.request.contextPath}/mail/findPage?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a> --%>
                                    </li>
<c:if test="${pageInfo.pageNum!=1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/meetroom/meet_history?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">&laquo;</a>
                                    </li>
</c:if>
                                    <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/meetroom/meet_history?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a>
                                        </li>
                                    </c:forEach>
                                    <c:if test="${pageInfo.pages!=pageInfo.pageNum}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/meetroom/meet_history?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">&raquo;</a>
                                    </li>
                                    </c:if>

                                    <li>
                                        <a href="${pageContext.request.contextPath}/meetroom/meet_history?page=${pageInfo.pages}&size=${pageInfo.pageSize}"
                                           aria-label="Next">尾页</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 添加修改对话框开始 -->
<div id="login" class="modal fade" style="position:absolute;top: 100px;" >
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
