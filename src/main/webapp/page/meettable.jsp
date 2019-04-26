<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ page isELIgnored="false"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
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
                    <span class="fa fa-home">>我的预定会议 </span>
                </div>

                <div class="card-body">
                    <div class="table-responsive ">

                        <table class="table ">
                            <thead>
                            <tr>
                                <th class="active">
                                    <input type="checkbox" name="" id="" value=""/>
                                </th>
                                <th>会议名称</th>
                                <th>会议类型</th>
                                <th>开始时间</th>
                                <th>会议室</th>
                                <th>距离开会时间:</th>
                                <!-- <th>操作</th>-->

                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="active">
                                    <input type="checkbox" name="" value=""/>
                                </td>
                                <td>
                                    <a href="#" class="btn btn-default" data-toggle="modal" data-target="#login" style="color: #0c87eb">人事会议</a>
                                </td>
                                <td>视频会议</td>
                                <td >2019-4-18 9:30</td>
                                <td>508</td>
                                <td style="color: red" ><span id="timer"> </span></td>
                            </tr>
                            <c:forEach items="${meets}" var="list">
                                <tr>
                                    <td class="active">
                                        <input type="checkbox" name="" value=""/>
                                    </td>
                                    <td>
                                        <a href="#" class="btn btn-default" data-toggle="modal" data-target="#login" style="color: #0c87eb">${list.meetName}</a>
                                    </td>
                                    <td>${list.meetType}</td>
                                    <td >2019-4-18 9:30</td>
                                    <td>${list.meetRoomName}</td>
                                    <td style="color: red" ><span > </span></td>
                                </tr>


                            </c:forEach>
                            <tr>
                                <td class="active">
                                    <input type="checkbox" name="" value=""/>
                                </td>
                                <td>
                                    <a href="#" class="btn btn-default" data-toggle="modal" data-target="#login" style="color: #0c87eb">人事会议</a>
                                </td>
                                <td>视频会议</td>
                                <td >2019-4-18 9:30</td>
                                <td>508</td>
                                <td style="color: red" ><span id="timer1"> </span></td>
                            </tr>
                            <tr>
                                <td class="active">
                                    <input type="checkbox" name="" value=""/>
                                </td>
                                <td>
                                    <a href="#" class="btn btn-default" data-toggle="modal" data-target="#login" style="color: #0c87eb">人事会议</a>
                                </td>
                                <td>视频会议</td>
                                <td >2019-4-18 9:30</td>
                                <td>508</td>
                                <td style="color: red" ><span id="timer2"> </span></td>
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
<div id="login" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">


            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-light">
                            <span class="fa fa-home">>参会人员信息 </span>
                        </div>

                        <div class="card-body">
                            <div class="table-responsive ">

                                <table class="table ">
                                    <thead>
                                    <tr>
                                        <th class="active">
                                            <input type="checkbox" name="" id="check1" value=""/>
                                        </th>
                                        <th>姓名</th>
                                        <th>部门</th>
                                        <th>性别</th>

                                        <th>联系方式</th>
                                        <th>邮箱</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="active">
                                            <input type="checkbox" name="" value=""/>
                                        </td>
                                        <td class="text-nowrap">张山</td>
                                        <td>人事部</td>
                                        <td>男</td>

                                        <td>13456789087</td>
                                        <td>samsung@xx.com</td>
                                    </tr>
                                    <tr>
                                        <td class="active">
                                            <input type="checkbox" name="" value=""/>
                                        </td>
                                        <td class="text-nowrap">离司</td>
                                        <td>人事部</td>
                                        <td>男</td>

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

<script type="text/javascript">
    var time_now_server,time_now_client,time_end,time_server_client;

    time_end=new Date("2019/04/21 12:11:55").getTime();//结束的时间

    time_now_server=new Date().getTime();//开始的时间

    setTimeout("show_time()",1000);
    // setTimeout("show_time('timer1')",1000);
    // setTimeout("show_time('timer2')",1000);

    function show_time() {
        var timer = document.getElementById("timer");
        var hourid = document.getElementById("hour");
        if(!timer){
            return ;
        }
        timer.innerHTML =time_now_server;

        var time_now,time_distance,str_time;
        var int_day,int_hour,int_minute,int_second;
        var time_now=new Date().getTime();
        time_distance=time_end-time_now;
        if(time_distance>0) {
            int_day=Math.floor(time_distance/86400000);
            time_distance-=int_day*86400000;
            int_hour=Math.floor(time_distance/3600000);
            time_distance-=int_hour*3600000;
            int_minute=Math.floor(time_distance/60000);
            time_distance-=int_minute*60000;
            int_second=Math.floor(time_distance/1000);

            if(int_hour < 10)
            int_hour="0"+int_hour;
            if(int_minute<10)
                int_minute="0"+int_minute;
            if(int_second<10)
                int_second="0"+int_second;

            var str_time="";
            if (int_day>0)
                str_time+=int_day+"天  ";
            if (int_hour>=0)
                str_time+=int_hour+":";
            if (int_minute>=0)
                str_time+=int_minute+":";
            if (int_second>=0)
                str_time+=int_second;
            //str_time=int_day+"天  "+int_hour+":"+int_minute+":"+int_second;
            timer.innerHTML=str_time;
            setTimeout("show_time()",1000);
        } else {
            timer.innerHTML ="会议已开始";
            var result = window.confirm('是否开始会议?');
            if (result){
                alert("会议开始!");
            }
        }
    }
</script>
</html>
