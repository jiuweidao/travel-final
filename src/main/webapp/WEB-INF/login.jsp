<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
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
		<div id="wrapper">
			
			<div id="header" class="content-block header-wrapper">
				<div class="header-wrapper-inner">
					<section class="top clearfix">
						<div class="pull-left">
							<h1><a class="logo">独步</a></h1>
						</div>
						<div id="nologin_div" class="pull-right">
							<a class="logo" href="login">登录/注册</a>
						</div>
						<div id="logined_div" class="pull-right" style="display: none">
							<span  id="username" class="logo" href="login">${username}</span>
						</div>
						<div class="pull-right">
							<a class="logo" href="index.html">出行交通</a>
						</div>
						<div class="pull-right">
							<a class="logo" href="index.html">所有邀约</a>
						</div>
						<div class="pull-right">
							<a class="logo" href="index.html">出行游记</a>
						</div>
						<div class="pull-right">
							<a class="logo" href="index.html">首页</a>
						</div>
					</section>
				
				</div>
			</div><!-- header -->
			<div class="content-block" id="contact">
				<div class="login-container text-center">
					<header class="block-heading cleafix">
						<span id ="to_login"  class="choosed" >登录</span><span>/</span><span id="to_register" class="unchoose">注册</span>
						<p>travel alone not lonely</p>
					</header>
					<section class="block-body">
						<div class="row" id="login_div">
							<div class="col-md-6-login col-md-offset-3">
								<form class="" role="form">
									<div class="form-group">
								    	<input id="mobile_txt" type="text" class="form-control form-control-white valid" placeholder="用户名/手机号/邮箱" required>
								  		<label id="mobile_error" class="lable-error" style="display: none" >不能為空</label>
								  	</div>
								    <div class="form-group">
								    	<input id ="password_txt" type="password" class="form-control form-control-white valid" placeholder="密码" required>
								    	<label id="password_error" class="lable-error" style="display: none" >不能為空</label>
								    </div>
								     <div class="form-group">
								    	<input id="nologin_cbx" name="nologin"  type="checkbox" /><span style="color: white">两周内免登录</span>
								  </div>
								  <input id="login_btn" type="button" class="btn btn-o-white" value="登录">/<span id="to_login_code" class="unchoose-btn">验证码登录</span>
								</form>
							</div>
						</div>
						<div class="row" id="login_code_div" style="display: none">
							<div class="col-md-6-login col-md-offset-3">
								<form class="" role="form">
									<div class="form-group">
								    	<input id="code_mobile_txt" type="text" class="form-control form-control-white valid" placeholder="手机号" required>
								  		<label id="code_mobile_error" class="lable-error" style="display: none" >不能為空</label>
								  	</div>
								    <div class="form-group">
								    	<input id ="code_verification_code_txt" type="text" class="form-control-code form-control-white valid" placeholder="验证码" required>
								  		<input id="code_getcode_btn" type="button" class="btn btn-code-white" value="获取验证码" onclick="getCode('code')">
								  		<label id="code_verification_code_error" class="lable-error" style="display: none" >不能為空</label>
								    </div>
								     <div class="form-group">
								    	<input id="code_nologin_cbx" name="code_nologin"  type="checkbox" /><span style="color: white">两周内免登录</span>
								  </div>
								  	<span id="to_login_password" class="unchoose-btn">密码登录</span>/<input id="code_login_btn" type="button" class="btn btn-o-white" value="登录">
								</form>
							</div>
						</div>
						<div class="row" id="register_div" style="display: none">
							<div class="col-md-6-login col-md-offset-3">
								<form class="" role="form">
									<div class="form-group">
								    	<input id="re_username_txt" type="text" class="form-control form-control-white valid"  placeholder="用户名" required>
								  		<label id="re_username_error" class="lable-error" style="display: none" >不能為空</label>
								  	</div>
								    <div class="form-group">
								    	<input id ="re_password_txt" type="password" class="form-control form-control-white  valid" placeholder="密码" required>
								   		<label id="re_password_error" class="lable-error" style="display: none" >不能為空</label>
								    </div>
								    <div class="form-group">
								    	<input id ="re_repassword_txt" type="password" class="form-control form-control-white valid" placeholder="再次输入密码" required>
								    	<label id="re_repassword_error" class="lable-error" style="display: none" >不能為空</label>
								    </div>
								     <div class="form-group"> 
								    	<input id ="re_mobile_txt" type="text" class="form-control form-control-white valid" placeholder="手机号" required>
								  		<label id="re_mobile_error" class="lable-error" style="display: none" >不能為空</label>
								  	</div>
								  	 <div class="form-group">
								    	<input id ="re_verification_code_txt" type="text" class="form-control-code form-control-white valid" placeholder="验证码" required>
								  		<input id="re_getcode_btn" type="button" class="btn btn-code-white" value="获取验证码"  onclick="getCode('re')">
								  		<label id="re_verification_code_error" class="lable-error" style="display: none" >不能為空</label>
								  	</div>
								     <div class="form-group">
								    		<input id="re_check_cbx" name="nologin"  type="checkbox" /><span style="color: white">同意《用户协议》</span>
								  </div>
								  <input id="regist_btn" type="button" class="btn btn-o-white" value="注册">
								</form>
							</div>
						</div>
					</section>
				</div>
			</div><!-- #contact -->

			<jsp:include   page="footer.jsp" flush="true"/>	


		</div><!--/#wrapper-->




		<script src="assets/js/jquery-2.1.3.min.js"></script>
		<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/jquery.actual.min.js"></script>
		<script src="assets/js/jquery.scrollTo.min.js"></script>
		<script src="assets/js/script.js"></script>
		<script src="js/utils.js"></script>
	<script type="text/javascript">
	//密码登录
	$('#to_login').click(function(){
    	$('#login_div').show();
		$('#register_div').hide();
		$('#to_register').removeClass("choosed");
		$('#to_register').addClass("unchoose");
		$('#to_login').removeClass("unchoose");
    	$('#to_login').addClass("choosed");
	});
	
	$('#to_register').click(function(){
    	$('#login_div').hide();
    	$('#login_code_div').hide();
		$('#register_div').show();
		$('#to_register').removeClass("unchoose");
		$('#to_register').addClass("choosed");
		$('#to_login').removeClass("choosed");
    	$('#to_login').addClass("unchoose");
	});
	
	$('#to_login_code').click(function(){
    	$('#login_div').hide();
    	$('#register_div').hide();
		$('#login_code_div').show();
	});
	
	$('#to_login_password').click(function(){
    	$('#login_code_div').hide();
    	$('#register_div').hide();
		$('#login_div').show();
	});
	
	$('#regist_btn').click(function(){
			var mobile=$("#re_mobile_txt").val();  
    		var username=$("#re_username_txt").val(); 
    		var password=$("#re_password_txt").val();  
    		var repassword=$("#re_repassword_txt").val();
   			var check=$("#re_check_cbx").val();
   			var code =$("#re_verification_code_txt").val(); 
   			
   			//$('mobile4rerror').text('hiuhihih');
   			//手机号
   			var mobileReg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;
   			//中文英文数字[^\u4E00-\u9FA5A-Za-z0-9]/g
   			var nameReg = /[^\u4E00-\u9FA5A-Za-z0-9]/g;
   			
   			if(mobile==""){
            	errorPlaceholder("#re_mobile","手机号不能为空");
            	return false;
             }else if(mobile.length !=11||!mobileReg.test(mobile)){
             	 errorPlaceholder("#re_mobile","手机号格式不正确");
             	 return false;
    		}
    		
    		
  			if(username.length>15||username.length<6||nameReg.test(username)){//6~15位数字汉字英文
             	errorPlaceholder("#re_username","用户名格式错误，应为6~15位数字汉字英文");
    			return false;
  			}
  			if(password.length>15||password.length<6){//6-15
             	errorPlaceholder("#re_password","密码为6-15位");
    			return false;
  			}
  			
  			if(password != repassword){//6-15
    			errorPlaceholder("#re_repassword","两次密码不一致");
    			return false;
  			}
  			
  			if(code == ""){
    			errorPlaceholder("#re_verification_code","验证码不能为空");
    			return false;
  			}
  			if(!$('#re_check_cbx').is(':checked')) {
    			alert("未同意用户协议");
    			return false;
			}
			
    		$.ajax({  
				data:"mobile=" + mobile+ 
					"&username=" + username+ 
					"&password=" +password+
					"&code=" +code,      
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
	
	$('#code_login_btn').click(function(){
			var mobile=$("#code_mobile_txt").val();  
    		var code=$("#code_verification_code_txt").val();  
    		var nologin;
    		
   			$("#code_mobile_error").hide(); 
   			$("#password_error").hide();
   			 
   			if(mobile==""){
   			 	errorPlaceholder("#code_mobile","手机号不能为空");
    			return false;
    		}
    		if(code==""){
    			errorPlaceholder("#code_verification_code","验证码不能为空");
    			return false;
  			}
    	 	
			if($('#code_nologin_cbx').is(':checked')) {
    			nologin="true"; 
			}else{
				nologin="false"; 
			}
			
    		$.ajax({  
        		data:"mobile=" + mobile + "&code=" + code+"&nologin="+nologin,      
        		type:"POST",  
     			dataType:'json',
        		url: "checkCodeLogin", 
        		error:function(data){  
           			 alert("出错了！！:");  
        		},  
        		success: function(data) { 
					if(data.success=="1"){
						//登录成功
						window.location.href ="<%=request.getContextPath()%>" + "/index";
					}else if(data.code=="-1" ){
						errorPlaceholder("#code_verification_code","验证码错误");
				}
			},
			
     	});  
	});
	
	$('#login_btn').click(function(){
			var mobile=$("#mobile_txt").val();  
    		var password=$("#password_txt").val();  
    		var nologin;
    		
   			$("#mobile_error").hide(); 
   			$("#password_error").hide();
   			 
   			if(mobile==""){
   			 	errorPlaceholder("#mobile","手机号不能为空");
    			return false;
    		}
    		if(password==""){
    			errorPlaceholder("#password","密码不能为空");
    			return false;
  			}
    	 	
			if($('#nologin_cbx').is(':checked')) {
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
	
	function getCode(type){
		var mobile=$("#"+type+"_mobile_txt").val(); 
		var mobileReg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;
   		
   		$("#re_mobile_error").hide();
   		
		if(mobile==""){
            errorPlaceholder("#"+type+"_mobile","手机号不能为空");
            return false;
         }else if(mobile.length !=11||!mobileReg.test(mobile)){
            errorPlaceholder("#"+type+"_mobile","手机号格式不正确");
            return false;
    	}
    	
    	$.ajax({  
        	data:"mobile=" + mobile,      
        	type:"POST",  
			dataType: "json",         		
			url: "getCode", 
        	error:function(data){  
           		alert("出错了！！:");  
        	},  
        	success: function(data) { 
        		if(data.success=="1"){
        			alert("成功！！:");  
        			setButtonRemainTime("#"+type+"_getcode_btn");
        		}
			},
			
     	}); 
	}
	
	function errorPlaceholder(id,String){
	/* 	$(id+"_txt").attr('placeholder',String);
		$(id+"_txt").addClass("invalid");
    	$(id+"_txt").removeClass("valid"); */
    	$(id+"_error").text(String);
    	$(id+"_error").show();  
	
	}
	
	

	</script>

	</body>
</html>
