<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
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

		<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">
	<!-- Salvattore -->
	<link rel="stylesheet" href="css/salvattore.css">
	<!-- Theme Style -->
	<link rel="stylesheet" href="css/style.css">
	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>

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
						<a href="<%=basePath%>myMessage"><i class="fa fa-home"></i> 个人名片</a>
					</li>
					<li>
						<a href="<%=basePath%>createPlan"><i class="fa fa-bookmark"></i> 发起邀约</a>
					</li>
					<li>
						<a href="<%=basePath%>myplans"><i class="fa fa-tasks"></i> 我的邀约</a>
					</li>
					<li>
						<a href="<%=basePath%>myappplans"><i class="fa fa-wordpress"></i> 我的申请</a>
					</li>
					<li>
						<a href="#parallax"><i class="fa fa-heart"></i> 撰写游记</a>
					</li>
					<li>
						<a href="#testimonials"><i class="fa fa-thumbs-up"></i> Testimonials</a>
					</li>
					<li>
						<a href="#contact"><i class="fa fa-phone-square"></i> Contact</a>
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
		<div id="wrapper">
			<div id="header" class="content-block header-wrapper">
				<div class="header-wrapper-inner">
					<section class="top solid-plan clearfix">
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
<div id="fh5co-main">
		<div class="container">

			<div class="row">

        <div id="fh5co-board" data-columns>

        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_1.jpg" class="image-popup fh5co-board-img" title="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, eos?"><img src="images/img_1.jpg" alt="Free HTML5 Bootstrap template"></a>
        		</div>
        		<div class="fh5co-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, eos?</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_2.jpg" class="image-popup fh5co-board-img"><img src="images/img_2.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Veniam voluptatum voluptas tempora debitis harum totam vitae hic quos.</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_3.jpg" class="image-popup fh5co-board-img"><img src="images/img_3.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Optio commodi quod vitae, vel, officiis similique quaerat odit dicta.</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_4.jpg" class="image-popup fh5co-board-img"><img src="images/img_4.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Dolore itaque deserunt sit, at exercitationem delectus, consequuntur quaerat sapiente.</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_5.jpg" class="image-popup fh5co-board-img"><img src="images/img_5.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Tempora distinctio inventore, nisi excepturi pariatur tempore sit quasi animi.</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_6.jpg" class="image-popup fh5co-board-img"><img src="images/img_6.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Sequi, eaque suscipit accusamus. Necessitatibus libero, unde a nesciunt repellendus!</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_7.jpg" class="image-popup fh5co-board-img"><img src="images/img_7.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Necessitatibus distinctio eos ipsam cum hic temporibus assumenda deleniti, soluta.</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_8.jpg" class="image-popup fh5co-board-img"><img src="images/img_8.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Debitis voluptatum est error nulla voluptate eum maiores animi quasi?</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_9.jpg" class="image-popup fh5co-board-img"><img src="images/img_9.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Maxime qui eius quisquam quidem quos unde consectetur accusamus adipisci!</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_21.jpg" class="image-popup fh5co-board-img"><img src="images/img_21.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Deleniti aliquid, accusantium, consectetur harum eligendi vitae quaerat reiciendis sit?</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_10.jpg" class="image-popup fh5co-board-img"><img src="images/img_10.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Incidunt, eaque et. Et odio excepturi, eveniet facilis explicabo assumenda.</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_11.jpg" class="image-popup fh5co-board-img"><img src="images/img_11.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Laborum dolores nihil voluptates quas alias distinctio fugiat tempora sit.</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_12.jpg" class="image-popup fh5co-board-img"><img src="images/img_12.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Sit, quis nulla amet numquam fugit, in reiciendis laboriosam dolor.</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_13.jpg" class="image-popup fh5co-board-img"><img src="images/img_13.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Possimus explicabo voluptatem natus nisi similique ipsa repudiandae? Quibusdam, fuga.</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_14.jpg" class="image-popup fh5co-board-img"><img src="images/img_14.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Magni repellendus iusto mollitia, quibusdam facilis incidunt. Sunt, repellat, voluptatem.</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_15.jpg" class="image-popup fh5co-board-img"><img src="images/img_15.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Unde iure rerum cupiditate explicabo quam aut vel earum numquam.</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_16.jpg" class="image-popup fh5co-board-img"><img src="images/img_16.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Qui nisi error dolorum dolor delectus, alias doloremque perspiciatis nemo.</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_18.jpg" class="image-popup fh5co-board-img"><img src="images/img_18.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Neque porro vero cumque natus nam voluptatibus, ratione, commodi labore.</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_17.jpg" class="image-popup fh5co-board-img"><img src="images/img_17.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Quisquam quia totam, sit ea maxime sint sed excepturi quod.</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_19.jpg" class="image-popup fh5co-board-img"><img src="images/img_19.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Nesciunt non iste ex nemo sapiente eum, provident nam corporis.</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_20.jpg" class="image-popup fh5co-board-img"><img src="images/img_20.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Harum repellat labore est cum ipsa, nesciunt neque mollitia adipisci?</div>
        		</div>
        	</div>
        	
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_22.jpg" class="image-popup fh5co-board-img"><img src="images/img_22.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Quos repellendus repudiandae debitis reprehenderit cupiditate cumque accusamus exercitationem, harum.</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_23.jpg" class="image-popup fh5co-board-img"><img src="images/img_23.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Sunt numquam itaque delectus, dignissimos dolorem obcaecati vel, atque eos.</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_24.jpg" class="image-popup fh5co-board-img"><img src="images/img_24.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Adipisci consequuntur ipsa fugit perspiciatis eligendi. Omnis blanditiis, totam placeat.</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_25.jpg" class="image-popup fh5co-board-img"><img src="images/img_25.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Quos repellendus repudiandae debitis reprehenderit cupiditate cumque accusamus exercitationem, harum.</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_26.jpg" class="image-popup fh5co-board-img"><img src="images/img_26.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Sunt numquam itaque delectus, dignissimos dolorem obcaecati vel, atque eos.</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_27.jpg" class="image-popup fh5co-board-img"><img src="images/img_27.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Adipisci consequuntur ipsa fugit perspiciatis eligendi. Omnis blanditiis, totam placeat.</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_28.jpg" class="image-popup fh5co-board-img"><img src="images/img_28.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Adipisci consequuntur ipsa fugit perspiciatis eligendi. Omnis blanditiis, totam placeat.</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_29.jpg" class="image-popup fh5co-board-img"><img src="images/img_29.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Adipisci consequuntur ipsa fugit perspiciatis eligendi. Omnis blanditiis, totam placeat.</div>
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="images/img_30.jpg" class="image-popup fh5co-board-img"><img src="images/img_30.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		<div class="fh5co-desc">Adipisci consequuntur ipsa fugit perspiciatis eligendi. Omnis blanditiis, totam placeat.</div>
        		</div>
        	</div>
        </div>
        </div>
       </div>
	</div>

			<div class="content-block-plans" id="blog">
				<div class="container">
					<header class="block-heading cleafix">
						<h1>出发中</h1>
					</header>
					<section class="block-body">
						<div class="row">
							<c:forEach items="${lstPlans}" var="list" varStatus="status"><%-- ${list.createtime} --%>
								<div class="col-sm-4 blog-post">
									<c:if test='${list.picpath == null}'>
											<img src="assets/images/bike_water1-1000x600.jpg">
									</c:if>
									<c:if test='${list.picpath != null}'>
											<img src="<%=request.getContextPath()%>${list.picpath}">
									</c:if>
									<a href="plandetail?id=${list.id}"><h3>${list.title}</h3></a>
									<div class="date"><fmt:formatDate value="${list.creattime}" pattern="yyyy-MM-dd"/> </div>
									<div>期望人数:${list.expectnum}/目前人数:${list.presentnum}</div>
									<p>${list.detail}</p>
								</div>
							</c:forEach>
			
						</div>
					</section>
				</div>
				<div class="container">
					<header class="block-heading cleafix">
						<h1>邀约中</h1>
					</header>
					<section class="block-body">
						<div class="row">
							<c:forEach items="${lstPlans}" var="list" varStatus="status"><%-- ${list.createtime} --%>
								<div class="col-sm-4 blog-post">
									<c:if test='${list.picpath == null}'>
											<img src="assets/images/bike_water1-1000x600.jpg">
									</c:if>
									<c:if test='${list.picpath != null}'>
											<img src="<%=request.getContextPath()%>${list.picpath}">
									</c:if>
									<a href="plandetail?id=${list.id}"><h3>${list.title}</h3></a>
									<div class="date"><fmt:formatDate value="${list.creattime}" pattern="yyyy-MM-dd"/> </div>
									<div>期望人数:${list.expectnum}/目前人数:${list.presentnum}</div>
									<p>${list.detail}</p>
								</div>
							</c:forEach>
			
						</div>
					</section>
				</div>
			</div><!-- #blog -->
			
			
			
		
			
			<div class="content-block" id="footer">
				<div class="container">
					<div class="row">
						<div class="col-xs-6">&copy; Copyright Flusk 2014</div>
					<!-- 	<div class="col-xs-6 text-right">Theme ThemeWagon.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a> More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></div>
				 -->	</div>
				</div>
			</div><!-- #footer -->

		</div><!--/#wrapper-->




		<script src="assets/js/jquery-2.1.3.min.js"></script>
		<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/jquery.actual.min.js"></script>
		<script src="assets/js/jquery.scrollTo.min.js"></script>
		<script src="assets/js/script.js"></script>
		<script src="js/datePicker/WdatePicker.js"></script>
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
	
	$('#addplan_btn').click(function(){
			var error="";
			var tag=$("#tag").val();  
			var title=$("#title").val();  
    		var departuretime=$("#departuretime").val(); 
    		var departureplace=$("#departureplace").val(); //出发时间 
    		var destination=$("#destination").val();	   //目的地
   			var expectnum=$("#expectnum").val();
   			var content=$("#content").val();
   			if(tag==""){
   				error="true";
   				$('#tag_error').show(); 
   			}else{
   				$('#tag_error').hide();
   			}
   			if(title==""){
   				error="true";
   				$('#title_error').show(); 
   				
   			}else{
   				$('#title_error').hide();
   			}
   			if(departuretime==""){
   				error="true";
   				$('#departuretime_error').show();
   			}else{
   				$('#departuretime_error').hide();
   			}
   			if(departureplace==""){
   				error="true";
   				$('#departureplace_error').show();
   			}else{
   				$('#departureplace_error').hide();
   			}
   			if(destination==""){
   				error="true";
   				$('#destination_error').show();
   			}else{
   				$('#destination_error').hide();
   			}
   			if(expectnum==""){
   				error="true";
   				$('#expectnum_error').show();
   			}else{
   				$('#expectnum_error').hide();
   			}
   			if(content==""){
   				error="true";
   				$('#content_error').show();
   			}else{
   				$('#content_error').hide();
   			}
   			
   			if(error != ""){
   				return false;
   			}
   			
   			
    		$.ajax({  
				data:$('#form').serialize(),      
        		type:"POST",  
     			datatype:'json',
        		url:"addPlan",  
        		error:function(data){  
           			 alert("出错了！！:"+data);  
        		},  
        		success:function(data){  
        			var json=JSON.parse(data);
        			if(json.success=="1"){
        				alert("創建成功"); 
        				window.location.href ="<%=request.getContextPath()%>" + "/myplans"
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
	
	function setImg(obj){//用于进行图片上传，返回地址
            var f=$(obj).val();
            if(f == null || f ==undefined || f == ''){
                return false;
            }
            if(!/\.(?:png|jpg|bmp|gif|PNG|JPG|BMP|GIF)$/.test(f))
            {
                alert("类型必须是图片(.png|jpg|bmp|gif|PNG|JPG|BMP|GIF)");
                $(obj).val('');
                return false;
            }
            var data = new FormData();
            $.each($(obj)[0].files,function(i,file){
                data.append('file', file);
            });
            $.ajax({
                type: "POST",
                url: "uploadImg.html",
                data: f,
                cache: false,
                contentType: false,    //不可缺
                processData: false,    //不可缺
                dataType:"json",
                success: function(suc) {
                    if(suc.code==0){
                            $("#thumbUrl").val(suc.message);//将地址存储好
                            $("#thumburlShow").attr("src",suc.message);//显示图片                                                              
                        }else{
                        alert("上传失败");
                        $("#url").val("");
                        $(obj).val('');
                    }
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("上传失败，请检查网络后重试");
                    $("#url").val("");
                    $(obj).val('');
                }
            });
        }
	</script>
	</body>
</html>
