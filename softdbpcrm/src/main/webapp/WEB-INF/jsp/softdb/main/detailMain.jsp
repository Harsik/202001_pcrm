<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>평택시민원상담콜센터</title>
	<meta charset="utf-8">
	<meta http-equiv="Cache-Control" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
	<meta http-equiv="Pragma" content="no-cache" />
	
	<link rel="icon" href="/resources/images/favicon.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/popup.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/lib/jquery-ui-custom/jquery-ui.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/lib/jquery-ui-custom/jquery-ui.theme.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/lib/jqgrid/css/ui.jqgrid.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/lib/jstree/themes/default/style.custom.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/lib/jquery-datetimepicker/jquery.datetimepicker.css" type="text/css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" integrity="sha256-3dkvEK0WLHRJ7/Csr0BZjAWxERc5WH7bdeUya2aXxdU= sha512-+L4yy6FRcDGbXJ9mPG8MT/3UCDzwR9gPeyFNMCtInsol++5m3bk2bXWKdZjvybmohrAsn3Ua5x8gfLnbE1YkOg==" crossorigin="anonymous">
	<link rel="stylesheet" href="/stylesheets/style.css" integrity="sha256-OlSbjYBfrJGGd2zbT3qCsAZsPGxRwKOSGjqqfjF8aiY= sha512-1aDUINxj8c9UXJ76eIMAkG2/ofIjG8FBW4drgHUglwY/rGn+YWUtm8iSkrpAOtwZ9b9LEva02KPrTDx3M5ib3w==" crossorigin="anonymous">
	
	<script type="text/javascript" src="<c:url value='/resources/js/lib/jquery-2.1.1.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/lib/jquery.form.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/lib/jqgrid/js/jquery.jqGrid.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/lib/jqgrid/js/i18n/grid.locale-en.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/lib/jquery-ui-custom/jquery-ui.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/lib/jstree/jstree.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/lib/jquery-datetimepicker/jquery.datetimepicker.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/lib/dext5editor/js/dext5editor.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/common/common.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/common/comCounselSpec.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/lib/jquery-rate-picker.js'/>"></script>
	
	<!-- SoftPhone 관련 스크립트 -->
	<%-- <script type="text/javascript" src="<c:url value='/resources/js/cti/ws_cti.js'/>"></script> --%>
	
	<%-- <script type="text/javascript" src="<c:url value='/resources/js/cti/WS_softPhone.js'/>"></script> --%>
	<script type="text/javascript" src="<c:url value='/resources/js/main/CallMain.js'/>"></script>
	
	<!-- KukudocsEditor  -->
	<script type="text/javascript" src="<c:url value='/resources/KukudocsEditor/javascripts/build/Editor.bundle.js'/>"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/KukudocsEditor/stylesheets/style.css" type="text/css" />
	<style type="text/css">
	
    	.ui-jqgrid tr.jqgrow td { white-space:nowrap !important; text-overflow: ellipsis;-o-text-overflow: ellipsis; }
    	
		.news { padding: 0 0px 20px; }		
		.news .open-event { height: 16px; position: relative; overflow: hidden; }
		.news .open-event ul { position: absolute; top: 0px; }
		.news .open-event ul#notice1 { left: 0; }
		.news .open-event ul#notice2 { right: 20px; }
		.news .open-event ul li { height: 20px; color: white; font-weight: bold; display: inline-block; width: 550px; cursor: pointer; }
		.news .open-event ul li:hover { text-decoration: underline; }
		.news .open-event ul li a { color: white; font-weight: bold; display: inline-block; width: 550px; }
		.news .open-event ul li a:hover { color: #8f7614; }
		.news .open-event ul li a strong { margin-right: 10px; }
		.news .open-event ul li span.date { display: inline-block; width: 60px; }
		.news .open-event .prev { position: absolute; top: 1px; right: 2px; width: 7px; height: 4px; line-height: 0; font-size: 0; }
		.news .open-event .next { position: absolute; bottom: 1px; right: 2px; width: 7px; height: 4px; line-height: 0; font-size: 0; }		
		.news .control { float: left; margin: 0px 0 0 10px; }
		.news .control a.stop { font-size: 12px; }
		.news .control a.on { color: red; font-size: 12px; }
		
		/* for MS계열 브라우저 */
		@keyframes blink { 
			0% { background-color: red; }
			50%{ background-color: yellow; }
		}
		
		/* blink CSS 브라우저 별로 각각 애니메이션을 지정해 주어야 동작한다. */
		.blinkcss {
			display: inline-block;
			margin: 1px 1px;
			border-radius: 4px;
			border: 1px solid #2b91dd;
			line-height: 1;
			padding: 2px 8px 4px 8px;
			font-family: 'NanumGothic', sans-serif;
			text-align: center;
			font-weight: bold;
			color: #fff;
			text-decoration: none;
			animation: blink 1s step-end infinite;
			-webkit-animation: blink 1s step-end infinite;
		}
		
		/******* 전화걸기 팝업 *******/
		a { color: #000; }
		.mask {
			width: 100%;
			height: 100%;
			position: fixed;
			left: 0;
			top: 0;
			z-index: 10;
			background: #000;
			opacity: .5;
			filter: alpha(opacity = 50);
		}
		/* #modalLayer{display:none; position:relative;} */
		#modalLayer {
			left: 203px;
			top: 68px;
			display: block;
			position: absolute;
			z-index: 9;
			text-align: left;
			border-radius: 0px 0px 7px 7px;
		}
		
		#modalLayer #modalLayerheader {
			/* padding: 5px; */
			padding-left: 15px;
			position: relative;
			/*  cursor: move; */
			z-index: 12;
			background-color: #003b91;
			color: #fff;
			font-weight: bold;
		}
		/* #modalLayer .modalContent{width:440px; height:123px; padding:20px; border:1px solid #ccc; position:fixed; left:30%; top:19%; z-index:11; background:#fff;border-radius: 7px;} */
		#modalLayer .modalContent {
			width: 606px;
			height: 32px;
			/* padding:3px 20px 3px 3px; */
			border: 1px solid #ccc;
			position: relative;
			left: 0;
			top: 19%;
			z-index: 11;
			background: #f6f6f6;
			border-radius: 0px 0px 7px 7px;
		}
		
		#modalLayer .modalContent button {
			/* position:absolute; */
			right: 0;
			top: 0;
			cursor: pointer;
		}
		
		#modalLayer .modalContent img {
			position: absolute;
			right: 0;
			top: 0;
			cursor: pointer;
		}
		/**************************/
		
		/** 빠른걸기 전화걸기 입력란 x버튼 삭제*/
		#modalCallNum::-ms-clear {
			display: none;
		}
	</style>

