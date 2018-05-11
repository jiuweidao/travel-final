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
		<aside id="fh5co-aside" role="complementary" class="border fullHeight">

			<h1 id="fh5co-logo"><a href="index.html">Marble</a></h1>
			<nav id="fh5co-main-menu" role="navigation">
				<ul>
					<li ><a href="index.html">首页</a></li>
					<li><a href="allPlans">所有邀约</a></li>
					<li><a href="portfolio.html">出行游记</a></li>
					<li><a href="<%=basePath%>login">登陆</a></li>
					<li class="fh5co-active"><a href="contact.html">注册</a></li>
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
					   				
									<input id="mobile4r_ipt" type="text" placeholder="手机号" class="input_login">
						<!-- <h3 id="mobile4rerror"></h3> -->
									<input id="username4r_ipt" type="text" placeholder="用户名" class="input_login">
									<input id="password4r_ipt" type="password" placeholder="Password" class="input_login">
									<input id="repassword4r_ipt" type="password" placeholder="Password" class="input_login">
						
						
								<button id="regist_btn"type="submit" class="button_login" >注册</button>
								<h3><input id="check_cbx"  type="checkbox" />同意《用户协议》</h3>
								
					
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
			
			
			
			
			
			<!-- <div >
				<div>
					<div class="container">
						<form class="form">
						<input type="text" placeholder="Username">
						<input type="password" placeholder="Password">
						<button type="submit" id="login-button">Login</button>
					</form>
			</div> -->
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
	$('#regist_btn').click(function(){
			var mobile=$("#mobile4r_ipt").val();  
    		var username=$("#username4r_ipt").val(); 
    		var password=$("#password4r_ipt").val();  
    		var repassword=$("#repassword4r_ipt").val();
   			var check=$("#check_cbx").val();
   			
   			
   			$('mobile4rerror').text('hiuhihih');
   			//手机号
   			var mobileReg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;
   			//中文英文数字[^\u4E00-\u9FA5A-Za-z0-9]/g
   			var nameReg = /[^\u4E00-\u9FA5A-Za-z0-9]/g;
   			
   			if(mobile==""){
                 alert("手机号不能为空");
                 return false;
             }else if(mobile.length !=11||!mobileReg.test(mobile)){
              	 var errorMsg = '手机号格式不正确.';
             	 alert("手机号格式不正确");
             	 return false;
    		}
    		
    		
  			if(username.length>15||username.length<6||nameReg.test(username)){//6~15位数字汉字英文
    			alert("用户名格式错误，应为6~15位数字汉字英文");
    			return false;
  			}
  			if(password.length>15||password.length<6){//6-15
    			alert("密码为6-15位");
    			return false;
  			}
  			if(password != repassword){//6-15
    			alert("两次密码不一致");
    			return false;
  			}
  			if(!$('#check_cbx').is(':checked')) {
    			alert("未同意用户协议");
    			return false;
			}
    		$.ajax({  
				data:"mobile=" + mobile+ "&username=" + username+ "&password=" +password,      
        		type:"POST",  
     			datatype:'json',
        		url:"registerByM",  
        		error:function(data){  
           			 alert("出错了！！:"+data);  
        		},  
        		success:function(data){  
        		
        		
        			var json=JSON.parse(data);
        			if(json.success=="1"){
        				alert("成功注册"); 
        				window.location.href ="<%=request.getContextPath()%>" + "/login"
        			}else if(json.mobile=="1"){
        				alert("该手机号已经被占用"); 
        					
        			}else if(json.userName=="1"){
        				alert("该用户名已经被占用"); 
        			}else{
        				alert("注册失败"+json.msg); 
        			}
        			
        		
        	}  
     	});  
	});
	</script>
	</body>
</html>


