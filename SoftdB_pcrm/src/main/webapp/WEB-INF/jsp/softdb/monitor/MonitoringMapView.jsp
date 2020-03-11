<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta http-equiv="content-language" content="ko">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
  <meta name="author" content="GeeksLabs">
  <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">

  <title>평택시청 PCRM</title>

  <%@include file="MonitoringIncHead.jsp" %>
  
</head>
<body>
<div id="wrap">
<section id="container" class="sidebar-closed">

    <%@include file="MonitoringIncHeaderSide.jsp" %>
    
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
      
      	<div class="row">
          <div class="col-lg-12">
            <ol class="breadcrumb" style="height:50px"> <h3 class="page-header"><i class="fa fa-laptop"></i> Dashboard</h3></ol>
          </div>
        </div>
      
        <div class="row">
        
        	<!--  왼쪽 -->
        	<div class="col-lg-4 col-md-12">
	        	
	        	<div class="panel panel-default">
	              
	              <div class="panel-heading">
	                <h2><i class="fa fa-flag-o red"></i><strong style="">오늘의 민원 상세</strong></h2>
	                <div class="panel-actions">
	                </div>
	              </div>
	              
	              <div class="panel-body-map" style="height:140px;">
	              
	              	<div class="air_wrap">
						<div class="todayInfo today_bg" style="
						background-image: URL('<c:url value='/'/>softdb/img/info_bg.png');
						background-size: cover;
						background-position: 3px 3px;
						background-position-x: center;
						background-repeat: no-repeat;
						height: 100%;
						width: 100%;
						">
					
							<p class="today">
							<span id="air_year">2020.</span>
							<span class="date" id="air_date">01.17</span>
							<span class="time" id="air_time">10시</span> 기준
							</p>
						
							<div class="air_info" id="bj_air_info">
								<p class="info">오늘의 <span class="spot" id="air_name"> 비전1동</span> 민원현황</p>
								<ul>
									<li></li>
									<li>&nbsp;</li>
								</ul>
							</div>
						</div>
						
						<div class="row"> <br> </div>
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					            <div class="info-box brown-bg">
									<i class="fa fa-phone"></i>
									<div class="count" style="color:black">2,674</div>
									<br>
									<div class="title">전체 민원 수</div>
					            </div>
					            <!--/.info-box-->
					          </div>
					          <!--/.col-->
				
					          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					            <div class="info-box green-bg">
									<i class="fa fa-comments-o"></i>
									<div class="count" style="color:black">538</div>
									<br>
									<div id="air_name2" class="title">비전1동</div>
					            </div>
					            <!--/.info-box-->
					          </div>
				          	<!--/.col-->
				          	</div>
          	
	              	</div>
	              	
              	</div>
              	<!-- // body map -->
          
              
              <div class="panel-body">
              
	              <div class="row"> <br> </div>
	              <div class="row"> <br> </div>
	              
                <table class="table bootstrap-datatable countries">
                  
                  <thead>
                    <tr>
                      <th></th>
                      <th>분류</th>
                      <th>전체 콜수</th>
                      <th>지역 콜수</th>
                      <th style="width: 30%"></th>
                    </tr>
                  </thead>
                  
                  <tbody>
                    <tr>
                      <%-- <td><img src="<c:url value='/'/>bootstrap/img/Germany.png" style="height:18px; margin-top:-2px;"></td> --%>
                      <td class="grid_td"><i class="fa fa-car"></i></td>
                      <td>주정차</td>
                      <td>2563</td>
                      <td>1025</td>
                      <td>
                        <div class="progress">
						  <div class="progress-bar progress-bar-striped" role="progressbar"
						  aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:40%">
						    40%
						  </div>
						</div>
                      </td>
                    </tr>
                    <tr>
                      <td class="grid_td"><i class="fa fa-tint"></i></td>
                      <td>상하수도</td>
                      <td>3652</td>
                      <td>2563</td>
                      <td>
                        <div class="progress">
						  <div class="progress-bar progress-bar-striped progress-bar-success" role="progressbar"
						  aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:57%">
						    57%
						  </div>
						</div>
                      </td>
                    </tr>
                    <tr>
                      <td class="grid_td"><i class="fa fa-won"></i></td>
                      <td>지방세</td>
                      <td>562</td>
                      <td>452</td>
                      <td>
                        <div class="progress">
						  <div class="progress-bar progress-bar-striped progress-bar-info" role="progressbar"
						  aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:93%">
						    57%
						  </div>
						</div>
                      </td>
                    </tr>
                    <tr>
                      <td class="grid_td"><i class="fa fa-mortar-board"></i></td>
                      <td>교육행정</td>
                      <td>1258</td>
                      <td>958</td>
                      <td>
                        <div class="progress">
						  <div class="progress-bar progress-bar-striped progress-bar-warning" role="progressbar"
						  aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:33%">
						    33%
						  </div>
						</div>
                      </td>
                    </tr>
                    <tr>
                      <td class="grid_td"><i class="fa fa-sort-amount-desc"></i></td>
                      <td>기타</td>
                      <td>4856</td>
                      <td>3621</td>
                      <td>
                        <div class="progress">
						  <div class="progress-bar progress-bar-striped progress-bar-danger" role="progressbar"
						  aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:20%">
						    20%
						  </div>
						</div>
                      </td>
                    </tr>
                    
                  </tbody>
                  
                </table>
              
              </div>
              <!-- // panel-body -->
              

            </div>

          </div>
          <!--  // 왼쪽 -->
          
        
          <!--  오른쪽 -->
        	<div class="col-lg-8 col-md-12">
				<div style="width:1200px">
				
		            <div class="panel panel-default">
		              
		              <div class="panel-heading">
		                <h2><i class="fa fa-map-marker red"></i><strong>평택시 전도</strong></h2>
		                <div class="panel-actions">
		                </div>
		              </div>
		              
		              <div class="panel-body-map" style="height:730px;">
		                	<!-- <div id="map" style="height:380px;"></div> -->
		                	<div id="ptcityMap" style="
							background-image: URL('<c:url value='/'/>softdb/img/pycity.svg.png');
							background-size: cover;
							background-position: 3px 3px;
							background-position-x: center;
							background-position-y: center;
							background-repeat: no-repeat;
							height: 100%;
							width: 100%;
							">
								<div style="position: absolute;">
									<div style="position: relative; top: 10px; left: 10px;">
										<img src="<c:url value='/'/>softdb/img/img_ptcity_logo.jpg" style="width:130px">
									</div>
								</div>
								
								<div id="a01" style="position: absolute;"></div>
								<div id="a02" style="position: absolute;"></div>
								<div id="a03" style="position: absolute;"></div>
								<div id="a04" style="position: absolute;"></div>
								<div id="a05" style="position: absolute;"></div>
								<div id="a06" style="position: absolute;"></div>
								<div id="a07" style="position: absolute;"></div>
								<div id="a08" style="position: absolute;"></div>
								<div id="a09" style="position: absolute;"></div>
								<div id="a10" style="position: absolute;"></div>
								<div id="a11" style="position: absolute;"></div>
								<div id="a12" style="position: absolute;"></div>
								<div id="a13" style="position: absolute;"></div>
								<div id="a14" style="position: absolute;"></div>
								<div id="a15" style="position: absolute;"></div>
								<div id="a16" style="position: absolute;"></div>
								<div id="a17" style="position: absolute;"></div>
								<div id="a18" style="position: absolute;"></div>
								<div id="a19" style="position: absolute;"></div>
								<div id="a20" style="position: absolute;"></div>
								<div id="a21" style="position: absolute;"></div>
								<div id="a22" style="position: absolute;"></div>
								<div id="a23" style="position: absolute;"></div>
							</div>
		              </div>
		              
		          </div>
          	</div>
          </div>
          <!--  // 오른쪽 -->
          
        </div>
		<!--  // row -->
	
	  </section>
	  <!-- // wrapper -->
	
    </section>
    <!--main content end-->
    
