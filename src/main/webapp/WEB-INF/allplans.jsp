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
		<div id="fh5co-main">
			<div class="container">
				<div class="row">
					<h2>
						<a href="allPlans?type=0&page=1&id= ${planPage.id}" >邀约中</a> 
						<a href="allPlans?type=1&page=1&id= ${planPage.id}" >出游中</a>
						<a href="allPlans?type=2&page=1&id= ${planPage.id}" >已结束</a>
					</h2>
        			<div id="fh5co-board" data-columns>
					<c:forEach items="${planPage.lstPlans}" var="list" varStatus="status">
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
       </div>
	</div>
	<div class="box" id="box"></div>
	<jsp:include   page="footer.jsp" flush="true"/>
		</div><!--/#wrapper-->




		<script src="assets/js/jquery-2.1.3.min.js"></script>
		<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/jquery.actual.min.js"></script>
		<script src="assets/js/jquery.scrollTo.min.js"></script>
		<script src="assets/js/script.js"></script>
		<script src="js/datePicker/WdatePicker.js"></script>
			<!-- jQuery -->
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

     var setTotalCount = ${planPage.count};
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
        window.location.href ="<%=request.getContextPath()%>" + "/myplans?page="+pageIndex+"&type="+ ${planPage.type}+"&id="+ ${planPage.id};
     });
        
	</script>
	</body>
</html>
