<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Marble &mdash; Free HTML5 Bootstrap Website Template by FreeHTML5.co</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
	<meta name="keywords" content="free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	
  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Flexslider  -->
	<link rel="stylesheet" href="css/flexslider.css">
	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
	<div id="fh5co-page">
		<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
		<aside id="fh5co-aside" role="complementary" class="border js-fullheight">

			<h1 id="fh5co-logo"><a href="index.html">独步</a></h1>
			<nav id="fh5co-main-menu" role="navigation">
				<ul>
					<li class="fh5co-active"><a href="index.html">首页</a></li>
					<li><a href="allPlans">所有邀约</a></li>
					<li><a href="portfolio.html">出行游记</a></li>
					<div id="nologin" style="display:none;">
						<li><a href="<%=basePath%>login">登陆</a></li>
						<li><a href="<%=basePath%>register">注册</a></li>
					</div>
					<div id="logined" style="display:none;">
						<li class="fh5co-active"> <a> 我的窝</a></li>
						<li><a id="username" href="<%=basePath%>myMessage">${username}</a></li>
						<li><a  href="<%=basePath%>createPlan">我要出游</a></li>
						<li><a  href="<%=basePath%>myplans">我的邀约</a></li>
						<li><a  href="<%=basePath%>myappplans">我的申请</a></li>
						<li><a id="logout_btn" href="" >退出登录</a></li>
					</div>
				</ul>
			</nav>

			<div class="fh5co-footer">
				<ul>
					<li><a href="#"><i class="icon-facebook2"></i></a></li>
					<li><a href="#"><i class="icon-twitter2"></i></a></li>
					<li><a href="#"><i class="icon-instagram"></i></a></li>
					<li><a href="#"><i class="icon-linkedin2"></i></a></li>
				</ul>
			</div>

		</aside>

		<div id="fh5co-main">
			<div class="fh5co-narrow-content">
				<div class="row row-bottom-padded-md">
					<div class="col-md-6 animate-box" data-animate-effect="fadeInLeft" >
						<img class="img-responsive" src="images/img_bg_1.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					</div>
					<div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
						<h2 class="fh5co-heading">旅行邀约${plans.title}</h2>
						<p>期望人数：${plans.expectnum}&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp
							目前人数：${plans.presentnum}</p>
						<p>开始时间：<fmt:formatDate value="${plans.departuretime}" pattern="yyyy-MM-dd"/>
						&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp
							结束时间：<fmt:formatDate value="${plans.endtime}" pattern="yyyy-MM-dd"/></p>
						<p>出发地点：${plans.departureplace}</p>
						<p>目的地点：${plans.destination}</p>
						<p>出发地点：${plans.departureplace}</p>
						<p>旅行预算：${plans.budgetbottom}---${plans.budgettop}</p>
						
						<p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp ${plans.detail}</p>
					  	<c:if test='${plans.type == "1"}'>
							<p><a id="" href="#" class="btn btn-primary">出游中</a></p>
						</c:if>
					  	<c:if test='${plans.type == "0"}'>
							<c:if test='${uid == plans.creatby}'>
								<p><a id="" href="modifyPlan?id=${plans.id}" class="btn btn-primary">修改邀约</a>
								<a id="delete_btn" href="deletePlan?id=${plans.id}" class="btn btn-primary">取消出行</a>
								<a id="addplan_btn" href="leave?id=${plans.id}" class="btn btn-primary">出发</a> </p>
							</c:if>
							<c:if test='${uid != plans.creatby}'>
								<c:if test='${plans.ismember == true}'>
									<p><a id="" href="#" class="btn btn-primary">已申请</a> </p>
								</c:if>
								<c:if test='${plans.ismember != true}'>
									<p><a id="appplan_btn" href="appPlan?id=${plans.id}" class="btn btn-primary">申请加入</a> </p>
								</c:if>
							
							</c:if>
						</c:if>
					  	
					  
					
					
					</div>
				</div>
			</div>

			<div class="fh5co-narrow-content">
					
					<h2 class="fh5co-heading animate-box" data-animate-effect="fadeInLeft">Our Services</h2>
					<div class="row">
						<div class="col-md-6">
							<div class="fh5co-feature animate-box" data-animate-effect="fadeInLeft">
								<div class="fh5co-icon">
									<i class="icon-settings"></i>
								</div>
								<div class="fh5co-text">
									<h3>Strategy</h3>
									<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="fh5co-feature animate-box" data-animate-effect="fadeInLeft">
								<div class="fh5co-icon">
									<i class="icon-search4"></i>
								</div>
								<div class="fh5co-text">
									<h3>Explore</h3>
									<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
								</div>
							</div>
						</div>

						<div class="col-md-6">
							<div class="fh5co-feature animate-box" data-animate-effect="fadeInLeft">
								<div class="fh5co-icon">
									<i class="icon-paperplane"></i>
								</div>
								<div class="fh5co-text">
									<h3>Direction</h3>
									<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="fh5co-feature animate-box" data-animate-effect="fadeInLeft">
								<div class="fh5co-icon">
									<i class="icon-params"></i>
								</div>
								<div class="fh5co-text">
									<h3>Expertise</h3>
									<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
								</div>
							</div>
						</div>
					</div>
				</div>
		
			<div class="fh5co-narrow-content">
				<div class="row">
					<div class="col-md-4 animate-box" data-animate-effect="fadeInLeft">
						<h1 class="fh5co-heading-colored">Get in touch</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box" data-animate-effect="fadeInLeft">
						<p class="fh5co-lead">Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
						<p><a href="#" class="btn btn-primary">Learn More</a></p>
					</div>
					
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>
	
	
	<!-- MAIN JS -->
	<script src="js/main.js"></script>
<script type="text/javascript">
	var username = $('#username').text();
	
	if(username !=""){
		$('#logined').show();
		$('#nologin').hide();
	}else{
		$('#nologin').show();
		$('#logined').hide();
	}
	
	$('#appplan_btn').click(function(){
			
    		$.ajax({  
				/* data:"mobile=" + mobile+ "&username=" + username+ "&password=" +password, */      
        		type:"POST",  
     			datatype:'json',
        		url:"appPlan?id="+${plans.id},  
        		error:function(data){  
           			 alert("出错了！！:"+data);  
        		},  
        		success:function(data){  
        		
        			var json=JSON.parse(data);
        			if(json.success=="1"){
        				$('#appplan_btn').text("已申请");
        			}else{
        				alert("申请失败"+json.msg); 
        			}
        			
        		
        	}  
     	});  
	});
		$('#logout_btn').click(function() {
	$.ajax({ 
		type: "post", 
		url: "<%=request.getContextPath()%>" + "/logout", 
		data: {}, 
		dataType: "json", 
		success: function(data) { 
			window.location.href = "<%=request.getContextPath()%>" +  "/login";
		},
		error: function(data) { 
			alert("调用失败...."); 
		}
	});
});
	</script>
	</body>
</html>