</section>
<!-- container section start -->

<form id="subForm" action="${pageContext.request.contextPath}/monitor/detailMain.do" method="post">
	<input type="hidden" id="subId" name="subId" value=""/>
</form>

<%@include file="MonitoringIncFooterJs.jsp" %>
    
    <script>

      //carousel
      $(document).ready(function() {
        $("#owl-slider").owlCarousel({
          navigation: true,
          slideSpeed: 300,
          paginationSpeed: 400,
          singleItem: true
        });
      });

      //custom select box

      $(function() {
        $('select.styled').customSelect();
      });

function getLoc(id) {
	sigungu = id;
	for(var i=0; i<sigunguArr.length; i++) {
		if(id == sigunguArr[i].id) {
			sigunguName = sigunguArr[i].name;
			break;
		}
	}
	dataLoad();
	$("#subId").val(id);
}

var markerHtml = '<div style="position: relative; top: $yy1px; left: $xx1px;">' 
	+ '<img src="<c:url value="/"/>softdb/img/google-marker-$marker.png" style="width:$widpx"></img></div>'
	+ '<div onclick="javascript:getLoc(\'$id\')" style="position: relative; top: $yy2px; left: $xx2px; font-weight:bold; font-size: $fsizepx; color:black; text-align: center;">'
	+ '<p>$cnt</p></div>';
	
