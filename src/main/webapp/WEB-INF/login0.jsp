<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"  />
<title>无标题文档</title>
<script type="text/javascript" src="http://www.51mokao.com/js/jquery-1.4.1.js"></script>
<link  rel="stylesheet" type="text/css" href="css/Login.css"/>
<script type="text/javascript">
	$(function(){
	
		$('.Login_title div').click(function(){
			var index=$(this).index();
			$('.Login_title div').removeClass('check');
			$(this).addClass('check');
			$('.ipt>div').eq(index).show().siblings().hide();
			
		});
		$('#Login_btn').click(function(){
			var winHeight=document.body.offsetHeight;
			$('#tc').css('height',winHeight);
			$('#Login').show();
		});
		//注销
		$('#LoginOut_btn').click(function(){
			var winHeight=document.body.offsetHeight;
			$('#head-user').show();
			$('#logined-user').hide();
		});
		$('.tc').click(function(){
			$('.Login_zhuc').hide();
		});
		$('.close').click(function(){
			$('.Login_zhuc').hide();
			$('.register').hide();
		});
		$('.register_title div').click(function(){
			var index=$(this).index();
			$('.register_title div').removeClass('check');
			$(this).addClass('check');
			$('.reg_ipt>div').eq(index).show().siblings().hide();
		});
		$('#register_btn').click(function(){
			var winHeight=document.body.offsetHeight;
			$('#tc').css('height',winHeight);
			$('.register').show();
		});
		$('.tc').click(function(){
			$('.register').hide();
		});
			//密码登录
		$('#login_btn').click(function(){
			var mobile_l=$("#mobile_l").val();  
    		var password_l=$("#password_l").val();  
    		var code_l=$("#code_l").val();  
    		var nologin;
   
   			if(mobile_l==""){
    			alert("用户名不能为空");
    			return false;
    		}
    		if(password_l==""){
    			alert("密码不能为空");
    			return false;
  			}
    	 	if(code_l!="fossil"){
    			alert("验证码错误");
    			return false;
    		}
    		
			if($('#nologin').is(':checked')) {
    			nologin="true"; 
			}else{
				nologin="false"; 
			}
			
    		$.ajax({  
        		data:"mobile_l=" + mobile_l + "&password_l=" + password_l+ "&nologin=" + nologin,      
        		type:"POST",  
     			datatype:'json',
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
			error: function(data) { 
				alert("调用失败...."); 
			}
     	});  
	});
	//注册
	//验证码登录
		$('#loginn_btn').click(function(){
			var mobile_ln=$("#mobile_ln").val();  
    		var codebySMS_ln=$("#codebySMS_ln").val();  
    		var code_ln=$("#code_ln").val();  
   			var mobileReg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;
   			if(mobile_ln==""){
    			alert("手机号不能为空");
    			return false;
    		}else if(mobile_ln.length !=11||!mobileReg.test(mobile_ln)){
             	 alert("手机号格式不正确");
             	 return false;
    		}
    		if(code_ln!="fossil"){
    			alert("验证码错误");
    			return false;
    		}
    		if(codebySMS_ln!="888"){
    			alert("短信验证失败");
    			return false;
  			}
    		$.ajax({  
        		data:"mobile_ln=" + mobile_ln,      
        		type:"POST",  
     			datatype:'json',
        		url:"checkLoginn",  
        		error:function(data){  
           			 alert("出错了！！:");  
        		},  
        		success:function(data){  
        			var json=JSON.parse(data);
					if(json.msg=="true"){
						//登录成功
						window.location.href ="" +  "/index";
					}else if(json.msg=="new"){
						window.location.href ="<%=request.getContextPath()%>" +  "/index";
					}else{
						alert("系统繁忙");
        		}
        	}  
     	});  
	});
	//手机号注册验证
		$('#registerbym_btn').click(function(){
			var mobile_rm=$("#mobile_rm").val();  
    		var code_rm=$("#code_rm").val();  
    		var codebySMS_rm=$("#codebySMS_rm").val(); 
    		var name_rm=$("#name_rm").val(); 
    		var password_rm=$("#password_rm").val();  
   			var check_rm=$("#check_rm").val();
   			//手机号
   			var mobileReg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;
   			//中文英文数字[^\u4E00-\u9FA5A-Za-z0-9]/g
   			var nameReg = /[^\u4E00-\u9FA5A-Za-z0-9]/g;
   			if(mobile_rm==""){
                 alert("手机号不能为空");
                 return false;
             }else if(mobile_rm.length !=11||!mobileReg.test(mobile_rm)){
              	 var errorMsg = '手机号格式不正确.';
                // $('#mobile_rm').append('<span class="formtips onError">'+errorMsg+'</span>');
             	 alert("手机号格式不正确");
             	 return false;
    		}
    		if(code_rm!="fossil"){
    			alert("验证码错误");
    			return false;
    		}
  			if(codebySMS_rm!="888"){
    			alert("短信验证失败");
    			return false;
  			}
  			if(name_rm.length>15||name_rm.length<6||nameReg.test(name_rm)){//6~15位数字汉字英文
    			alert("用户名格式错误，应为6~15位数字汉字英文");
    			return false;
  			}
  			if(password_rm.length>15||password_rm.length<6){//6-15
    			alert("密码为6-15位");
    			return false;
  			}
  			if(!$('#check_rm').is(':checked')) {
    			alert("未同意用户协议");
    			return false;
			}
    		$.ajax({  
				data:"mobile_rm=" + mobile_rm+ "&name_rm=" + name_rm+ "&password_rm=" +password_rm,      
        		type:"POST",  
     			datatype:'json',
        		url:"registerByM.do",  
        		error:function(data){  
           			 alert("出错了！！:");  
        		},  
        		success:function(data){  
        			var json=JSON.parse(data);
        			if(json.msg=="new"){
        				alert("成功注册"); 
        				$('.Login_zhuc').show();
        				$('.register').hide();
        			}else if(json.msg=="em"){
        				alert("该手机号已经被占用"); 
        			}else if(json.msg=="en"){
        				alert("该用户名已经被占用"); 
        			}else{
        				alert("注册失败"+json.msg); 
        		}
        	}  
     	});  
	});
	//邮箱注册
	//邮箱注册验证
		$('#registerbye_btn').click(function(){
			var email_re=$("#email_re").val();  
    		var code_re=$("#code_re").val();  
    		var name_re=$("#name_re").val(); 
    		var password_re=$("#password_re").val();  
   			var check_re=$("#check_re").val();
   			//手机号
   			var emailReg =/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
   			//中文英文数字[^\u4E00-\u9FA5A-Za-z0-9]/g
   			var nameReg = /[^\u4E00-\u9FA5A-Za-z0-9]/g;
   			if(email_re==""){
                 alert("邮箱不能为空");
                 return false;
             }else if(!emailReg.test(email_re)){
             	 alert("邮箱格式不正确");
             	 return false;
    		}
    		if(code_re!="fossil"){
    			alert("验证码错误");
    			return false;
    		}
  			if(name_re.length>15||name_re.length<6||nameReg.test(name_re)){//6~15位数字汉字英文
    			alert("用户名格式错误");
    			return false;
  			}
  			if(password_re.length>15||password_re.length<6){//6-15
    			alert("密码为6-15位");
    			return false;
  			}
  			if(!$('#check_re').is(':checked')) {
    			alert("未用户同意协议");
    			return false;
			}
    		$.ajax({  
				data:"email_re=" + email_re+ "&name_re=" + name_re+ "&password_re=" +password_re,      
        		type:"POST",  
     			datatype:'json',
        		url:"registerByE.do",  
        		error:function(data){  
           			 alert("出错了！！:");  
        		},  
        		success:function(data){  
        			var json=JSON.parse(data);
        			if(json.msg=="new"){
        				alert("成功注册"); 
        				$('.Login_zhuc').show();
        				$('.register').hide();
        			}else if(json.msg=="fe"){
        				alert("该邮箱不存在"); 
        			}else if(json.msg=="ee"){
        				alert("该邮箱已经被占用"); 
        			}else if(json.msg=="en"){
        				alert("该用户名已经被占用"); 
        			}else{
        				alert("登陆失败"+json.msg); 
        		}
        	}  
     	});  
	});
	//
});
</script>
</head>
<body>
	<div class="header-user right-wrap" id="head-user" >
          <div class="user-nav common-icon" >
                <a href=javascript:;" id="Login_btn">登录</a>
                 <a href="javascript:;" id="register_btn">注册</a>
           </div>
      </div>
	<!--登录-->
