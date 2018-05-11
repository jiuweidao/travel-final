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

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
<script src="<%=basePath%>js/datePicker/WdatePicker.js?v=${staticVersion}"
	type="text/javascript"></script>
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
						<li class="fh5co-active"><a id="username" href="<%=basePath%>myMessage">${username}</a></li>
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
		
			
			<div class="fh5co-narrow-content" style="box-sizing:content-box;">
			<div class="row">
					<div class="col-md-4 animate-box" data-animate-effect="fadeInLeft">
						<h1 class="fh5co-heading-colored">个人信息</h1>
					</div>
				</div>
					<form id="message_form">
					<div class="row">
						<div class="col-md-6">
							<div class="fh5co-feature animate-box" data-animate-effect="fadeInLeft">
								<div class="fh5co-icon">
									<i class="icon-settings"></i>
								</div>
								<div class="fh5co-text">
									<h3>昵称：<input id="name" name="name"type="text" " class="input_plan" value="${users.name}">*<a id="name_error" style="display:none;" >不能为空</a></h3>
									<h3>手机：<input id="telemoble" name="telemoble" value="${users.telemoble}" type="text"class="input_plan">*<a id="telemoble_error" style="display:none;" >不能为空</a></h3>
									<h3>邮箱：<input id="email" name="email" value="${users.email}"  type="text"   class="input_plan"><a id="email_error" style="display:none;" >不能为空</a></h3>
									<h3>阶级：<input id="class" name="departureplace" value="" type="text" " class="inputonlyread_plan" readonly="true">
									<h3>积分：<input id="score" name="score" value="${users.score}" type="text" " class="inputonlyread_plan" readonly="true"></a></h3>
									<p></p>
									<p> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp
									<a id="modifyMessage_btn" href="#" class="btn btn-primary">修改</a></p>
								</div>
							</div>
						</div>
						</form>
						
						<form id = "password_form">
						<div class="col-md-6">
							<div class="fh5co-feature animate-box" data-animate-effect="fadeInLeft">
								<div class="fh5co-icon">
									<i class="icon-settings"></i>
								</div>
								<div class="fh5co-text">
									<h3>修改密码</h3>
									<h3>原密码：<input id="repassword" name="repassword" type="password" class="input_plan"><a id="repassword_error" style="display:none;" >不能为空</a></h3>
									<h3>新密码：<input  id="password" name="password"type="password" class="input_plan"><a id="password_error" style="display:none;" >不能为空</a></h3>
									<h3>再输入：<input  id="password2" name="password2"  type="password" class="input_plan"><a id="password2_error" style="display:none;" >不能为空</a></h3>
									<p> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp
									<a id="modifyPassworde_btn" href="#" class="btn btn-primary">修改密码</a> </p>
								
								</div>
							</div>
						</div>
						</form>
					
					
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
	$('#modifyMessage_btn').click(function(){
			var name=$("#name").val(); 
			var telemoble=$("#telemoble").val();  
    		var email=$("#email").val();
    		var error=""; 
    		
    		
    		$('#name_error').hide();
    		$('#telemoble_error').hide();
    		$('#email_error').hide();
   			//手机号
   			var mobileReg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;
   			//中文英文数字[^\u4E00-\u9FA5A-Za-z0-9]/g
			var emailReg =/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;   	
					
			if(name==""){
			 	$('#name_error').show();
                 error="true";
			}
   			if(telemoble==""){
                 $('#telemoble_error').show();
                 $('#telemoble_error').text("不能为空");
                 error="true";
             }else if(telemoble.length !=11||!mobileReg.test(telemoble)){
                 $('#telemoble_error').show();
                 $('#telemoble_error').text("手机号格式不正确");
             	 error="true";
    		}
    		
    		if(email !=""){
                 if(!emailReg.test(email)){
             	 	$('#email_error').show();
                 	$('#email_error').text(" 邮箱格式不正确");
             	 	error="true";
             	}
             }
             if(error!=""){
             	return false;
             }
    		$.ajax({  
				data:$('#message_form').serialize()+"&type=m",       
        		type:"POST",  
     			datatype:'json',
        		url:"modifyMyssage",  
        		error:function(data){  
           			 alert("出错了！！:"+data);  
        		},  
        		success:function(data){  
        		
        			var json=JSON.parse(data);
        			if(json.success=="1"){
        				alert("修改成功"); 
        			}else if(json.telemoble=="1"){
        				$('#telemoble_error').text(" 该手机号已被占用"); 
        			}else if(json.email=="1"){
        				$('#email_error').text(" 该邮箱已被占用"); 
        			}else if(json.email=="f"){
        				$('#email_error').text(" 无效邮箱"); 
        			}
        			else{
        				alert("修改失败"+json.msg); 
        			}
        			
        		
        	}  
     	});  
    });
    $('#modifyPassworde_btn').click(function(){
    		
    		var repassword=$("#repassword").val(); 
			var password=$("#password").val();  
    		var password2=$("#password2").val(); 
    		var error=""; 
    		
    		$('#repassword_error').hide();
    		$('#password_error').hide();
    		$('#password2_error').hide();
    		
    		if(repassword==""){
    			$('#repassword_error').show();
    			$('#repassword_error').text(" 不能为空");
    			error="true";
    		}
    		if(password.length>15||password.length<6){//6-15
    			$('#password_error').show();
    			$('#password_error').text(" 密码为6-15位");
    			error="true";
  			}
  			if(password != password2){//6-15
    			$('#password2_error').show();
    			$('#password2_error').text(" 两次密码不一致");
    			error="true";
  			}
  			 if(error!=""){
             	return false;
             }
    		$.ajax({  
				data:$('#password_form').serialize()+"&type=p",      
        		type:"POST",  
     			datatype:'json',
        		url:"modifyMyssage",  
        		error:function(data){  
           			 alert("出错了！！:"+data);  
        		},  
        		success:function(data){  
        			var json=JSON.parse(data);
        			if(json.success=="1"){
        				alert("修改成功"); 
        				$("#repassword").val(""); 
						$("#password").val("");  
    					$("#password2").val("");
        			}else if(json.password=="f"){
        				$('#repassword_error').show();
    					$('#repassword_error').text(" 密码错误");
        					
        			}else{
        				alert("修改失败"); 
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
	$('#clear_btn').click(function(){
			$("#title").val("");  
			$("#tag").val(""); 
    		$("#departuretime").val(""); 
    		$("#departureplace").val(""); //出发时间 
    		$("#destination").val("");	   //目的地
   			$("#expectnum").val("");
   			$("#content").val("");
   			$("#endtime").val("");
   			$("#budgetbottom").val("");
   			$("#budgettop").val("");
	});
	</script>
	</body>
</html>