function getMarkerDiv(id, xx, yy, cnt) {
	var count = (cnt) ? cnt : '';
	
	if(count < 1) {
		return '';
	}
	if(count < 10) {
		return markerHtml.replace('$xx1', xx+8 ).replace('$yy1', yy-38 )
		.replace('$xx2', xx+8 ).replace('$yy2', yy-75 )
		.replace('$marker', 'w').replace('$id', id)
		.replace('$wid', 25).replace('$fsize', 17 )
		.replace('$cnt', (count > 99) ? '99+' : count);
	} 
	if(count > 99) {
		return markerHtml.replace('$xx1', xx).replace('$yy1', yy-80 )
		.replace('$xx2', xx).replace('$yy2', yy-150 )
		.replace('$marker', 'r').replace('$id', id)
		.replace('$wid', 50).replace('$fsize', 22 )
		.replace('$cnt', (count > 99) ? '99+' : count);
	}
	else {
		return markerHtml.replace('$xx1', xx).replace('$yy1', yy-60 )
			.replace('$xx2', xx).replace('$yy2', yy-115 )
			.replace('$marker', 'w').replace('$id', id)
			.replace('$wid', 40).replace('$fsize', 22 )
			.replace('$cnt', (count > 99) ? '99+' : count);
	}
}

function dataLoad() {
	var nowDate = new Date();
	$("#air_year").text( nowDate.getFullYear() + '.');
	var temp = nowDate.getMonth() + 1;
	if(temp < 10 ) {
		$("#air_date").text( '0' + temp +'.'+ nowDate.getDate());
	}
	else {
		$("#air_date").text( temp +'.'+ nowDate.getDate());
	}
	
	temp = nowDate.getHours();
	var str = '';
	if(temp < 10) {
		str = '0' + temp;
	}
	else {
		str = '' + temp;
	}
	temp = nowDate.getMinutes();
	if(temp < 10) {
		str += ':0' + temp;
	}
	else {
		str += ':' + temp;
	}
	$("#air_time").text( str );
	
	$("#air_name").text( sigunguName );
	$("#air_name2").text( sigunguName );
	
	for(var i=0; i<sigunguArr.length; i++) {
 		$("#" + sigunguArr[i].id).empty();
 	}
	
		$.ajax({
			url : '${pageContext.request.contextPath}/monitor/ajaxRtData.do'
			, data : { 'sigungu' : sigungu}
			, type: 'post'
			, dataType: "json"
			, success: function(result) {
				console.log('> success ', result);
				showMarker();
			}
			, error: function(data) {
				console.log('> error ', data);
			}
	    });
}

var idx = 0;
function showMarker() {
	$("#" + sigunguArr[idx].id).append( 
			getMarkerDiv(sigunguArr[idx].id, sigunguArr[idx].xx, sigunguArr[idx].yy, 2 + (idx*5) ) 
	);
	idx ++;
	if(idx < sigunguArr.length) {
		setTimeout(function() {
			showMarker();
		}, 50);
	} 
	else {
		idx = 0;
	}
}

var sigungu = '';
var sigunguName = '';
var sigunguArr = [
		{id: "a01", name: "포승읍", xx:290, yy:495}
		, {id: "a02", name: "청북읍", xx:486, yy:295}
		, {id: "a03", name: "안중읍", xx:492, yy:470}
		, {id: "a04", name: "현덕면", xx:485, yy:620}
		, {id: "a05", name: "오성면", xx:640, yy:430}
		, {id: "a06", name: "서탄면", xx:720, yy:100}
		, {id: "a07", name: "고덕면", xx:740, yy:310}
		, {id: "a08", name: "팽성읍", xx:760, yy:570}
		, {id: "a09", name: "신장1동", xx:800, yy:145}
		, {id: "a10", name: "신장2동", xx:760, yy:190}
		, {id: "a11", name: "지산동", xx:840, yy:180}
		, {id: "a12", name: "서정동", xx:810, yy:210}
		, {id: "a13", name: "중앙동", xx:840, yy:265}
		, {id: "a14", name: "세교동", xx:860, yy:400}
		, {id: "a15", name: "원평동", xx:850, yy:470}
		, {id: "a16", name: "동북동", xx:900, yy:445}
		, {id: "a17", name: "송북동", xx:865, yy:175}
		, {id: "a18", name: "진위면", xx:890, yy:80}
		, {id: "a19", name: "비전1동", xx:980, yy:410}
		, {id: "a20", name: "비전2동", xx:940, yy:455}
		, {id: "a21", name: "신평동", xx:930, yy:510}
		, {id: "a22", name: "용이동", xx:1030, yy:440}
		, {id: "a23", name: "송탄동", xx:950, yy:290}
];

// 지도 위에 마커 그리기
$(function() {
	
	getLoc('a19');
	
 	setInterval(function() {
 		dataLoad();
 	}, 5000);
});

$("tr").click(function() {
	$("#subForm").submit();
});
    </script>

</body>

</html>