<div class="Login_zhuc" id="Login">
	<div class="tc"></div>
		<div class="Login_all ">
		
			<!--登录title-->
			<div class="Login_title clr">
			
				<div class="user_Login check">用户登录</div>
				<div class="Key_Login ">免注册一键登录</div>
				<a href="javascript:;">注册></a>
				<a class="close" href="javascript:;">×</a>
			</div>
			<div class="clr"></div>
			<!--登录input-->
			<div class="ipt">
				<div class="Login_input">
				<form action="" method="post"> 
					<ul>
						<li>
						<label name="lable_mobile"></label>
						</li>
						<li>
							<label for="mobile_l">用户名/手机号/邮箱</label>
							<input id="mobile_l"  class="text" type="text"  name="mobile_l" onkeyup="if($(this).val()==''||$(this).val()==$(this)[0].defaultValue){$(this).parent().children('label').show();}else{$(this).parent().children('label').hide();}" onkeydown="{$(this).parent().removeClass('error'); $(this).css('color','#666');}" autocomplete="off"/>
						</li>
						<li>
							<label for="password_l" >密码</label>
							<input id="password_l" type="password" class="text" type="text" name="password_l" onkeyup="if($(this).val()==''||$(this).val()==$(this)[0].defaultValue){$(this).parent().children('label').show();}else{$(this).parent().children('label').hide();}" onkeydown="{$(this).parent().removeClass('error'); $(this).css('color','#666');}"/>
							
						</li>
						<li>
						  <div class="ver_code clr">
								<label for="code_l">验证码</label>
								<input id="code_l" type="text" name="code_l" onkeyup="if($(this).val()==''||$(this).val()==$(this)[0].defaultValue){$(this).parent().children('label').show();}else{$(this).parent().children('label').hide();}" onkeydown="{$(this).parent().removeClass('error'); $(this).css('color','#666');}" />
								<img src="img/captcha_v2.png" />
							</div>	
						</li>
					</ul>
						<div class="for_pwd clr">
							<div class="Free">
							
								<input id="nologin" name="nologin" class="chbox" type="checkbox" />
								<span>两周内免登录</span>
							</div>
							<div class="Forgot"><a href="javascript:;">忘记密码?</a></div>
						</div>
						<div class="Login_btn clr">
							<input id="login_btn" type="button" value="登录"/>
					</div>
					</form>
				</div>
				<div class="Key_Login_input clr"  style="display:none;">
					<ul>
						<li>
							<label for="mobile_ln">手机号，未注册将自动创建模考账号</label><!-- placeholder="手机号，未注册将自动创建模考账号"-->
							<input id="mobile_ln" type="text" class="tel" name="mobile_ln" onkeyup="if($(this).val()==''||$(this).val()==$(this)[0].defaultValue){$(this).parent().children('label').show();}else{$(this).parent().children('label').hide();}" onkeydown="{$(this).parent().removeClass('error'); $(this).css('color','#666');}"/>
						</li>
						<li>
							<div class="ver_code clr">
							<label for="code_ln">验证码</label>
								<input id="code_ln" type="text" name="code_ln" onkeyup="if($(this).val()==''||$(this).val()==$(this)[0].defaultValue){$(this).parent().children('label').show();}else{$(this).parent().children('label').hide();}" onkeydown="{$(this).parent().removeClass('error'); $(this).css('color','#666');}"/>
								<img src="img/captcha_v2.png" />							
								</div>
								<div class="clr"></div>
						</li>
						<li>
							<div class="mess_code clr">
								<label for="codebySMS_ln">短信验证码</label>
								<input id="codebySMS_ln" type="text" name="codebySMS_ln" onkeyup="if($(this).val()==''||$(this).val()==$(this)[0].defaultValue){$(this).parent().children('label').show();}else{$(this).parent().children('label').hide();}" onkeydown="{$(this).parent().removeClass('error'); $(this).css('color','#666');}" />
								<a href="javascript:;">获取短信验证码888</a>							
								</div>
								<div class="clr"></div>
						</li>
					</ul>
					<div class="clr"></div>
					<div class="Login_btn clr">
						<input id="loginn_btn" type="button" value="登录"/>
					</div>
				</div>
			</div>
			
			<div class="wx_other clr">
				<a class="wx" href="javascript:;">
					<i><img src="img/iconn_02.png" /></i>
					<span>微信登录</span>
				</a>
				<a class="other">其他账号登录</a>
				<div class="clr"></div>
			</div>
			
		</div>
	</div>
