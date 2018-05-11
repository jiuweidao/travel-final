<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>        
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

	<link rel="stylesheet" href="css/styles_login.css">
	
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
					<li><a href="index.html">首页</a></li>
					<li><a href="allPlans">所有邀约</a></li>
					<li><a href="portfolio.html">出行游记</a></li>
					<li class="fh5co-active"><a href="<%=basePath%>login">登陆</a></li>
					<li><a href="<%=basePath%>register">注册</a></li>
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

		<div id="fh5co-main"  >
			<aside id="fh5co-hero" class="js-fullheight" >
				<div class="flexslider js-fullheight" >
					<ul class="slides">
				   	<li style="background-image: url(images/img_bg_1.jpg);">
				   		
				   		<div class="logintop container-fluid " >
				   			<div class="row">
					   			<div class="col-md-8 col-md-offset-2 text-center js-fullheight slider-text">
					   				<div class="slider-text-inner" style="margin-right: 50px" >
					   				<!-- <form class="form"> -->
						<input id="mobile4l_ipt" type="text" placeholder="用户名/手机号/邮箱" class="input_login">
						<input id="password4l_ipt" type="password" placeholder="Password" class="input_login">
					<!-- </form> -->
					<button id="login_btn"type="submit" class="button_login">登录</button>
					<div class="Free">
								<h3><input id="nologin_cbx" name="nologin" class="chbox" type="checkbox" />
								两周内免登录</h3>
						</div>
							
											<!-- <p><a class="btn btn-primary btn-demo popup-vimeo" href="https://vimeo.com/channels/staffpicks/93951774"> <i class="icon-monitor"></i> Live Preview</a> <a class="btn btn-primary btn-learn">Learn More<i class="icon-arrow-right3"></i></a></p> -->
					   			<h1>Intuitive <strong></strong> is How Give We the User New Superpowers</h1>
					   					<h2>More Templates 
					   					<a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></h2>
						
					   			</div>
					   		</div>
				   		</div>
				   	</li>
				   	
				   
				  	</ul>
			  	</div>
			</aside>
			
			
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
	//密码登录
		$('#login_btn').click(function(){
			var mobile=$("#mobile4l_ipt").val();  
    		var password=$("#password4l_ipt").val();  
    		 
    		var nologin;
   
   			if(mobile==""){
    			alert("用户名不能为空");
    			return false;
    		}
    		if(password==""){
    			alert("密码不能为空");
    			return false;
  			}
    	 	
    		
			if($('#nologin').is(':checked')) {
    			nologin="true"; 
			}else{
				nologin="false"; 
			}
			
    		$.ajax({  
        		data:"mobile=" + mobile + "&password=" + password+ "&nologin=" + nologin,      
        		type:"POST",  
     			/* datatype:'json', */
        		url: "<%=request.getContextPath()%>" + "/checkLogin", 
        		error:function(data){  
           			 alert("出错了！！:");  
        		},  
        		success: function(data) { 
        			var json=JSON.parse(data);
					if(json.msg=="true"){
						//登录成功
						window.location.href ="<%=request.getContextPath()%>" + "/index";
					}else{
						alert("用户名或密码错误");
				}
			},
			
     	});  
	});
	</script>
	</body>
</html>


