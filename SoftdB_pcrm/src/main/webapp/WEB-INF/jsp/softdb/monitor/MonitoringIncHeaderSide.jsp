<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/lib/jquery-ui-custom/jquery-ui.css" type="text/css" />
<script type="text/javascript" src="<c:url value='/resources/js/lib/jquery-2.1.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/lib/jquery-ui-custom/jquery-ui.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/common/common.js'/>"></script>
<style>
#search .btn {
	float: right;
	text-align: right;
	right: 3px;
}
.button {
	display: inline-block;
	border-radius: 3px;
	border: 1px solid #2b91dd;
	line-height: 1;
	padding: 3px 4px;
	background: #0f71ba;
	background: -moz-linear-gradient(top, #3fa4f0 0%, #0f71ba 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #3fa4f0), color-stop(100%, #0f71ba));
	background: -webkit-linear-gradient(top, #3fa4f0 0%, #0f71ba 100%);
	background: -o-linear-gradient(top, #3fa4f0 0%, #0f71ba 100%);
	background: -ms-linear-gradient(top, #3fa4f0 0%, #0f71ba 100%);
	background: linear-gradient(to bottom, #3fa4f0 0%, #0f71ba 100%);
	font-family: 'Dotum', sans-serif;
	font-size: 9pt;
	text-align: center;
	font-weight: bold;
	color: #fff;
	text-decoration: none;
}
</style>
	<header class="header dark-bg">
	<!-- side menu bar start -->
	<!--  
      <div class="toggle-nav">
        <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"><i class="icon_menu"></i></div>
      </div>
    -->
    <!-- side menu bar end -->

      <!--logo start-->
<!--       <a href="https://www.pyeongtaek.go.kr" class="logo">평택시민원상담콜센터 <span class="lite">PCRM</span></a> -->
      <a href="javascript:init();" class="logo">평택시민원상담콜센터 <span class="lite">PCRM</span></a>
      <!--logo end-->


      <div class="top-nav notification-row">
        <!-- notificatoin dropdown start-->
        <ul class="nav pull-right top-menu">

          <!-- alert notification start-->
          <!-- 
          <li id="alert_notificatoin_bar" class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">

                            <i class="icon-bell-l"></i>
                            <span class="badge bg-important">7</span>
                        </a>
            <ul class="dropdown-menu extended notification">
              <div class="notify-arrow notify-arrow-blue"></div>
              <li>
                <p class="blue">You have 4 new notifications</p>
              </li>
              <li>
                <a href="#">
                                    <span class="label label-primary"><i class="icon_profile"></i></span>
                                    Friend Request
                                    <span class="small italic pull-right">5 mins</span>
                                </a>
              </li>
              <li>
                <a href="#">
                                    <span class="label label-warning"><i class="icon_pin"></i></span>
                                    John location.
                                    <span class="small italic pull-right">50 mins</span>
                                </a>
              </li>
              <li>
                <a href="#">
                                    <span class="label label-danger"><i class="icon_book_alt"></i></span>
                                    Project 3 Completed.
                                    <span class="small italic pull-right">1 hr</span>
                                </a>
              </li>
              <li>
                <a href="#">
                                    <span class="label label-success"><i class="icon_like"></i></span>
                                    Mick appreciated your work.
                                    <span class="small italic pull-right"> Today</span>
                                </a>
              </li>
              <li>
                <a href="#">See all notifications</a>
              </li>
            </ul>
          </li>
          -->
          <!-- alert notification end-->
          <!-- user login dropdown start-->
          <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="profile-ava">
                                <%-- <img alt="" src="<c:url value='/'/>bootstrap/img/avatar1_small.jpg"> --%>
                                <img alt="" src="<c:url value='/'/>softdb/img/avatar-blank.svg" width="32px">
                            </span>
<%--                             <span class="username">${sessionScope.LoginVO.usrId} (${sessionScope.LoginVO.usrNm})</span> --%>
                            <span class="username">${sessionScope.LoginVO.usrNm}</span>
                            <b class="caret"></b>
                        </a>
            <ul class="dropdown-menu extended logout">
              <div class="log-arrow-up"></div>
              <li>
<%--                 <a href="<c:url value='/'/>softdb/actionLogout.do"> --%>
                <a href="javascript:window.close();">
                <i class="icon_key_alt"></i> Log Out
                </a>
              </li>
            </ul>
          </li>
          <!-- user login dropdown end -->
        </ul>
        <!-- notificatoin dropdown end-->
      </div>
    
    
    
    </header>
    <!--header end-->

    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu">
          <li class="active">
            <a class="" href="<c:url value='/'/>monitor/MonitoringMapView.do">
                          <i class="icon_house_alt"></i>
                          <span>Dashboard</span>
                      </a>
          </li>
          <!-- <li class="sub-menu">
            <a href="javascript:;" class="">
                          <i class="icon_document_alt"></i>
                          <span>Forms</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
            <ul class="sub">
              <li><a class="" href="form_component.html">Form Elements</a></li>
              <li><a class="" href="form_validation.html">Form Validation</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;" class="">
                          <i class="icon_desktop"></i>
                          <span>UI Fitures</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
            <ul class="sub">
              <li><a class="" href="general.html">Elements</a></li>
              <li><a class="" href="buttons.html">Buttons</a></li>
              <li><a class="" href="grids.html">Grids</a></li>
            </ul>
          </li> -->
          <li>
            <a class="" href="../cmm/main/mainPage.do" >
                          <i class="icon_genius"></i>
                          <span>전자정부 홈</span>
                      </a>
          </li>
          
          <li>
            <a class="" href="<c:url value='/'/>softdb/user/userListView.do">
                          <i class="icon_genius"></i>
                          <span>사용자관리</span>
                      </a>
          </li>
        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
    <!--sidebar end-->
