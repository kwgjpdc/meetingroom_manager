<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

<title>Insert title here</title>
 <link rel="stylesheet" href="" />
    <link rel="stylesheet" href="./vendor/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="./vendor/font-awesome/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="./css/styles.css">
</head>
<body class="sidebar-fixed header-fixed">
<div class="page-wrapper">
    <nav class="navbar page-header">
        <a href="#" class="btn btn-link sidebar-mobile-toggle d-md-none mr-auto">
            <i class="fa fa-bars"></i>
        </a>

        <a class="navbar-brand" href="#">
            <img src="./imgs/logo1.png" alt="logo">
        </a>

        <a href="#" class="btn btn-link sidebar-toggle d-md-down-none">
            <i class="fa fa-bars"></i>
        </a>

        <ul class="navbar-nav ml-auto">
            <li class="nav-item d-md-down-none">
                <a href="#">
                    <i class="fa fa-bell"></i>
                    <span class="badge badge-pill badge-danger">4</span>
                </a>
            </li>

            <li class="nav-item d-md-down-none">
                <a href="#">
                    <i class="fa fa-envelope-open"></i>
                    <span class="badge badge-pill badge-danger">5</span>
                </a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img src="./imgs/avatar-1.png" class="avatar avatar-sm" alt="logo">
                    <span class="small ml-1 d-md-down-none">John Smith</span>
                </a>

                <div class="dropdown-menu dropdown-menu-right">
                    <div class="dropdown-header">Account</div>

                    <a href="#" class="dropdown-item">
                        <i class="fa fa-user"></i> 个人信息	
                    </a>

                    <a href="#" class="dropdown-item">
                        <i class="fa fa-envelope"></i> 信息
                    </a>

                    <div class="dropdown-header">Settings</div>

                    <a href="#" class="dropdown-item">
                        <i class="fa fa-bell"></i> Notifications
                    </a>

                    <a href="#" class="dropdown-item">
                        <i class="fa fa-wrench"></i> 设置
                    </a>

                    <a href="#" class="dropdown-item">
                        <i class="fa fa-lock"></i> 退出
                    </a>
                </div>
            </li>
        </ul>
    </nav>

    <div class="main-container">
        <div class="sidebar">
            <nav class="sidebar-nav">
                <ul class="nav">
                    <li class="nav-title"><h5>Umeeting</h5></li>

                    <li class="nav-item">
                        <a href="#" class="nav-link active">
                            <i class="icon icon-speedometer"></i> 我的会议
                        </a>
                    </li>
					<li class="nav-item nav-dropdown">
                        <a href="#" class="nav-link">
                            <i class="icon icon-target"></i> 会议室管理
                            
                            
                        </a>
                        
                    </li>


                    

                    <li class="nav-item nav-dropdown">
                        <a href="#" class="nav-link ">
                           
                           
                           <i class="icon icon-energy"></i> 预定会议室</i>
                        </a>
                        
                        

                        <ul class="nav-dropdown-items">
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="icon icon-energy"></i> Alerts
                                </a>
                            </li>

                            

                           
                        </ul>
                    </li>

                    <li class="nav-item nav-dropdown">
                        <a href="#" class="nav-link nav-dropdown-toggle">
                            <i class="icon icon-graph"></i> 会议统计 <i class="fa fa-caret-left"></i>
                        </a>

                        <ul class="nav-dropdown-items">
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="icon icon-graph"></i> 会议报表
                                </a>
                            </li>
                                <li class="nav-item">
                                
                                <a href="#" class="nav-link">
                                    <i class="icon icon-graph"></i> 历史报表
                                </a>
                            </li>
                        </ul>
                    </li>

                  
                    
                    <li class="nav-item nav-dropdown">
                        <a href="#" class="nav-link nav-dropdown-toggle">
                            <i class="icon icon-puzzle"></i> 系统管理<i class="fa fa-caret-left"></i>
                        </a>

                        <ul class="nav-dropdown-items">
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="icon icon-puzzle"></i> 用户管理
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="icon icon-puzzle"></i> 会议室管理
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="icon icon-puzzle"></i> MCU管理
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="icon icon-puzzle"></i> 权限管理
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="icon icon-puzzle"></i> 日志
                                </a>
                            </li>
                        </ul>
                    </li>

                   

                    

                    <li class="nav-item nav-dropdown">
                        <a href="#" class="nav-link nav-dropdown-toggle">
                            <i class="icon icon-umbrella"></i> 管理后台 <i class="fa fa-caret-left"></i>
                        </a>

                        <ul class="nav-dropdown-items">
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="icon icon-umbrella"></i> 部门管理
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="icon icon-umbrella"></i> 用户管理
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="icon icon-umbrella"></i> 权限管理
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="icon icon-umbrella"></i> 会议统计
                                </a>
                            </li>

                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
      
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                	<div class="col-md-12 text-center">
                		
                		<button class="btn btn-primary btn-lg"><span class="fa fa-list"></span>日程</button>
                		<button class="btn btn-success btn-lg"><span class="fa fa-arrow-circle-down"></span>资源</button>
                		<br /><br /><br />
                		
					
                	</div>
                	
                	<div class="col-md-6">
                	<button class="btn btn-info btn-block active" id="locameet">
						<h2>本地会议室</h2>
					</button>
					</div>
					<div class="col-md-6 ">
                	<button class="btn btn-info btn-block" id="videomeet">
						<h2>视屏会议室</h2>
					</button>
					
					</div>
                	<div  class="col-md-12 container-fluid" id="locameets">
                		<div class="row">
                    <div class="col-md-2" >
                    	
                        <div class="card p-4" style="background-color: skyblue;">
                            <div class="card-body d-flex justify-content-between align-items-center">
                                <div>
                                    <span class="h4 d-block font-weight-normal mb-2" >B栋1803</span>
                                </div>
									
                                <div class="h2 text-muted">
                                
                                    <i class="fa fa-users">
                                    	
                                    </i>
                                    
                                </div>
                            </div>
                            
                        </div>
                        
                    </div>
                    
                    <div class="col-md-2">
                        <div class="card p-4" style="background-color: skyblue;">
                            <div class="card-body d-flex justify-content-between align-items-center">
                                <div>
                                    <span class="h4 d-block font-weight-normal mb-2">B栋1803</span>
                                </div>
									
                                <div class="h2 text-muted">
                                
                                    <i class="fa fa-users">
                                    	
                                    </i>
                                    
                                </div>
                            </div>
                            
                        </div>
                        
                    </div>
                    <div class="col-md-2">
                        <div class="card p-4 well"  style="background-color: skyblue;">
                            <div class="card-body d-flex justify-content-between align-items-center">
                                <div>
                                    <span class="h4 d-block font-weight-normal mb-2">B栋1811</span>
                                    <span class="h4 d-block font-weight-normal mb-2"></span>
                                    <span class="h4 d-block font-weight-normal mb-2"> </span>
                                </div>
                                <div class="h2 text-muted">
                                    <i class="fa fa-users"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card p-4" style="background-color: skyblue;">
                            <div class="card-body d-flex justify-content-between align-items-center">
                                <div>
                                    <span class="h4 d-block font-weight-normal mb-2">B栋1801</span>
                                    <span class="h4 d-block font-weight-normal mb-2"> </span>
                                    <span class="h4 d-block font-weight-normal mb-2"> </span>
                                </div>
                                <div class="h2 text-muted">
                                    <i class="fa fa-users"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card p-4" style="background-color: skyblue;">
                            <div class="card-body d-flex justify-content-between align-items-center">
                                <div>
                                    <span class="h4 d-block font-weight-normal mb-2">B栋1801</span>
                                    <span class="h4 d-block font-weight-normal mb-2"> </span>
                                    <span class="h4 d-block font-weight-normal mb-2"> </span>
                                </div>
                                <div class="h2 text-muted">
                                    <i class="fa fa-users"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                   <div class="col-md-2">
                        <div class="card p-4" style="background-color: skyblue;">
                            <div class="card-body d-flex justify-content-between align-items-center">
                                <div>
                                    <span class="h4 d-block font-weight-normal mb-2">B栋1801</span>
                                    <span class="h4 d-block font-weight-normal mb-2"> </span>
                                    <span class="h4 d-block font-weight-normal mb-2"> </span>
                                </div>
                                <div class="h2 text-muted">
                                    <i class="fa fa-users"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card p-4" style="background-color: skyblue;">
                            <div class="card-body d-flex justify-content-between align-items-center">
                                <div>
                                    <span class="h4 d-block font-weight-normal mb-2 ">B栋1801</span>
                                    <span class="h4 d-block font-weight-normal mb-2"> </span>
                                    <span class="text-p"> </span>
                                </div>
                                <div class="h2 text-muted">
                                    <i class="fa fa-users"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                   

                    </div>

                   </div>

                   
                </div>
                
                
                
                <div  class="col-md-12 container-fluid" id="voidemeets" style="display: none;">
                		<div class="row">
                    <div class="col-md-2" >
                    	
                        <div class="card p-4" style="background-color: skyblue;">
                            <div class="card-body d-flex justify-content-between align-items-center">
                                <div>
                                    <span class="h4 d-block font-weight-normal mb-2" >视屏会议1</span>
                                </div>
                                <div class="h3 text-muted">
                                    <i class="fa fa-video">
                                    </i>
                                </div>
                            </div>
                            
                    </div>
                      </div>
                      
                      <div class="col-md-2" >
                    	
                        <div class="card p-4" style="background-color: skyblue;">
                            <div class="card-body d-flex justify-content-between align-items-center">
                                <div>
                                    <span class="h4 d-block font-weight-normal mb-2" >视屏会议2</span>
                                </div>
                                <div class="h3 text-muted">
                                    <i class="fa fa-video">
                                    </i>
                                </div>
                            </div>
                            
                    </div>
                      </div>
                            </div>
                        </div>
                   
                
                

                            <div class="card-body p-0">
                                <div class="p-4">
                                	
                                	<table border="1">
                                	</table>
                                </div>

                                <div class="justify-content-around mt-4 p-4 bg-light d-flex border-top d-md-down-none">
                                    <div class="text-center">
                                        <div class="text-muted small">近期会议</div>
                                        <div>xxxxxxx</div>
                                    </div>

                                    <div class="text-center">
                                        <div class="text-muted small">地点</div>
                                        <div>xxxxxxxx</div>
                                    </div>

                                    <div class="text-center">
                                        <div class="text-muted small">联系人</div>
                                        <div>Tom</div>
                                    </div>

                                    <div class="text-center">
                                        <div class="text-muted small">手机</div>
                                        <div>13333236782</div>
                                    </div>
                                    <div class="text-center">
                                        <div class="text-muted small">电话</div>
                                        <div>027-888888</div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="./vendor/jquery/jquery.min.js"></script>
<script src="./vendor/popper.js/popper.min.js"></script>
<script src="./vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="./vendor/chart.js/chart.min.js"></script>
<script src="./js/carbon.js"></script>
<script src="./js/demo.js"></script>

</body>
<script type="text/javascript">
		var a = 1;
		$(document).ready(function(){
		$("#videomeet").click(function(){
			$("#locameets").hide();
			$("#voidemeets").show();
			$("#videomeet").toggleClass('active');
			$("#locameet").removeClass('active');
		});
		$("#locameet").click(function(){
			$("#locameets").show()
			$("#voidemeets").hide();
			$("#videomeet").removeClass('active');
			$("#locameet"). toggleClass('active');
		});
		});
		
		
		
	</script>
</html>