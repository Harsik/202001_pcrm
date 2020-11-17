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
								<p class="info"><span id="todayText">오늘의</span><span class="spot" id="air_name"> 비전1동</span> 민원현황</p>
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
									<div class="count" id="addrCnt" style="color:black">0</div>
<!-- 									<br> -->
									<div id="air_name2" class="title" style="margin-top:21px;">비전1동</div>
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
<!-- 	          <div class="row"> <br> </div> -->
	          
	          <div id="search" style="height: 42px;">
			          <table class="search_tbl">
			            <tr>
			              <td>
				              <select id="optState" style="width: 100px; height: 23px; padding-right: 5px;">
	                        	<option value = "0"  selected="selected">실시간</option>
	                            <option value = "1">기간설정</option>
	                          </select>
                          
	                          <div id="dvDate" style="padding-left: 10px; display: inline;">
				                <input type="text" class="text_Date" readonly="readonly" id="srcCnslFrDate" maxlength="10" style="height: 25px; width:100px;"> ~ 
				                <input type="text" class="text_Date" readonly="readonly" id="srcCnslToDate" maxlength="10" style="height: 25px; width:100px;"> 
				              </div>
			              </td>
			              
			              <td class="btn">
			              	<button id="btnCnslSearch" class="button">조회</button>
			              	<button id="btnCnslExcel" class="button">엑셀다운</button>
			              	<button id="btnCnslInit" class="button">초기화</button>
			              </td>
			            </tr>
			          </table>
			 </div>
	              
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
<!-- 								<div style="position: absolute;"> -->
<!-- 									<div style="position: relative; top: 10px; left: 10px;"> -->
<%-- 										<img src="<c:url value='/'/>softdb/img/img_ptcity_logo.jpg" style="width:130px"> --%>
<!-- 									</div> -->
<!-- 								</div> -->
								
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
								<div id="a99" style="position: absolute;"></div>
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
        
        fnChangeState();
        
      	// 조회조건 change 이벤트
        $("#optState").bind("change", fnChangeState);
        
        // 조회버튼 클릭 이벤트
        $("#btnCnslSearch").click(function(){
        	initYn = "Y";
        	sigungu = "";
        	dataLoad();
        });
        
        // 초기화버튼 클릭 이벤트
        $("#btnCnslInit").bind("click", init);
        
        // 엑셀다운버튼 클릭 이벤트
        $("#btnCnslExcel").bind("click", downloadExcel);
      });
      
      function downloadExcel(){
    	  var startDt = $("#srcCnslFrDate").val().replace(/-/g, "");
    	  var endDt = $("#srcCnslToDate").val().replace(/-/g, "");
    	  
    	  var param = {
    		 	  "startDt" : startDt,
    		 	  "endDt" 	: endDt,
    		 	  "colHeader"	: ["구분", "합계", "시정일반", "문화", "복지", "교통", "민원행정", "세금예산", "보건위생",
    		 		  			"지역경제", "도시주택",	"문화예술", "미군이전", "안전", "재정", "항만", "환경", "기타"],
    		 	  "colName"	: ["구분", "합계", "시정일반", "문화", "복지", "교통", "민원행정", "세금예산", "보건위생",
    		 		  			"지역경제", "도시주택",	"문화예술", "미군이전", "안전", "재정", "항만", "환경", "기타"],
    		 	  "title"	:   "평택시 민원상담 콜센터 지역별 민원현황(" + startDt + "~" + endDt +")",
    	  };
    	  
          var form = document.createElement("form");
          form.setAttribute("method", "post");
          form.action = '${pageContext.request.contextPath}/monitor/excelDownload.do';
          
          var hiddenField = document.createElement("input");
	      hiddenField.setAttribute("type", "hidden");
	      hiddenField.setAttribute("name", "excelDown");
	      hiddenField.setAttribute("value", JSON.stringify(param));
	      form.appendChild(hiddenField);
	      document.body.appendChild(form);
          
	      form.submit();
      }
      
      //custom select box
      $(function() {
        $('select.styled').customSelect();
      });
	
      function init(){
    	  	initYn = "Y";
    	  	
    		// 날짜 세팅
    		datePicker("#srcCnslFrDate");
    		datePicker("#srcCnslToDate");
    		$("#srcCnslFrDate").val(getDate());
    		$("#srcCnslToDate").val(getDate());
    		$("#totCnt,#addrCnt").text("0");
    		drawMap();
      }
      
      function fnChangeState(){
    	  if($("#optState").val()==0){
    		  $("#dvDate").hide();
    		  $("#btnCnslSearch").hide();
    		  $("#btnCnslInit").hide();
    		  init();
    		  refreshStart();
    	  }else{
    		  $("#dvDate").show();
    		  $("#btnCnslSearch").show();
    		  $("#btnCnslInit").show();
    		  init();
    		  refreshStop();
    	  }
      }
      
