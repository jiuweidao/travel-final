<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<!--[if IE 7 ]><html class="ie ie7 lte9 lte8 lte7" lang="en-US"><![endif]-->
<!--[if IE 8]><html class="ie ie8 lte9 lte8" lang="en-US">	<![endif]-->
<!--[if IE 9]><html class="ie ie9 lte9" lang="en-US"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html class="noIE" lang="en-US">
<!--<![endif]-->
	<head>
		<title>Flusk</title>

		<!-- meta -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale = 1.0, maximum-scale=1.0, user-scalable=no"/>
		
		<!-- google fonts -->
		<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans'>
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Droid+Serif:regular,bold"/>
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Alegreya+Sans:regular,italic,bold,bolditalic"/>
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Nixie+One:regular,italic,bold,bolditalic"/>
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Alegreya+SC:regular,italic,bold,bolditalic"/>
		
		<!-- css -->
		<link rel="stylesheet" href="assets/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/css/style.css" media="screen"/>

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.js"></script>
			<script src="assets/js/respond.js"></script>
		<![endif]-->

		<!--[if IE 8]>
	    	<script src="assets/js/selectivizr.js"></script>
	    <![endif]-->
	</head>
	
	<body>
		<div id="drawer-right">
			<div class="cross text-right">
				<a class="toggleDrawer" href="#"><i class="fa fa-times-circle fa-2x"></i></a>
			</div>
			<h2>我的窝</h2>
			
				<ul class="nav nav-pills nav-stacked">
					<li>
						<a href="<%=basePath%>myMessage"><i class="fa fa-home"></i> 基本信息</a>
					</li>
					<li>
						<a href="<%=basePath%>userMessage?id=${me.id}"><i class="fa fa-home"></i> 个人名片</a>
					</li>
					<li>
						<a href="<%=basePath%>createPlan"><i class="fa fa-bookmark"></i> 发起邀约</a>
					</li>
					<li>
						<a href="<%=basePath%>allPlans?type=0&page=1&id=${me.id}"><i class="fa fa-tasks"></i> 我的邀约</a>
					</li>
					<li>
						<a href="<%=basePath%>myappplans"><i class="fa fa-heart"></i> 我的申请</a>
					</li>
					<li>
						<a href="<%=basePath%>myplans?type=0&page=1"><i class="fa fa-tasks"></i> 我的游记</a>
					</li>
					<li>
						<a href="<%=basePath%>createStrategy"><i class="fa fa-wordpress"></i> 撰写游记</a>
					</li>
					<li>
						<a href="#testimonials"><i class="fa fa-thumbs-up"></i> Testimonials</a>
					</li>
					<li>
						<a id ="logout_btn"><i class="fa fa-phone-square"></i> 退出登录</a>
					</li>
				</ul>
			<div class="social">
				<h2>Stay Connected</h2>
				<ul>
					<li><a href=""><i class="fa fa-facebook-square fa-3x"></i></a></li>
					<li><a href=""><i class="fa fa-twitter-square fa-3x"></i></a></li>
					<li><a href=""><i class="fa fa-tumblr-square fa-3x"></i></a></li>
					<li><a href=""><i class="fa fa-google-plus-square fa-3x"></i></a></li>
				</ul>
			</div>
		</div><!-- #drawer-right -->



		<script src="assets/js/jquery-2.1.3.min.js"></script>
		<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/jquery.actual.min.js"></script>
		<script src="assets/js/jquery.scrollTo.min.js"></script>
		<script src="assets/js/script.js"></script>
	<script type="text/javascript">
	var username = $('#username').text();
	
	if(username !=""){
		$('#logined_div').show();
		$('#user_div').show();
		$('#nologin_div').hide();
	}else{
		$('#nologin_div').show();
		$('#logined_div').hide();
		$('#user_div').hide();
	}
	
	$('#logout_btn').click(function() {
		$.ajax({ 
			type: "post", 
			url: "<%=request.getContextPath()%>" + "/logout", 
			dataType: "json", 
			success: function(data) { 
				window.location.href = "<%=request.getContextPath()%>" +  "/login";
			},
			error: function(data) { 
				alert("调用失败....",data); 
			}
		});
	});
	</script>

	</body>
</html>
