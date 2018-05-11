<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
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
					<li class="fh5co-active"><a href="allPlans">所有邀约</a></li>
					<li><a href="portfolio.html">出行游记</a></li>
					<div id="nologin" style="display:none;">
						<li><a href="<%=basePath%>login">登陆</a></li>
						<li><a href="<%=basePath%>register">注册</a></li>
					</div>
					<div id="logined" style="display:none;">
						<li > <a> 我的窝</a></li>
						<li><a id="username" href="<%=basePath%>myMessage">${username}</a></li>
						<li ><a  href="<%=basePath%>createPlan">我要出游</a></li>
						<li ><a  href="<%=basePath%>myplans">我的邀约</a></li>
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
				<div class="row">
						<div class="col-md-4 animate-box" data-animate-effect="fadeInLeft">
							<h1 class="fh5co-heading-colored">所有邀约</h1>
						</div>
					</div>
				<div class="row row-bottom-padded-md">
				 <c:forEach items="${lstPlans}" var="list" varStatus="status"><%-- ${list.createtime} --%>
					<div class="col-md-3 col-sm-6 col-padding animate-box" data-animate-effect="fadeInLeft">
						<div class="blog-entry">
							<a href="plandetail" class="blog-img"><img src="images/img-2.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co"></a>
							<div class="desc">
								<h3><a href="#" >${list.title} <i class="icon-arrow-right3"></i></a><br></h3>
								<a href="#">${list.tag}</a><br>
								<a href="#" class="lead">期望人数:${list.expectnum} </a><a href="#" class="lead">/目前人数:${list.presentnum} </a>
								<%-- <span><small>期望人数 </small> / <small> ${list.expectnum}</small> / <small> <i class="icon-comment"></i> </small></span> --%>
								<p>${list.detail}</p>
								<a href="plandetail?id=${list.id}" class="lead">Read More <i class="icon-arrow-right3"></i></a>
							</div>
						</div>
					</div>
					
					
					</c:forEach>>	
					
					
					

				
					
					

					
					
				</div>
			</div>
		
			<div id="get-in-touch">
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

