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
		<jsp:include   page="sidebar.jsp" flush="true"/>
		<div id="wrapper">
			<jsp:include   page="header.jsp" flush="true"/>

			<div class="content-block" id="contact">
				<div class="login-container text-center">
					<header class="block-heading cleafix">
						<div class="icon">
							<img id="pic" src="<%=request.getContextPath()%>${users.iconpath}">
						</div>
							<p>${users.name}</p>
							<p>travel alone not lonely</p>
					</header>
					<section class="block-body-user">
						<div class="row">
							<div class="col-md-6 col-md-offset-3-user-left">
								<h1>个人信息</h1>
								    <div class="form-group">
								    	<label class="lable-user">阶级：</label>
								    	${users.score}
								    </div>
								    <div class="form-group">
								    	<label class="lable-user">积分：</label>
								    	${users.score}
								    </div>
								    <div class="form-group">
								   		<label class="lable-user">签名：</label>
								    	${users.score}
								    </div>
								  	
							</div>
							<div class="col-md-6 col-md-offset-3-user-left">
								<div class="pie"> <div  id="mountNode"></div></div>
							</div>
							<hr>
						</div>
					</section>
						
			</div><!-- #contact -->
			<div class="container">
				<h1>邀约信息 </h1>
					<h2>
						邀约中
						<a href="allPlans?type=0&page=1&id=${users.id}" class="btn btn-o-white btn-lg pull-right">查看更多</a>
					</h2>
        			<div id="fh5co-board" data-columns>
					<c:forEach items="${lstPlans0}" var="list" varStatus="status">
        				<div class="item">
        					<div class="animate-box">
	        					<c:if test='${list.picpath == null}'>
									<a href="assets/images/bike_water1-1000x600.jpg" class="image-popup fh5co-board-img" title="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, eos?">
										<img src="assets/images/bike_water1-1000x600.jpg" alt="Free HTML5 Bootstrap template">
							   		</a>
								</c:if>
								<c:if test='${list.picpath != null}'>
									<a href="<%=request.getContextPath()%>${list.picpath}" class="image-popup fh5co-board-img" title="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, eos?">
										<img src="<%=request.getContextPath()%>${list.picpath}">
									</a>
								</c:if>
        					</div>
        					<div class="fh5co-desc">
        						<a href="plandetail?id=${list.id}">
        							<h3>${list.title}</h3>
        						</a>
								<div class="date">
									<fmt:formatDate value="${list.creattime}" pattern="yyyy-MM-dd"/> </div>
									<div>期望人数:${list.expectnum}/目前人数:${list.presentnum}</div>
									<p>${list.detail}</p>
        						</div>
        					</div>
        			</c:forEach>
        		</div>
        		
       </div>
       <div class="container">
			<h2>
				出游中
				<a href="allPlans?type=0&page=1" class="btn btn-o-white btn-lg pull-right">查看更多</a>
			</h2>
        	<div id="fh5co-board" data-columns>
				<c:forEach items="${lstPlans1}" var="list" varStatus="status">
        			<div class="item">
        				<div class="animate-box">
	        				<c:if test='${list.picpath == null}'>
								<a href="assets/images/bike_water1-1000x600.jpg" class="image-popup fh5co-board-img" title="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, eos?">
									<img src="assets/images/bike_water1-1000x600.jpg" alt="Free HTML5 Bootstrap template">
							   	</a>
							</c:if>
							<c:if test='${list.picpath != null}'>
								<a href="<%=request.getContextPath()%>${list.picpath}" class="image-popup fh5co-board-img" title="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, eos?">
									<img src="<%=request.getContextPath()%>${list.picpath}">
								</a>
							</c:if>
        				</div>
        				<div class="fh5co-desc">
        					<a href="plandetail?id=${list.id}">
        						<h3>${list.title}</h3>
        					</a>
							<div class="date">
								<fmt:formatDate value="${list.creattime}" pattern="yyyy-MM-dd"/> </div>
							<div>期望人数:${list.expectnum}/目前人数:${list.presentnum}</div>
							<p>${list.detail}</p>
        				</div>
        			</div>
        		</c:forEach>
        	</div>
       </div>
            <div class="container">
			<h2>
				已结束
			</h2>
        	<div id="fh5co-board" data-columns>
				<c:forEach items="${lstPlans2}" var="list" varStatus="status">
        			<div class="item">
        				<div class="animate-box">
	        				<c:if test='${list.picpath == null}'>
								<a href="assets/images/bike_water1-1000x600.jpg" class="image-popup fh5co-board-img" title="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, eos?">
									<img src="assets/images/bike_water1-1000x600.jpg" alt="Free HTML5 Bootstrap template">
							   	</a>
							</c:if>
							<c:if test='${list.picpath != null}'>
								<a href="<%=request.getContextPath()%>${list.picpath}" class="image-popup fh5co-board-img" title="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, eos?">
									<img src="<%=request.getContextPath()%>${list.picpath}">
								</a>
							</c:if>
        				</div>
        				<div class="fh5co-desc">
        					<a href="plandetail?id=${list.id}">
        						<h3>${list.title}</h3>
        					</a>
							<div class="date">
								<fmt:formatDate value="${list.creattime}" pattern="yyyy-MM-dd"/> </div>
							<div>期望人数:${list.expectnum}/目前人数:${list.presentnum}</div>
							<p>${list.detail}</p>
        				</div>
        			</div>
        		</c:forEach>
        	</div>
       </div>
		</div><!--/#wrapper-->
		<jsp:include   page="footer.jsp" flush="true"/>
		</div>




		<script src="assets/js/jquery-2.1.3.min.js"></script>
		<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/jquery.actual.min.js"></script>
		<script src="assets/js/jquery.scrollTo.min.js"></script>
		<script src="assets/js/script.js"></script>
	<!--自定义饼图  -->
		
	<!--G2  -->
		<script src="https://gw.alipayobjects.com/os/antv/assets/g2/3.0.12/g2.min.js"></script>
		<script src="https://gw.alipayobjects.com/os/antv/assets/data-set/0.8.7/data-set.min.js"></script>
	<!--瀑布流  -->
		<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
		<!-- jQuery Easing -->
		<script src="js/jquery.easing.1.3.js"></script>
		<!-- Bootstrap -->
		<script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>
		<!-- Waypoints -->
		<script src="js/jquery.waypoints.min.js"></script>
		<!-- Magnific Popup -->
		<script src="js/jquery.magnific-popup.min.js"></script>
		<!-- Salvattore -->
		<script src="js/salvattore.min.js"></script>
		<!-- Main JS -->
		<script src="js/main.js"></script>
		<script src="js/paging.js"></script>
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
                 $('#telemoble_error').removeAttr("style");
                 $('#telemoble_error').text("不能为空");
                 error="true";
             }else if(telemoble.length !=11||!mobileReg.test(telemoble)){
                 $('#telemoble_error').removeAttr("style");
                 $('#telemoble_error').text("手机号格式不正确");
             	 error="true";
    		}
    		
    		if(email==""){
                 $('#email_error').removeAttr("style");
                 $('#email_error').text("不能为空");
                 error="true";
             }else if(email !=""){
                 if(!emailReg.test(email)){
             	 	$('#email_error').removeAttr("style");
             	 	
					$('#email_error').removeAttr("style");
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
        			console.log("data",data);
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
    		
    		var originALPassword=$("#original_password").val(); 
			var password=$("#password").val();  
    		var repassword=$("#repassword").val(); 
    		var error=""; 
    		
    		$('#original_password_error').hide();
    		$('#repassword_error').hide();
    		$('#password_error').hide();
    		
    		if(originALPassword==""){
    			$('#original_password_error').removeAttr("style");
    			$('#original_password_error').text(" 不能为空");
    			error="true";
    		}
    		
    		if(password==""){
    			$('#password_error').removeAttr("style");
    			$('#password_error').text(" 不能为空");
    			error="true";
    		}
    		if(password.length>15||password.length<6){//6-15
    			$('#password_error').removeAttr("style");
    			$('#password_error').text(" 密码为6-15位");
    			error="true";
  			}
  			if(password != repassword){//6-15
    			$('#repassword_error').removeAttr("style");
    			$('#repassword_error').text(" 两次密码不一致");
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
        			console.log("data",json);
        			console.log("json.password",json.password);
        			if(json.success=="1"){
        				alert("修改成功"); 
        				$("#repassword").val(""); 
						$("#password").val("");  
    					$("#original_password").val("");
        			}else if(json.password=="f"){
        				$('#original_password_error').removeAttr("style");
    					$('#original_password_error').text(" 密码错误");
        					
        			}else{
        				alert("修改失败"); 
        			}
        	}  
     	});  
    });
    
     $("#doCertification").click(function () {  
            var formData = new FormData($('#uploadForm')[0]);  
            $.ajax({  
                type: 'post',  
                url: "doCertification",  
                data: formData,  
                cache: false,  
                dataType: "json", 
                processData: false,  
                contentType: false,  
            }).success(function (data) {  
                if(data.success=="true"){
                	$("#picpath").val(data.path);
                	$("#certification").val("验证通过");
                	$('#doCertification').hide();
                	$('#uploadForm').hide();
                }else{
                	alert("验证失败请重试"); 
                	$("#certification").val("验证失败请重试");
                }
            }).error(function () {  
                alert("上传失败");  
            });  
        }); 
       
        $("#uploadUserIcon").click(function () {  
            var formData = new FormData($('#uploadUserIconForm')[0]);  
            $.ajax({  
                type: 'post',  
                url: "uploadUserIcon",  
                data: formData,  
                cache: false,  
                dataType: "json", 
                processData: false,  
                contentType: false,  
            }).success(function (data) {  
                if(data.success=="true"){
                	$("#pic").attr("src","<%=request.getContextPath()%>"+data.path);
                }else{
                	alert("验证失败请重试"); 
                }
            }).error(function () {  
                alert("上传失败");  
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

	
<script>


'use strict';

var _DataSet = DataSet,
    DataView = _DataSet.DataView;

var data = [
	{ item: '邀约中', count: ${users.type0num} }, 
	{ item: '已出行', count: ${users.type1num} }, 
	{ item: '已结束', count: ${users.type2num} },
	{ item: '取消', count: ${users.typefnum} }];
	var total=${users.type0num}+${users.type1num}+${users.type2num}+${users.typefnum};
var dv = new DataView();

dv.source(data).transform({
  type: 'percent',
  field: 'count',
  dimension: 'item',
  as: 'percent'
});
var chart = new G2.Chart({
  container: 'mountNode',
    forceFit: true,
  width: 300,
  height: 300
  
});
chart.source(dv, {
  percent: {
    formatter: function formatter(val) {
      val=val * 100;
      val =val.toFixed(2)  + '%';
      return val;
    }
  }
});
chart.coord('theta', {
  radius: 0.6
});
chart.tooltip({
  showTitle: false,
  itemTpl: '<li><span style="background-color:rgba(0,0,0,0);" class="g2-tooltip-marker"></span>{name}: {value}</li>'
});
chart.intervalStack()
	.position('percent')
		.color('item')
			.label('percent', {
 				formatter: 
 					function formatter(val, item) {
 						console.log("item:",item);
   	 					return item.point.item + ': ' + val+'|'+ item.point.count+'\\'+total;
 				 	}, 
 				 textStyle: {
    				fill: '#fff', // 文本的颜色
    				fontSize: '12', // 文本大小
    				fontWeight: 'bold' // 文本粗细
  } 
 				 }
 			 )
 				 .tooltip('item*percent', function (item, percent) {
  					percent=percent * 100;
  					percent =percent.toFixed(2)  + '%';
 					 return {
    					name: item,
    					value: percent
  					};
				})
				.style({
  					lineWidth: 1,
  					stroke: '#fff'
				});

chart.legend({
  title: null, // 不展示图例的标题
  marker: 'square', // 设置图例 marker 的显示样式
  textStyle:{fill: '#fff'}
});
chart.render();
</script>
	</body>
</html>
