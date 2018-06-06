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
			<link rel="stylesheet" href="css/paging.css">
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
					<h1>窝的举报</h1>
					</header>
				</div><!-- #contact -->
				<div class="container">
        			<div id="fh5co-board" data-columns>
					<c:forEach items="${reportPage.lstReports}" var="list" varStatus="status">
        				<div class="item">
        					<div class="animate-box">
	        			
        					</div>
        					<div class="fh5co-desc">
        					<a href="modifyReport?id=${list.id}">
        							<h3>${list.username}</h3>
        						</a>
								<div class="date">
									举报时间：<fmt:formatDate value="${list.creattime}" pattern="yyyy-MM-dd"/> 
								</div>
								处理结果：${list.content}
        					</div>
        				</div>
        			</c:forEach>
        		</div>
        		
       </div>
       
           	<div class="box" id="box"></div>
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
	

    

     var setTotalCount = ${reportPage.count};
        $('#box').paging({
            initPageNo: 1, // 初始页码
              totalPages: setTotalCount%10==0?(setTotalCount/10):(parseInt(setTotalCount/10)+1), //总页数
            totalCount: '合计' + setTotalCount + '条数据', // 条目总数
            slideSpeed: 600, // 缓动速度。单位毫秒
            jump: true, //是否支持跳转
            callback: function(page) { // 回调函数
                console.log(page);
            }
        })
        
     $('#pageSelect').children().click(function(){
       	pageIndex = $(this).index() + 1;
       	var type=
        window.location.href ="<%=request.getContextPath()%>" + "/myReport?page="+pageIndex;
     });
	
	</script>

	
	</body>
</html>