</head>
<body class="cbp-spmenu-push" style="overflow: auto; min-width: 1904px;">
	<%-- <%@include file="/WEB-INF/jsp/common/header.jsp" %> --%>
					
	<div id="contents_container">
		
		<div class="r-contents" style="width:97%; height: 841px;">
			<%@include file="../common/content_tab.jsp" %>
		</div>	



<!-- Classie - class helper functions by @desandro https://github.com/desandro/classie -->
<script src="<c:url value='/resources/js/lib/classie.js'/>"></script> 
<script>
		/* var menuLeft = document.getElementById( 'cbp-spmenu-s1' );
		var showLeft = document.getElementById( 'showLeft' );
		var body = document.body;

		showLeft.onclick = function()
		{
			classie.toggle( this, 'active' );
			classie.toggle( menuLeft, 'cbp-spmenu-open' );
			disableOther( 'showLeft' );
		};

		function disableOther( button )
		{
			if( button !== 'showLeft' )
				classie.toggle( showLeft, 'disabled' );
		}; */
	</script>

<script type="text/javascript">
	(function() {
			// setCategoryCodeListToObject2("selMainIntvXlCd","","10000000", "Main");
			// initCodeBook("Main");// 초기 코드 데이타
			// setObjAgentList("Main"); //상담사 리스트
		}());	
	
</script>
<!-- 	<script src="codeDefer.js" defer></script> -->
</html>