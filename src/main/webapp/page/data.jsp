<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
		  content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>会议管理系统</title>
	<link rel="stylesheet" href=""/>
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
		<div class="row">

			<div class="col-md-12 text-center">

				<button class="btn btn-primary btn-lg" onclick="window.location.href='home.html'"><span class="fa fa-home"></span>会议室</button>
				<button class="btn btn-success btn-lg"><span class="fa fa-arrow-circle-down"></span>资源</button>
				<button class="btn btn-primary btn-sm" style="background-color: darkblue">空闲</button>
				<button class="btn btn-secondary btn-sm">占用</button>
				<br /><br />

			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 bg-light">
				<div class="row">
					<div class="col-md-2">
						<div class="form-group">
							<select  class="form-control">
                                            <span class="fa fa-home">
                                           <option> </span>WH</option>
								<option>NJ</option>
								<option>SH</option>
							</select>
						</div>


					</div>
					<div class="col-md-2">
						<div class="form-group">

							<select  class="form-control">
								<option>YMTC</option>
								<option>NJ</option>
								<option>SH</option>

							</select>
						</div>


					</div>



					<div class="col-md-2">
						<select class="form-control">
							<option>8</option>
							<option>7</option>
							<option>6</option>
							<option>5</option>
							<option>4</option>

						</select>

					</div>

				</div>


				<div class=" col-md-12 form-group  bg-light ">
					<div class="row">

						<label  class=" form-control col-md-2 bg-light " style="border: 0px">状态:<button  style="background-color: #98fb98" class="btn"></button>占用</label>

						<input id="time" style="height: 34px" class="form-control col-3" type="date" class="form-control" >
					</div>
				</div>

				<div class=" col-md-12 form-group  bg-light;">
					<div class="row">

						<div class="table-responsive divcss5-b form-control" style="border: 0px; margin-left:10px;overflow-y:scroll; overflow-x:scroll;width: 70%;height: 500px;padding: 0px">
							<table class="table table-responsive"  >
								<tr style="border-right:#FF0000 solid 1px">
									<td border="0px"  width="100px"></td>

									<td colspan="4" width="100px"><center style="color: red;font-size: 30px;">9点</center></td>
									<td colspan="4" width="100px"><center style="color: red;font-size: 30px;">10点</center></td>
									<td colspan="4" width="100px"><center style="color: red;font-size: 30px;">11点</center></td>
									<td colspan="4" width="100px"><center style="color: red;font-size: 30px;">12点</center></td>
									<td colspan="4" width="100px"><center style="color: red;font-size: 30px;">13点</center></td>
									<td colspan="4" width="100px"><center style="color: red;font-size: 30px;">15点</center></td>
									<td colspan="4" width="100px"><center style="color: red;font-size: 30px;">16点</center></td>
									<td colspan="4" width="100px"><center style="color: red;font-size: 30px;">17点</center></td>
									<td colspan="4" width="100px"><center style="color: red;font-size: 30px;">18点</center></td>
									<td colspan="4" width="100px"><center style="color: red;font-size: 30px;">19点</center></td>
									<td colspan="4" width="100px"><center style="color: red;font-size: 30px;">20点</center></td>
									<td colspan="4" width="100px"><center style="color: red;font-size: 30px;">21点</center></td>
									<td colspan="4" width="100px"><center style="color: red;font-size: 30px;">22点</center></td>

								</tr>
								<tr rowspan="4" >

									<td ></td>

									<td>00</td>
									<td>15</td>
									<td>30</td>
									<td>45</td>

									<td>00</td>
									<td>15</td>
									<td>30</td>
									<td>45</td>

									<td>00</td>
									<td>15</td>
									<td>30</td>
									<td>45</td>

									<td>00</td>
									<td>15</td>
									<td>30</td>
									<td>45</td>

									<td>00</td>
									<td>15</td>
									<td>30</td>
									<td>45</td>

									<td>00</td>
									<td>15</td>
									<td>30</td>
									<td>45</td>

									<td>00</td>
									<td>15</td>
									<td>30</td>
									<td>45</td>

									<td>00</td>
									<td>15</td>
									<td>30</td>
									<td>45</td>

									<td>00</td>
									<td>15</td>
									<td>30</td>
									<td>45</td>

									<td>00</td>
									<td>15</td>
									<td>30</td>
									<td>45</td>

									<td>00</td>
									<td>15</td>
									<td>30</td>
									<td>45</td>

									<td>00</td>
									<td>15</td>
									<td>30</td>
									<td>45</td>

									<td>00</td>
									<td>15</td>
									<td>30</td>
									<td>45</td>
								</tr>

								<tr><td style=' font-size: 19px'height='10px'>B0811</td>
									<td></td>  <td></td>  <td id="meet1" title="2019-04-16 08:30-09:30 会议室B0811" colspan="4" bgcolor="#98fb98">test</td>  </td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>









								</tr>
								<tr ><td style=' font-size: 19px'height='10px'>B0831</td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
								<tr>
								<tr ><td style=' font-size: 19px'height='10px'>B0861</td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
									<td></td>  <td></td>  <td></td>  <td></td>
								<tr>






							</table>

						</div>

						<div id="meetx"  style="background-color: white;width: 300px;height: 150px;display: none">
							<p class="form-control" style="border: 0px">时间:2019-04-19 08-30~09:30</p>
							<p class="form-control"  style="border: 0px">主题：test</p>
							<p class="form-control"  style="border: 0px"    >预定人：马邦德</p>




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
	function getNow(s) {
		return s < 10 ? '0' + s: s;
	}

	var data= new Date();
	var year=data.getFullYear();
	var month=data.getMonth()+1;
	var date=data.getDate();
	var h=data.getHours();       //获取当前小时数(0-23)
	var m=data.getMinutes();     //获取当前分钟数(0-59)
	var s=data.getSeconds();
	var now=year+'-'+getNow(month)+"-"+getNow(date)

	$(document).ready(function(){
		$("#meet1").mousemove(function(){
			$("#meetx").show();

		})
		$("#meet1").mouseleave(function(){
			$("#meetx").hide();

		})


		$("#time").val(now)

		for(var i=i;i<14;i++){
			$("#ex").append(" <td>00</td><td>15</td><td>30</td><td>45</td>")

		}


		for(var i=1;i<5;i++){
			$("table").append("<tr class='tr'><td style=' font-size: 19px'height='10px'>B082"+i+"</td></tr>")


		}
		for (var j=1;j<14;j++){
			$(".tr").append("<td></td>  <td></td>  <td></td>  <td></td>")
		}

		var choosetime=$("#time").val();

	})




</script>
</html>