function getLoc(id) {
	if(id==""){
		initYn="Y";
	}else{
		initYn="N";
	}
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
	if(count > 999) {
		return markerHtml.replace('$xx1', xx).replace('$yy1', yy-80 )
		.replace('$xx2', xx).replace('$yy2', yy-150 )
		.replace('$marker', 'r').replace('$id', id)
// 		.replace('$wid', 50).replace('$fsize', 22 )
		.replace('$wid', 50).replace('$fsize', 17 )
		.replace('$cnt', (count > 999) ? '999+' : count);
	}
	else {
		return markerHtml.replace('$xx1', xx).replace('$yy1', yy-60 )
			.replace('$xx2', xx).replace('$yy2', yy-115 )
			.replace('$marker', 'w').replace('$id', id)
// 			.replace('$wid', 40).replace('$fsize', 22 )
			.replace('$wid', 40).replace('$fsize', 17 )
			.replace('$cnt', (count > 999) ? '999+' : count);
	}
}

function dataLoad() {
	if($("#optState").val()==0){
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
	$("#air_year,#air_time,#todayText").show();
	}else{
		var date = $("#srcCnslFrDate").val()+" ~ "+$("#srcCnslToDate").val();
		$("#air_year,#air_time,#todayText").hide();
		$("#air_date").text(date);
		$("#air_name").text( sigunguName );
		$("#air_name2").text( sigunguName );
	}
	
	for(var i=0; i<sigunguArr.length; i++) {
 		$("#" + sigunguArr[i].id).empty();
 	}
	$(".green-bg > table").remove(); // 평택시 상위 3개 테이블 초기화
	if(initYn=="Y"){
		$("#air_name").html("평택시");
		$(".fa-comments-o").hide();
		$("#addrCnt").hide();
		$("#air_name2").hide();
		$.ajax({
			url : '${pageContext.request.contextPath}/monitor/ajaxRtData.do'
			, data : { 
				'sigungu' : sigungu,
				'initYn' : "Y",
				'startDt' : $("#srcCnslFrDate").val().replace(/-/gi, ""),
				'endDt' : $("#srcCnslToDate").val().replace(/-/gi, "")
				}
			, type: 'post'
			, dataType: "json"
			, success: function(result) {
				console.log('> 평택시 상위 3개 지역 ', result);
				var results = result.result;
				if(result.result.length > 1){ // data != null
					var str = "";
					str += '<TABLE>';
					$.each(results , function(i){
						str += '<TR style="height: 33px;">';
						str += '<TD style="padding-top: 4px; font-size: 18px; font-weight: 600;">' + results[i].hAddr + '</TD>';
						str += '<TD style="text-align: left; color: black; font-size: 23px; font-weight: 700;">' + numberFormat(results[i].cnt) + '</TD>';
						str += '<TD>';
						str += '<div class="progress">';
						str += '<div class="progress-bar progress-bar-striped progress-bar-warning" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="color:#000000; font-weight: bold; width:'+results[i].pcnt+'%">';
						str += results[i].pcnt;
						str += '%</div></div>';
						str += '</TD>';
						str += '</TR>';
					});
					str += '</TABLE>';
					$(".green-bg").append(str); 
				}
			}
			, error: function(data) {
			}
	    });
	}else{
		$(".fa-comments-o").show();
		$("#addrCnt").show();
		$("#air_name2").show();
	}
	
		$.ajax({
			url : '${pageContext.request.contextPath}/monitor/ajaxRtData.do'
			, data : { 
				'sigungu' : sigungu,
				'initYn' : "N",
				'startDt' : $("#srcCnslFrDate").val().replace(/-/gi, ""),
				'endDt' : $("#srcCnslToDate").val().replace(/-/gi, "")
				}
			, type: 'post'
			, dataType: "json"
			, success: function(result) {
				console.log('> success ', result);
				$("#test > tbody").html(""); // 분류 테이블 초기화
				if(result.result.length > 1){ // data != null
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
				if(sigunguArr[idx2].cnt == undefined && sigunguArr[idx2].cnt == null){
					$("#addrCnt").html(numberFormat(0));  //지역 카운트
				}else{
					$("#addrCnt").html(numberFormat(sigunguArr[idx2].cnt));  //지역 카운트
				}
				$("#totCnt").html(numberFormat(result.result.slice(-1)[0].cnt));  //합계 카운드
				showMarker();
				}
			}
			, error: function(data) {
			}
	    });
		
		showCtgList();
}

