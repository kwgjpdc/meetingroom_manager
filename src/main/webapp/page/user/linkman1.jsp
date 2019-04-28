<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>会议管理系统</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/vendor/simple-line-icons/css/simple-line-icons.css">
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
    <div class="container-fluid">

        <div class="card-header bg-light">
            <a href="#"><span class="glyphicon glyphicon-refresh">刷新</span></a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">通讯录</a>
        </div>
        <hr>

        <div class="card-header bg-light">
            <div class="row">
                <div class="col-md-2">
                    <div style="width: 120px">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item" style="width: 150px">

                                <a class="btn btn-primary" data-toggle="tab" href="#Internal"  onclick="internal()" role="tab" aria-controls="Internal">内部联系人</a>
                            </li>

                           <%-- <li class="nav-item" style="width: 150px;margin-top: 10px">
                                <a class="btn btn-primary" data-toggle="tab" href="#external" &lt;%&ndash;onclick="external()"&ndash;%&gt;  id="external" role="tab" aria-controls="external">外部联系人</a>
                            </li>--%>
                        </ul>
                    </div>
                </div>
                <script>
                    function internal() {
                       /* $.ajax({
                            url:"findInternal",
                            type:"GET",
                            data:"page=1&size=5&isExternal=0",
                            //data:{"page":1,"size":5,"isExternal":0},//请求参数
                            success:function (data) {
                                alert(data.list);//回调函数
                            },
                            error:function () {
                                alert("出错了!!")//出现错误回调函数
                            },
                            dataType:"document"   //设置接收响应数据的格式
                        });*/
                       $.get("user/findInternal",{page:1,size:5,isExternal:0},function (data) {
                           var person = data.list;
                           for(var key in person){
                               alert(key +":" +person[key]);
                           }
                       },"json");

                    }
                    function external() {

                    }
                    $(function () {
                        init();
                        function init() {
                            $.get("user/internal",{page:1,size:5,isExternal:0});
                        }
                    });
                </script>

                <div class="tab-content col-md-10">
                    <%--内部联系人--%>
                    <div class="tab-pane active" id="Internal" role="tabpanel">
                        <div class="col-md-12 mb-4">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#home1" role="tab" aria-controls="home1">联系人列表</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#profile1" role="tab" aria-controls="profile1">添加内部联系人</a>
                                </li>
                            </ul>


                            <%--<div style="float: right;margin: 5px;">--%>

                                <%--<a class="btn btn-primary" href="${pageContext.request.contextPath}/add.jsp">添加联系人</a>--%>
                                <%--<a class="btn btn-primary" href="javascript:void(0);" id="delSelected">删除选中</a>--%>

                            <%--</div>--%>
                            <%--联系人列表--%>
                            <div class="tab-content">
                                <div class="tab-pane active" id="home1" role="tabpanel">
                                   <form id="form" action="${pageContext.request.contextPath}/user/deleteInternals" method="post">
                                       <table class="table table-bordered" >
                                           <tr >
                                               <th class="col-md-1 active text-center" style="width: 30px">
                                                   <input type="checkbox"  id="firstCb" />
                                               </th>
                                               <th class="col-md-2 text-center">姓名</th>
                                               <th class="col-md-2 text-center">部门</th>
                                               <th class="col-md-2 text-center">电话</th>
                                               <th class="col-md-2 text-center">E-mail</th>
                                               <th class="col-md-2 text-center">操作</th>
                                           </tr>
                                           <%-- <c:forEach items="${Internal.list}" var="list">
                                                <tr>
                                                    <td class="col-md-2 text-center" id="name">${list.name}</td>
                                                    <td class="col-md-2 text-center" id="depaname">${list.deptname}</td>
                                                    <td class="col-md-2 text-center" id="tel">${list.tel}</td>
                                                    <td class="col-md-2 text-center" id="email">${list.email}</td>
                                                    <td><a href="javascript:void(0);">
                                                        <span class="glyphicon glyphicon-search text-left">查看</span></a>
                                                        <a href="javascript:void(0);" userId="#" class="text-right">
                                                            <span class="btn btn-danger">删除</span> </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>--%>
                                           <c:forEach items="${Internal}" var="list">
                                               <tr>
                                                   <td class="col-md-1 active text-center">
                                                       <input type="checkbox" name="uid" id="'${list.id}'" value=""/>
                                                   </td>
                                                   <td class="col-md-2 text-center">${list.name}</td>
                                                   <td class="col-md-2 text-center">${list.dept}</td>
                                                   <td class="col-md-2 text-center">${list.tel}</td>
                                                   <td class="col-md-2 text-center">${list.email}</td>
                                                   <td><a href="javascript:void(0);">
                                                       <span class="glyphicon glyphicon-search text-left">修改</span></a>
                                                       <a href="javascript:deleteLinkman(${list.id});"  class="text-right">
                                                           <span class="btn btn-danger">删除</span> </a>
                                                   </td>
                                               </tr>
                                           </c:forEach>
                                       </table>
                                   </form>
                                </div>
                                <script>
                                    function deleteLinkman(id) {
                                       // alert(id);
                                        //用户安全提示
                                        if (confirm("您确定要删除吗？")) {
                                            //访问路径
                                            location.href = "${pageContext.request.contextPath}/user/deleteInternal?id=" + id;
                                        }
                                    }
                                    window.onload = function(){
                                        //给删除选中按钮添加单击事件

                                        document.getElementById("delSelected").onclick = function(){
                                            if(confirm("您确定要删除选中条目吗？")){

                                                var flag = false;
                                                //判断是否有选中条目
                                                var cbs = document.getElementsByName("uid");
                                                for (var i = 0; i < cbs.length; i++) {
                                                    if(cbs[i].checked){
                                                        //有一个条目选中了
                                                        flag = true;
                                                        break;
                                                    }
                                                }
                                                if(flag){//有条目被选中
                                                    //表单提交
                                                    document.getElementById("form").submit();
                                                }
                                            }
                                        };
                                        //1.获取第一个cb
                                        document.getElementById("firstCb").onclick = function(){
                                            //2.获取下边列表中所有的cb
                                            var cbs = document.getElementsByName("uid");
                                            //3.遍历
                                            for (var i = 0; i < cbs.length; i++) {
                                                //4.设置这些cbs[i]的checked状态 = firstCb.checked
                                                cbs[i].checked = this.checked;
                                            }
                                        };

                                    }
                                </script>
                            <%--添加联系人--%>
                                <div class="tab-pane" id="profile1" role="tabpanel">
                                    <table class="table  table-light">
                                        <form class="form-control-file" action="${pageContext.request.contextPath}/user/addInternal" method="post">
                                            <div class="row form-group">
                                                <span class="col-sm-1 control-label"></span>
                                                <label for="name" class="col-sm-2 control-label">姓 名:</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="name" name="name" placeholder="">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <span class="col-sm-1 control-label"></span>
                                                <label for="tel" class="col-sm-2 control-label">电话:</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="tel" name="tel" placeholder="">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <span class="col-sm-1 control-label"></span>
                                                <label for="email" class="col-sm-2 control-label">邮 箱:</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="email" name="email" placeholder="">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <span class="col-sm-1 control-label"></span>
                                                <label for="dept" class="col-sm-2 control-label">部 门:</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="dept" name="dept" placeholder="">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <span class="col-sm-1 control-label"></span>
                                                <label for="sex" class="col-sm-2 control-label">性 别:</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="sex" name="sex" placeholder="">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <span class="col-sm-1 control-label"></span>
                                                <label for="company" class="col-sm-2 control-label">公 司:</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="company" name="company" placeholder="">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <span class="col-sm-1 control-label"></span>
                                                <label for="internal" class="col-sm-2 control-label">内/外联系人:</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="internal" name="internal" placeholder="">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <span class="col-sm-1 control-label"></span>
                                                <label for="status" class="col-sm-2 control-label">状态:</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="status" name="status" placeholder="">
                                                </div>
                                            </div>

                                            <div class="row form-group">
                                                <div class="col-sm-offset-2 col-sm-10 text-center">
                                                    <button type="submit" class="btn btn-primary">确定</button>
                                                    <button type="button" class="btn btn-default" onclick="history.back(-1);">取消</button>
                                                </div>
                                            </div>
                                        </form>
                                    </table>
                                </div>

                            </div>
                        </div>
                    </div>

                    <%--外部联系人--%>
                   <%-- <div class="tab-pane" id="external" role="tabpanel">
                        <div class="col-md-12 mb-4">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#home2" role="tab" aria-controls="home2">联系人列表</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#profile2" role="tab" aria-controls="profile2">添加外部联系人</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="home2" role="tabpanel">
                                    <table class="table table-bordered" >
                                        <tr >
                                            <th class="col-md-2 text-center">姓名</th>
                                            <th class="col-md-2 text-center">公司</th>
                                            <th class="col-md-2 text-center">Tel</th>
                                            <th class="col-md-2 text-center">E-mail</th>
                                            <th class="col-md-2 text-center">操作</th>
                                        </tr>
                                        <c:forEach items="${external.list}" var="list">
                                            <tr>
                                                <td class="col-md-2 text-center">${list.name}</td>
                                                <td class="col-md-2 text-center">${list.suboffice}</td>
                                                <td class="col-md-2 text-center">${list.tel}</td>
                                                <td class="col-md-2 text-center">${list.email}</td>
                                                <td><a href="javascript:void(0);">
                                                    <span class="glyphicon glyphicon-search text-left">查看</span></a>
                                                    <a href="javascript:void(0);" userId="#" class="text-right">
                                                        <span class="btn btn-danger">删除</span> </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>

                                <div class="tab-pane" id="profile2" role="tabpanel">
                                    <table class="table  table-light">
                                    <form class="form-control-file" action="${pageContext.request.contextPath}/" method="post">
                                        <div class="row form-group">
                                            <span class="col-sm-1 control-label"></span>
                                            <label for="name" class="col-sm-2 control-label">姓 名:</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="name" name="roomName" placeholder="">
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <span class="col-sm-1 control-label"></span>
                                            <label for="dept" class="col-sm-2 control-label">单 位:</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="dept" name="roomName" placeholder="">
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <span class="col-sm-1 control-label"></span>
                                            <label for="email" class="col-sm-2 control-label">邮 箱:</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="email" name="roomName" placeholder="">
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <span class="col-sm-1 control-label"></span>
                                            <label for="tel" class="col-sm-2 control-label">电话:</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="tel" name="roomName" placeholder="">
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col-sm-offset-2 col-sm-10 text-center">
                                                <button type="submit" class="btn btn-primary">确定</button>
                                                <button type="button" class="btn btn-default" onclick="history.back(-1);">取消</button>
                                            </div>
                                        </div>
                                    </form>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>
