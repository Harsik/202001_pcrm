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
      
<!--       	<div class="row"> -->
<!--           <div class="col-lg-12"> -->
<!--             <ol class="breadcrumb" style="height:50px"> <h3 class="page-header"><i class="fa fa-laptop"></i> Dashboard</h3></ol> -->
<!--           </div> -->
<!--         </div> -->
      
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
									<div class="count" id="totCnt" style="color:black">0</div>
									<br>
									<div class="title">전체 민원 수</div>
					            </div>
					            <!--/.info-box-->
					          </div>
					          <!--/.col-->
				
					          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					            <div class="info-box green-bg">
									<i class="fa fa-comments-o"></i>
									<div class="count" id="addrtCnt" style="color:black">0</div>
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
              
              <div class="panel-body" style="height: 590px;">
              
	              <div class="row"> <br> </div>
	              <div class="row"> <br> </div>
	              
                <table class="table bootstrap-datatable countries" id="test">
                  
                  <thead>
                    <tr>
                      <th style="width: 90px;">분류</th>
                      <th colspan="2">지역 콜수</th>
<!--                       <th style="width: 20%"></th> -->
                      <th colspan="2">전체 콜수</th>
<!--                       <th style="width: 20%"></th> -->
                    </tr>
                  </thead>
                  
                  <tbody>
					<!--
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
                    -->
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
// 	+ '<div onclick="javascript:getLoc(\'$id\')" style="position: relative; top: $yy2px; left: $xx2px; font-weight:bold; font-size: $fsizepx; color:black; text-align: center;">'
	+ '<div onclick="javascript:btn_OnClick(\'$id\');" ondblclick="btn_OnDbClick();" style="position: relative; top: $yy2px; left: $xx2px; font-weight:bold; font-size: $fsizepx; color:black; text-align: center;">'
	+ '<p>$cnt</p></div>';
	
function getMarkerDiv(id, xx, yy, cnt) {
	var count = (cnt) ? cnt : '';
	
	if(count < 1) {
		return '';
	}
	/*
	if(count < 10) {
		return markerHtml.replace('$xx1', xx+8 ).replace('$yy1', yy-38 )
		.replace('$xx2', xx+8 ).replace('$yy2', yy-75 )
		.replace('$marker', 'w').replace('$id', id)
		.replace('$wid', 25).replace('$fsize', 17 )
		.replace('$cnt', (count > 99) ? '99+' : count);
	} 
	*/
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
	var nowDay = nowDate.getDate();
	if(nowDay<10){
		nowDay = '0'+nowDay;
	}
	if(temp < 10 ) {
		$("#air_date").text( '0' + temp +'.'+ nowDay);
	}
	else {
		$("#air_date").text( temp +'.'+ nowDay);
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
				var idx = 0;
				for(var i=0; i<sigunguArr.length; i++){
					for(var j=0; j<result.result.length; j++){
						// Chrome Version
// 						var idx = sigunguArr.findIndex(obj => obj.name == result.result[j].hAddr);
						// IE Version - IE에선 findIndex 지원하지 않는다.
						sigunguArr.some(function(el, i) {
						    if (el.name == result.result[j].hAddr) {
						        idx = i;
						        return true;
						    }else{
						    	idx = -1;
						    }
						});
						
						if(idx != -1) {sigunguArr[idx].cnt = result.result[j].cnt;}
					}
				}
				// Chrome Version
// 				var idx = sigunguArr.findIndex(obj => obj.id == $("#subId").val()); 
				// IE Version - IE에선 findIndex 지원하지 않는다.
				var idx2 = 0;
				sigunguArr.some(function(el, i) {
					if (el.id == $("#subId").val()) {
						idx2 = i;
					    return true;
					}
				});
				$("#addrtCnt").html(sigunguArr[idx2].cnt);  //지역 카운트
				
				$("#totCnt").html(result.result.slice(-1)[0].cnt);  //합계 카운드
				showCtgList();
				showMarker();
			}
			, error: function(data) {
				console.log('> error ', data);
			}
	    });
		
		
}