//카테고리별
function showCtgList(){
	$.ajax({
		url : '${pageContext.request.contextPath}/monitor/ajaxCtgList.do'
		, data : { 'sigungu' : sigungu,
			'startDt' : $("#srcCnslFrDate").val().replace(/-/gi, ""),
			'endDt' : $("#srcCnslToDate").val().replace(/-/gi, "")
			}
		, type: 'post'
		, dataType: "json"
		, success: function(result) {
			console.log('> showCtgList ', result);
			var results = result.ctgList;
			if(result.ctgList.length > 1){
				var str = "";
	            $.each(results , function(i){
	            	str += '<TR>';
					str += '<TD>' + results[i].ctgLgNm + '</TD>';
					str += '<TD style="width: 60px;">' + numberFormat(results[i].addrCnt) + '</TD>';
					str += '<TD>';
					str += '<div class="progress" style="margin-bottom: 20px;">';
					str += '<div class="progress-bar progress-bar-striped progress-bar-info" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="color:#000000; width:'+results[i].addrPcnt+'%">';
					str += results[i].addrPcnt;
					str += '%</div></div>';
					str += '</TD>';
					str += '<TD style="width: 60px;">' + numberFormat(results[i].totCnt) + '</TD>';
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
			//end if
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
var refreshId = null;
var initYn = "Y"; // load 초기 여부

// 지도 위에 마커 그리기
function drawMap() {
	$.ajax({
		url : '${pageContext.request.contextPath}/monitor/ajaxCodeList.do'
		, data : JSON.stringify(sigunguArr)
		, type: 'post'
		, dataType: "json"
		, success: function(result) {
			console.log('> success ', result);
			sigunguArr = result.result;
// 			getLoc('a19'); //비전1동으로 셋팅
			getLoc(''); // 초기진입시 평택시 전체의 민원이 보이게 셋팅
		}
		, error: function(data) {
			console.log('> error ', data);
		}
	});
}

function refreshStart(){
	refreshId = setInterval(dataLoad, 30000);
}

function refreshStop() {
    if(refreshId != null) {
        clearInterval(refreshId);
    }
}


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
//	var paramURL = "http://" + window.location.hostname + ":8080/web/counsel/counselListPcrm.do?selAddr="+id+"&selAddrNm="+encodeURI(name);
	var option = "width=" + width + ", height=" + height
		+ ", toolbar=no, directories=no, scrollbars=auto, location=no, resizable=no, status=no,menubar=no, top="
		+ top + ",left=" + left +"";

	var newWindow = window.open(paramURL, "상담이력", option);
	newWindow.focus();	
	
}

    </script>

</body>

</html>