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

  <title>평택시청 PCRM 상세화면</title>

  <%@include file="../common/MonitoringIncHead.jsp" %>
  
</head>
<body>
<div id="wrap">
<section id="container" class="sidebar-closed">

    <%@include file="../common/MonitoringIncHeaderSide.jsp" %>
    
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
      
      	<div class="row">
          <div class="col-lg-12">
            <ol class="breadcrumb" style="height:50px"> <h3 class="page-header"><i class="fa fa-table"></i> Detail</h3></ol>
          </div>
        </div>
        
        <div class="row">
        	<div class="col-lg-12">
        	<section class="panel">
        		<div class="panel-body">
        			<div class="form-group">
	                    <label class="control-label col-lg-2" for="inputSuccess">선택</label>
	                    <div class="col-lg-2">
	                      <select class="form-control m-bot15">
	                            <option>1</option>
	                            <option>2</option>
	                            <option>3</option>
	                            <option>4</option>
	                            <option>5</option>
	                        </select>
	                    </div>
                  </div>
	        	</div>
	        </section>
		    </div>
	    </div>
      
      
        <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <header class="panel-heading">
                실시간 민원 콜 현황
              </header>

              <table class="table table-striped table-advance table-hover">
                <tbody>
                  <tr>
                    <th><i class="icon_profile"></i> Full Name</th>
                    <th><i class="icon_calendar"></i> Date</th>
                    <th><i class="icon_mail_alt"></i> Email</th>
                    <th><i class="icon_pin_alt"></i> City</th>
                    <th><i class="icon_mobile"></i> Mobile</th>
                    <th><i class="icon_cogs"></i> Action</th>
                  </tr>
                  <tr>
                    <td>Angeline Mcclain</td>
                    <td>2004-07-06</td>
                    <td>dale@chief.info</td>
                    <td>Rosser</td>
                    <td>176-026-5992</td>
                    <td>
                      <div class="btn-group">
                        <a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
                        <a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
                        <a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>Sung Carlson</td>
                    <td>2011-01-10</td>
                    <td>ione.gisela@high.org</td>
                    <td>Robert Lee</td>
                    <td>724-639-4784</td>
                    <td>
                      <div class="btn-group">
                        <a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
                        <a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
                        <a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>Bryon Osborne</td>
                    <td>2006-10-29</td>
                    <td>sol.raleigh@language.edu</td>
                    <td>York</td>
                    <td>180-456-0056</td>
                    <td>
                      <div class="btn-group">
                        <a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
                        <a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
                        <a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>Dalia Marquez</td>
                    <td>2011-12-15</td>
                    <td>angeline.frieda@thick.com</td>
                    <td>Alton</td>
                    <td>690-601-1922</td>
                    <td>
                      <div class="btn-group">
                        <a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
                        <a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
                        <a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>Selina Fitzgerald</td>
                    <td>2003-01-06</td>
                    <td>moshe.mikel@parcelpart.info</td>
                    <td>Waelder</td>
                    <td>922-810-0915</td>
                    <td>
                      <div class="btn-group">
                        <a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
                        <a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
                        <a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>Abraham Avery</td>
                    <td>2006-07-14</td>
                    <td>harvey.jared@pullpump.org</td>
                    <td>Harker Heights</td>
                    <td>511-175-7115</td>
                    <td>
                      <div class="btn-group">
                        <a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
                        <a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
                        <a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>Caren Mcdowell</td>
                    <td>2002-03-29</td>
                    <td>valeria@hookhope.org</td>
                    <td>Blackwell</td>
                    <td>970-147-5550</td>
                    <td>
                      <div class="btn-group">
                        <a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
                        <a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
                        <a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>Owen Bingham</td>
                    <td>2013-04-06</td>
                    <td>thomas.christopher@firstfish.info</td>
                    <td>Rule</td>
                    <td>934-118-6046</td>
                    <td>
                      <div class="btn-group">
                        <a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
                        <a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
                        <a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>Ahmed Dean</td>
                    <td>2008-03-19</td>
                    <td>lakesha.geri.allene@recordred.com</td>
                    <td>Darrouzett</td>
                    <td>338-081-8817</td>
                    <td>
                      <div class="btn-group">
                        <a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
                        <a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
                        <a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>Mario Norris</td>
                    <td>2010-02-08</td>
                    <td>mildred@hour.info</td>
                    <td>Amarillo</td>
                    <td>945-547-5302</td>
                    <td>
                      <div class="btn-group">
                        <a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
                        <a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
                        <a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </section>
          </div>
        </div>
	
	  </section>
	  <!-- // wrapper -->
	
    </section>
    <!--main content end-->
    
</section>
<!-- container section start -->

<form id="subForm" action="${pageContext.request.contextPath}/monitor/detailMain.do" method="post">
	<input type="hidden" id="subId" name="subId" value=""/>
</form>

<%@include file="../common/MonitoringIncFooterJs.jsp" %>

<script>
$(function() {
	/*
	"key" : "value",
			"srchtype" : srchtype,			
			"frDt" : frDt,
			"toDt" : toDt,
			"usrGrdCd" : g_usrGrdCd,
			"selUsrId" : usrId==null?window.sessionStorage.getItem("USR_ID"):usrId,
			"selChGbCd" : $("#selChGbCd").val(),
			"selActTypeCd" : $("#selActTypeCd").val(),
			"selActStCd" : $("#selActStCd").val(),
			"srchval" : srchtype=="srchKeyWord"?"temp":srchval.replace(/-/g,""),
			// "intv_ex_cd" : $("#selCnslSrchIntvExCd").val(),
			"intv_lg_cd" : $("#selCnslSrchIntvLgCd").val(),
			"intv_md_cd" : $("#selCnslSrchIntvMdCd").val(),
			"intv_sm_cd" : $("#selCnslSrchIntvSmCd").val(),
			"call_gb_cd" : $("#selCnslSrchCallGbCd").val(),
			"keyWord" : $("#selSrchKeyWordCd").val()
		*/
	var data = {
		"key" : "value",
		"srchtype" : "all",			
		"frDt" : "20200130",
		"toDt" : "20200130",
		"usrGrdCd" : "090100",
		"selUsrId" : "all",
		// "selChGbCd" : $("#selChGbCd").val(),
		"selActTypeCd" : "all",
		"selActStCd" : "all",
		"srchval" : "",
		// "intv_ex_cd" : $("#selCnslSrchIntvExCd").val(),
		"intv_lg_cd" : "all",
		"intv_md_cd" : "all",
		"intv_sm_cd" : "all",
		"call_gb_cd" : "all",
		"keyWord" : "0"
	};
			
	$.ajax({
		url : '${pageContext.request.contextPath}/monitor/ajaxRtCounselList.do'
		, data : data
		, type: 'post'
		, dataType: "json"
		, success: function(result) {
			console.log('> success ', result);
			// showMarker();
		}
		, error: function(data) {
			console.log('> error ', data);
		}
    });
});
</script>
</body>
</html>