<!--注册-->
	<div class="register">
	<div class="tc"></div>
		<div class="register_all">
		 <form action="" method="post">
			<div class="register_title">
				<div class="user_Login check">手机注册</div>
				<div class="Key_Login">邮箱注册</div>
				<a href="javascript:;">登录></a>			
				<a class="close" href="javascript:;">×</a>
				</div>
			<div class="clr"></div>
			<div class="reg_ipt">
			<!--手机注册-->
			
				<div class="tel_res">	
					<ul>
						<li>
							<label for="mobile_rm">手机号</label>
							<input id="mobile_rm" class="text" type="text" name="mobile_rm" onkeyup="if($(this).val()==''||$(this).val()==$(this)[0].defaultValue){$(this).parent().children('label').show();}else{$(this).parent().children('label').hide();}" onkeydown="{$(this).parent().removeClass('error'); $(this).css('color','#666');}" />
						</li>
						<li>
							<div class="ver_code">
								<label for="code_rm">验证码</label>
								<input id="code_rm" type="text" placeholder=""  name="code_rm" onkeyup="if($(this).val()==''||$(this).val()==$(this)[0].defaultValue){$(this).parent().children('label').show();}else{$(this).parent().children('label').hide();}" onkeydown="{$(this).parent().removeClass('error'); $(this).css('color','#666');}"/>
								<img src="img/captcha_v2.png" />
							<div class="clr">							</div>
							</div>
						</li>
						<li>
							<div class="mess_code">
								<label for="codebySMS_rm">短信验证码</label>
								<input id="codebySMS_rm" type="text" placeholder="" name="codebySMS_rm" onkeyup="if($(this).val()==''||$(this).val()==$(this)[0].defaultValue){$(this).parent().children('label').show();}else{$(this).parent().children('label').hide();}" onkeydown="{$(this).parent().removeClass('error'); $(this).css('color','#666');}" />
								<a href="javascript:;">获取短信验证码888</a>								  </div>
								<div class="clr">							</div>
						</li>
						<li>
							<label for="name_rm">用户名6-15位数字汉字英文</label>
							<input id="name_rm" class="text" type="text" placeholder="" name="name_rm" onkeyup="if($(this).val()==''||$(this).val()==$(this)[0].defaultValue){$(this).parent().children('label').show();}else{$(this).parent().children('label').hide();}" onkeydown="{$(this).parent().removeClass('error'); $(this).css('color','#666');}"/>
						</li>
						<li>
							<label for="password_rm">密码6-15位</label>
							<input id="password_rm" class="text" type="password" placeholder="" name="password_rm" onkeyup="if($(this).val()==''||$(this).val()==$(this)[0].defaultValue){$(this).parent().children('label').show();}else{$(this).parent().children('label').hide();}" onkeydown="{$(this).parent().removeClass('error'); $(this).css('color','#666');}"/>
						</li>
					</ul>
				<div class="Free"><input id="check_rm"  type="checkbox" class="resbox" />同意51模考的《用户协议》</div>
				<div class="res_btn">
				<input id="registerbym_btn" type="button" value="注册"/>
			</div>
				</div>
			
			<!--邮箱注册-->
				<div class="email_res" style="display:none;">
					<ul>
						<li>
							<label for="email_re">邮箱</label>
							<input id="email_re" class="text" type="text" placeholder="" name="email_re"  onkeyup="if($(this).val()==''||$(this).val()==$(this)[0].defaultValue){$(this).parent().children('label').show();}else{$(this).parent().children('label').hide();}" onkeydown="{$(this).parent().removeClass('error'); $(this).css('color','#666');}"/>
						</li>
						<li>
							<div class="ver_code clr">
								<label for="code_re">验证码</label>
								<input id="code_re" type="text" placeholder="" name="code_re" onkeyup="if($(this).val()==''||$(this).val()==$(this)[0].defaultValue){$(this).parent().children('label').show();}else{$(this).parent().children('label').hide();}" onkeydown="{$(this).parent().removeClass('error'); $(this).css('color','#666');}"/>
								<img src="img/captcha_v2.png" />								</div>
								<div class="clr"></div>
						</li>
						<li>
							<label for="name_re">用户名6-15位数字汉字英文</label>
							<input id="name_re" class="text" type="text" placeholder="" name="name_re" onkeyup="if($(this).val()==''||$(this).val()==$(this)[0].defaultValue){$(this).parent().children('label').show();}else{$(this).parent().children('label').hide();}" onkeydown="{$(this).parent().removeClass('error'); $(this).css('color','#666');}"/>
						</li>
						<li>
							<label for="password_re">密码6-15位</label>
							<input id="password_re" class="text" type="password" name="password_re" onkeyup="if($(this).val()==''||$(this).val()==$(this)[0].defaultValue){$(this).parent().children('label').show();}else{$(this).parent().children('label').hide();}" onkeydown="{$(this).parent().removeClass('error'); $(this).css('color','#666');}"/>
						</li>
					</ul>
					<div class="Free"><input id="check_re"  type="checkbox" class="resbox" />同意51模考的《用户协议》</div>
						<div class="res_btn">
					<input id="registerbye_btn" type="button" value="注册"/>
			</div>
				</div>
				
			</div>
			
			<div class="res_wx">
				<a class="wx" href="javascript:;">
					<i><img src="img/iconn_02.png" /></i>
					<span>微信扫码，快速注册</span>				</a>			
			</div>
			</form>
		</div>
	</div>
</body>
</html>