//카테고리별
function showCtgList(){
	$("#test > tbody").html("");
	$.ajax({
		url : '${pageContext.request.contextPath}/monitor/ajaxCtgList.do'
		, data : { 'sigungu' : sigungu}
		, type: 'post'
		, dataType: "json"
		, success: function(result) {
			console.log('> showCtgList ', result);
			var results = result.ctgList;
// 			var str = '<TR>';
			var str = "";
            $.each(results , function(i){
            	str += '<TR>';
// 				str += '<TD class="grid_td"></TD>';
				str += '<TD>' + results[i].ctgLgNm + '</TD>';
				str += '<TD style="width: 60px;">' + results[i].addrCnt + '</TD>';
				str += '<TD>';
				str += '<div class="progress">';
				str += '<div class="progress-bar progress-bar-striped progress-bar-info" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="color:#000000; width:'+results[i].addrPcnt+'%">';
				str += results[i].addrPcnt;
				str += '%</div></div>';
				str += '</TD>';
				str += '<TD style="width: 60px;">' + results[i].totCnt + '</TD>';
				str += '<TD>';
				str += '<div class="progress">';
				str += '<div class="progress-bar progress-bar-striped progress-bar-warning" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="color:#000000; width:'+results[i].totPcnt+'%">';
				str += results[i].totPcnt;
				str += '%</div></div>';
				str += '</TD>';
				str += '</TR>';
           });
           $("#test").append(str); 
		}
		, error: function(data) {
			console.log('> error ', data);
		}
    });
}
			
var idx = 0;
function showMarker() {
	$("#" + sigunguArr[idx].id).append( 
			// getMarkerDiv(id, xx, yy, cnt)
			// {hAddr=기타, hCnt=2}, {hAddr=비전1동, hCnt=1}
// 			getMarkerDiv(sigunguArr[idx].id, sigunguArr[idx].xx, sigunguArr[idx].yy, 2 + (idx*5) ) 
			getMarkerDiv(sigunguArr[idx].id, sigunguArr[idx].xx, sigunguArr[idx].yy, sigunguArr[idx].cnt ) 
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
var sigunguArr = [];

// 지도 위에 마커 그리기
$(function() {
	$.ajax({
		url : '${pageContext.request.contextPath}/monitor/ajaxCodeList.do'
		, data : JSON.stringify(sigunguArr)
		, type: 'post'
		, dataType: "json"
		, success: function(result) {
			console.log('> success ', result);
			sigunguArr = result.result;
			getLoc('a19'); //비전1동으로 셋팅
			//초기진입시 평택시 전체의 민원이 보이게 셋팅 (진행중..)
// 			$("#air_name").html("평택시");
		}
		, error: function(data) {
			console.log('> error ', data);
		}
	});
	
// 	getLoc('a19');
	
// 	hhs 20.06.23 5초마다 refresh stop
 	setInterval(function() {
 		dataLoad();
 	}, 30000);
});

/*
 // tr클릭시 디테일 화면으로 이동 막음

$("tr").click(function() {
	$("#subForm").submit();
});
*/


// click event
// 더블클릭 구분을 위한 변수
var clickState = null;
function btn_OnClick(id){
	var clickId = id;
	// 원클릭 구분
	if(clickState == null){
		clickState = setTimeout("btn_OnClick('"+clickId+"')", 200);
	}else{
// 		alert("원클릭=="+id);
		getLoc(id);
		ClearClickState();
		
		}
}
	 
function btn_OnDbClick(){
	ClearClickState();
	popupEvent($("#subId").val(),$("#air_name2").html());
// 	alert($("#subId").val());
// 	alert("더블클릭==");
}
	 
function ClearClickState(){
	clearTimeout(clickState);
	clickState = null;
}

//상담이력 팝업
function popupEvent(id,name){
	
	var width = 1200;
	var height = 900;
	var left = Math.ceil((window.screen.width - width)/2);
	var top = Math.ceil((window.screen.height - height)/2);

// 	var paramURL = getContextPath() + "/web/counsel/counselList.do?clickId="+id;
// 	var paramURL = "http://" + location.host + "/web/counsel/counselList.do?clickId="+id;
// 	var paramURL = "http://" + location.host + "/counsel/counselMain.do";
// 	var paramURL = "http://localhost:8080/web/counsel/counselListPcrm.do";
	var paramURL = "http://" + window.location.hostname + ":9090/web/counsel/counselListPcrm.do?selAddr="+id+"&selAddrNm="+encodeURI(name);
	var option = "width=" + width + ", height=" + height
		+ ", toolbar=no, directories=no, scrollbars=auto, location=no, resizable=no, status=no,menubar=no, top="
		+ top + ",left=" + left +"";

	var newWindow = window.open(paramURL, "상담이력", option);
	newWindow.focus();	
	
}

    </script>

</body>

</html>