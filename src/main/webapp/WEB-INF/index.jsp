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
		<jsp:include   page="sidebar.jsp" flush="true"/>
		<div id="wrapper">
			<div id="header" class="content-block header-wrapper-index">
				<div class="header-wrapper-inner">
					<section class="top clearfix">
						<div class="pull-left">
							<h1><a class="logo">独步</a></h1>
						</div>
						<div id="user_div" class="pull-right"  style="display: none">
							<a class="toggleDrawer" href="#"><i class="fa fa-bars fa-2x"></i></a>
						</div>
						<div id="nologin_div" class="pull-right">
							<a class="logo" href="login">登录/注册</a>
						</div>
						<div id="logined_div" class="pull-right" style="display: none">
							<span  id="username" href="login">${me.name}</span>
						</div>
						<div class="pull-right">
							<a class="logo" href="index.html">出行交通</a>
						</div>
						<div class="pull-right">
							<a class="logo" href="allPlans?type=0&page=1&id=0">所有邀约</a>
						</div>
						<div class="pull-right">
							<a class="logo" href="index.html">出行游记</a>
						</div>
						<div class="pull-right">
							<a class="logo" href="index.html">首页</a>
						</div>
					
						<div class="pull-right">
							<input id="search_txt" type="text" class="form-control form-control-white" placeholder="搜索">
						</div>
					</section>
					<section class="center">
						<div class="slogan">
							<!-- SLIM &amp; STYLISH -->
							<p>
							旅行，有些许流浪，些许浑然忘我的逍遥<br/>
							却总躲不过一种孑然一身，隐入苍茫孤独自然的苍凉<br>
							</p>
							</div>
						<div class="secondary-slogan">
							Travel alone not longly.
							
						</div>
					</section>
					<section class="bottom">
						<a id="scrollToContent" href="#">
							<img src="assets/images/arrow_down.png">
						</a>
					</section>
				</div>
			</div><!-- header -->

			
			<!-- <div class="content-block" id="portfolio">
				<div class="container">
					<header class="block-heading cleafix">
						<a href="#" class="btn btn-o btn-lg pull-right">查看更多</a>
						<h1>热门邀约地</h1>
						<p>组团邀约的热门地</p>
					</header>
					<section class="block-body">
						<div class="row">
							<div class="col-sm-4">
								<a href="#" class="recent-work" style="background-image:url(assets/images/rain_1-320x240.jpg)">
									<span class="btn btn-o-white">丽江</span>
								</a>
							</div>
							<div class="col-sm-4">
								<a href="#" class="recent-work" style="background-image:url(assets/images/min_icons_thumb1-320x240.jpg)">
									<span class="btn btn-o-white">三亚</span>
								</a>
							</div>
							<div class="col-sm-4">
								<a href="#" class="recent-work" style="background-image:url(assets/images/flat_icons_thumb.jpg)">
									<span class="btn btn-o-white">黄山</span>
								</a>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<a href="#" class="recent-work" style="background-image:url(assets/images/wood-320x240.jpg)">
									<span class="btn btn-o-white">九寨沟</span>
								</a>
							</div>
							<div class="col-sm-4">
								<a href="#" class="recent-work" style="background-image:url(assets/images/bike-320x240.jpg)">
									<span class="btn btn-o-white">桂林山水</span>
								</a>
							</div>
							<div class="col-sm-4">
								<a href="#" class="recent-work" style="background-image:url(assets/images/six_1-320x240.jpg)">
									<span class="btn btn-o-white">桂林山水</span>
								</a>
							</div>
						</div>
					</section>
				</div>
			</div> --><!-- #portfolio --><!-- <div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div> -->

			<!-- <div class="content-block parallax" id="services">
				<div class="container text-center">
					<header class="block-heading cleafix">
						<h1>Our Services</h1>
						<p>A little about what we do</p>
					</header>
					<section class="block-body">
						<div class="row">
							<div class="col-md-4">
								<div class="service">
									<i class="fa fa-send-o"></i>
									<h2>Illustration</h2>
									<p>In at accumsan risus. Nam id volutpat ante. Etiam vel mi mattis, vulputate nunc nec, sodales nibh. Etiam nulla magna, gravida eget ultricies sit amet, hendrerit in lorem.</p>
								</div>
							</div>
							<div class="col-md-4">
								<div class="service">
									<i class="fa fa-heart-o"></i>
									<h2>3D Modeling</h2>
									<p>In at accumsan risus. Nam id volutpat ante. Etiam vel mi mattis, vulputate nunc nec, sodales nibh. Etiam nulla magna, gravida eget ultricies sit amet, hendrerit in lorem.</p>
								</div>
							</div>
							<div class="col-md-4">
								<div class="service">
									<i class="fa fa-camera-retro"></i>
									<h2>Photography</h2>
									<p>In at accumsan risus. Nam id volutpat ante. Etiam vel mi mattis, vulputate nunc nec, sodales nibh. Etiam nulla magna, gravida eget ultricies sit amet, hendrerit in lorem.</p>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>#services -->


			<div class="content-block" id="blog">
				<div class="container">
					<header class="block-heading cleafix">
						<a href="allPlans?type=0&page=1&id=0" class="btn btn-o btn-lg pull-right">查看更多</a>
						<h1>最新邀约</h1>
						<p>Keep up with the latest happenings.</p>
					</header>
					<section class="block-body">
						<div class="row">
							<c:forEach items="${lstPlans}" var="item" varStatus="status">
								<div class="col-sm-4 blog-post">
									<c:if test='${item.picpath == null}'>
										<img src="assets/images/bike_water1-1000x600.jpg">
									</c:if>
									<c:if test='${item.picpath != null}'>
										<img src="<%=request.getContextPath()%>${item.picpath}">
									</c:if>
								
										<a href="plandetail?id=${item.id}">
        								<h3>${item.title}</h3>
        							</a>
									<div class="date">
										<fmt:formatDate value="${item.creattime}" pattern="yyyy-MM-dd"/> 
									</div>
									<div>期望人数:${item.expectnum}/目前人数:${item.presentnum}</div>
									<p>${item.detail}</p>
									
								<!-- 	<a href="#"><h2>Design Your Mind</h2></a>
									<div class="date">3 Nov, 2014</div>
									<p>In at accumsan risus. Nam id volutpat ante. Etiam vel mi mattis, vulputate nunc nec, sodales nibh. Etiam nulla magna, gravida eget ultricies sit amet, hendrerit in lorem.</p>
									<a href="">Read More</a> -->
							</div>
							</c:forEach>
						
						</div>
					</section>
				</div>
			</div><!-- #blog -->


			<div class="content-block parallax" id="parallax">
				<div class="container text-center">
					<h1>In at accumsan risus. Nam id volutpat ante. Etiam vel mi mattis, vulputate nunc nec, sodales nibh. Etiam nulla magna, gravida eget ultricies sit amet, hendrerit.</h1>
					<a href="" class="btn btn-o-white btn-lg">Get a free quote</a>
				</div>
			</div><!-- #parallax -->

			<div class="content-block" id="testimonials">
				<div class="container">
					<header class="block-heading cleafix">
						<h1>出游达人</h1>
						<p>not alone.</p>
					</header>
					<section class="block-body">
						<div class="row">
							<c:forEach items="${lstTopUsers}" var="item" varStatus="status">
								<div class="col-md-4">
									<div class="testimonial">
									
										<c:if test='${item.iconpath == null}'>
											<img src="assets/images/bike_water1-1000x600.jpg">
										</c:if>
										<c:if test='${item.iconpath != null}'>
											<img id="pic" src="<%=request.getContextPath()%>${item.iconpath}">
										</c:if>
									<div>
										<a href="userMessage?id=${item.id}">
											<strong>${item.name}</strong>
										</a>
										<br/>
										<table>
											<tr>
    											<th>发起中</th>
    											<th>出行中</th>
    											<th>已结束</th>
    											<th>取消出行</th>
    											<th>成功率</th>
  											</tr>
  											<tr>
  												<td>${item.type0num}</td>
  												<td>${item.type1num}</td>
    											<td>${item.type2num}</td>
    											<td>${item.typefnum}</td>
    											<td>${item.successRate}%</td>
 											 </tr>
										</table>
										 <p>${item.sign}</p>
									</div>
									</div>
							</div>
							
							
							</c:forEach>
						
						
						</div>
					</section>
				</div>
			</div><!-- /#testimonials -->


		

		<jsp:include   page="footer.jsp" flush="true"/>


		</div><!--/#wrapper-->


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
	</script>

	</body>
</html>
