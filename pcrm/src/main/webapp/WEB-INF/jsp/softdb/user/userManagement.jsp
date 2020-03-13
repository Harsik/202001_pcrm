<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>사용자 관리</title>
		<link rel="icon" href="/resources/images/favicon.ico">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/lib/jquery-ui-custom/jquery-ui.css" type="text/css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/lib/jqgrid/css/ui.jqgrid.css" type="text/css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/popup.css" type="text/css"/>
		
		<script type="text/javascript" src="<c:url value='/resources/js/lib/jquery-2.1.1.min.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/lib/jqgrid/js/jquery.jqGrid.min.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/lib/jquery.form.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/lib/jqgrid/js/i18n/grid.locale-en.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/lib/jquery-ui-custom/jquery-ui.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/common/common.js'/>"></script>
		<%-- <script type="text/javascript" src="<c:url value='/resources/js/user/userManagement.js'/> "></script> --%>
	<style type="text/css">
	
	#imgView {
	    -webkit-transform:scale(1);
	    -moz-transform:scale(1);
	    -ms-transform:scale(1); 
	    -o-transform:scale(1);  
	    transform:scale(1);
	    -webkit-transition:.3s;
	    -moz-transition:.3s;
	    -ms-transition:.3s;
	    -o-transition:.3s;
	    transition:.3s;
	}
	#imgView:hover {
	    -webkit-transform:scale(1.5);
	    -moz-transform:scale(1.5);
	    -ms-transform:scale(1.5);   
	    -o-transform:scale(1.5);
	    transform:scale(1.5);
	}

	</style>
</head>
<body>
		<!--BODY-->
	<div id="h1">사용자 관리</div>
	<div id="pop_body" style="height: 745px;">
		<!--타이틀-->
		<div class="stitle">
		    <!-- <img src="/resources/images/icon_bullet.png" alt=""/> -->사용자 조회
		</div>
		<!--"타이틀"-->
	 	<!-- 조회/검색 -->
		<div id="search">
			<table class="search_tbl">
        		<tr>
        			
		  			<!-- 
		  			<th>등급</th>
          			<td class="sel">
            			<select class="select_al" id="optGrade"></select>
          			</td> 
          			-->
          			
          			<th>소속</th>
          			<td class="sel" style="width: 450px;">
            			<select class="select_al" style="width: 30%;" id="usrMngmnt_selCenter">
            				<option value="all">전체</option>
            				<option value="010000">민원상담 콜센터</option>
            			</select>
            			<select class="select_al" style="width: 30%;" id="usrMngmnt_selTeam">
            				<option value="all">전체</option>
            				<option value="1001">일반팀</option>
							<option value="7000">교육생팀</option>
							<option value="9000">관리팀</option>
							<option value="9100">테스트팀</option>
            			</select>
            			<select class="select_al" style="width: 30%;" id="usrMngmnt_selDept"></select>
          			</td>
		  			<th>검색어</th>
          			<td class="sel">
            			<select class="select_al" id="usrMngmnt_optSrchtype">
              				<option value="all">전체</option>
							<option value="usrId">아이디</option>
							<option value="usrNm">이름</option>
            			</select>
          			</td>
          			<td class="nemo_20" >
            			<input type="text" class="text_ol" id="usrMngmnt_tfSrchval" maxlength="20">
          			</td>
          			<td class="btn">
						<button type="button" id="usrMngmnt_btnSearch"  class="button">조회</button>
						<button type="button" id="usrMngmnt_btnInit"  class="button">초기화</button>
		  			</td>
        		</tr> 		
      		</table>
		</div>
		<!--"조회/검색"-->
		<!--타이틀-->
		<div class="stitle">사용자 목록</div>
		<!--"타이틀"-->
    
    <!--그리드-->
		<div id="grid_all">
			<!-- 미사용/버튼 테이블 -->
			<table class="info_tbl">			
				<tr>				  			
					<td>
						<input type="checkbox" name="check1" class="checkbox" id="usrMngmnt_chkNotUse"><label for="chkNotUse">퇴사자 포함 &nbsp;</label>
						<button type="button" id="usrMngmnt_btnExcel"  class="button">엑셀저장</button>
					</td>
				</tr>
			</table><!--"미사용/버튼 테이블"-->
			<!-- 그리드테이블 -->
	 		<div class="grid_tbl">		 
		 		<table id="usrMngmnt_tblUserList"></table>
				<div id="usrMngmnt_pgUselList"></div>
	   		</div>
			<!--"그리드테이블"-->
			<!-- 버튼 테이블 -->
			<table class="info_tbl_btn">
				<tr>
					<td>
						<button type="button" id="usrMngmnt_btnInsert"  class="button">추가</button>
						<button type="button" id="usrMngmnt_btnModifyPw"  class="button">비밀번호변경</button>
						<button type="button" id="usrMngmnt_btnUpdate"  class="button">저장</button>
						<button type="button" id="usrMngmnt_btnReset"  class="button">초기화</button>
					</td>
				</tr>
			</table>
			<!--"버튼 테이블"-->
     	</div>
     	<!--"그리드"-->
		<!-- 개인정보테이블 -->
		<form id="usrMngmnt_frm1" name="frm1" action="" method="post">
			<table class="profile_tbl">
				<tr>
                    <td class="line_rt">입사일</td>
					<td class="line_b">
						<input type="text" class="text_ol_70" id="usrMngmnt_entDt" name="entDt" readonly="readonly" maxlength="8">
					</td>
					<td class="line_c">퇴사일</td>
					<td class="line_b">
						<input type="text" class="text_ol_70" id="usrMngmnt_retDt" name="retDt" maxlength="8">
					</td>
					<td class="line_c" rowspan="8">사진</td>
					<td class="line_b" rowspan="8">
						<img src="" name="imgView" id="usrMngmnt_imgView" width="auto" height="175"><br>
						<input type="file" id="usrMngmnt_USR_IMG_PTH" name="USR_IMG_PTH" onchange="readURL(this);">
					</td>
				</tr>
                <tr>
					<td class="line_rt">아이디</td>
					<td class="line_b">
						<input type="text" class="text_ol" name="usrIdText" id="usrMngmnt_usrIdText" maxlength="20">
					</td>
					<td class="line_c">이름</td>
					<td class="line_b">
						<input type="text" class="text_ol" id="usrMngmnt_usrNmText" name="usrNmText" maxlength="160">
					</td>
				</tr>
				<tr>
					<td class="line_rt">등급</td>
					<td class="line_b">
						<select class="select_bl" id="usrMngmnt_usrGrdCd" name="usrGrdCd"></select>
					</td>
					<td class="line_c">직급</td>
					<td class="line_b">
						<select class="select_bl" id="usrMngmnt_dtyCd" name="dtyCd">
							<option value="all">미선택</option>
							<option value="10">차장</option>
							<option value="12">과장</option>
							<option value="13">팀장</option>
							<option value="15">대리</option>
							<option value="21">센터장</option>
							<option value="31">매니저</option>
							<option value="43">팀원</option>
							<option value="99">시스템관리자</option>
							<option value="05">처장</option>
							<option value="06">부장</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="line_rt">센터</td>
					<td class="line_b">
						<select class="select_bl" id="usrMngmnt_cntrCd" name="cntrCd">
							<option value="010000">민원상담 콜센터</option>
						</select>
					</td>
					<td class="line_c">팀</td>
					<td class="line_b">
						<select class="select_bl" id="usrMngmnt_teamCd" name="teamCd">
							<option value="1001">일반팀</option>
							<option value="7000">교육생팀</option>
							<option value="9000">관리팀</option>
							<option value="9100">테스트팀</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="line_rt">부서</td>
					<td class="line_b">
						<select class="select_bl" id="usrMngmnt_deptCd" name="deptCd" disabled="disabled"></select>
					</td>
					<td class="line_c">퇴사사유</td>
					<td class="line_b">
						<select class="select_bl" id="usrMngmnt_usrGrdRetire" name="usrGrdRetire">
							<option value="all">미선택</option>
							<option value="100001">이직</option>
							<option value="100002">학업</option>
							<option value="100003">업무부적응</option>
							<option value="100004">건강</option>
							<option value="100005">가족병간호</option>
							<option value="100006">육아</option>
							<option value="100007">거주지이전</option>
							<option value="100008">결혼</option>
							<option value="100099">기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="line_rt">전화번호</td>
					<td class="line_b">
						<input type="text" class="text_ol_70" id="usrMngmnt_telNo" name="telNo" maxlength="50" onkeydown="return onlyNumber(event)">
					</td>
					<td class="line_c">핸드폰</td>
					<td class="line_b">
						<input type="text" class="text_ol_70" id="usrMngmnt_celNo" name="celNo" maxlength="50" onkeydown="return onlyNumber(event)">
					</td>
				</tr>
				<tr>
					<td class="line_rt">이메일</td>
					<td class="line_b">
						<input type="text" class="text_ol" id="usrMngmnt_emlAdr" name="emlAdr" maxlength="200">
					</td>
                    <td class="line_c">전화기IP주소</td>
					<td class="line_b">
						<input type="text" class="text_ol" id="usrMngmnt_pcIp" name="pcIp" maxlength="100">
					</td>
										
				</tr>
				<tr>
					<td class="line_rb" style="border-bottom: 1px solid #98a5b3;">수정일시</td>
					<td class="line_wb" style="border-bottom: 1px solid #98a5b3;">
						<input type="text" class="text_ol" id="usrMngmnt_modDt" name="modDt" disabled="disabled">
					</td>
					<td class="line_rb2" style="border-bottom: 1px solid #98a5b3;">수정자</td>
					<td class="line_wb" style="border-bottom: 1px solid #98a5b3;">
						<input type="text" class="text_ol" id="usrMngmnt_modUsrId" name="modUsrId" disabled="disabled">
					</td>
				</tr>
                <tr>
                    <td class="line_rt">내선번호</td>
					<td class="line_b">
						<input type="text" class="text_ol_70" id="usrMngmnt_extnNo" name="extnNo" maxlength="5">
					</td>
                    <td class="line_c">CTI사용여부</td>
					<td class="line_b">
						<input type="radio" name="ctiUsrYn" value="Y" checked />사용&nbsp;
						<input type="radio" name="ctiUsrYn" value="N"/>미사용      
					</td>
					<td class="line_c">CTI ID</td>
					<td class="line_b">
						<input type="text" class="text_ol" id="usrMngmnt_ctiLgnId" name="ctiLgnId" maxlength="20">
					</td>
                </tr>
			</table>
			<!--"개인정보테이블"-->
		</form>
	</div><!--"BODY"-->
	
<script type="text/javascript">
$(document).ready(function() {
	
	init();

});

var g_srchtype = "all";
var g_srchval = "";
var g_srchCntrCd = "all";
var g_srchTeamCd = "all";
var g_srchDeptCd = "all";
var g_cntrCd = "90002";
var g_teamCd = "90003";
var g_deptCd = "90004";
var g_gradeCd = "90006";
var g_dtyCd = "90005";
var g_cntrFirstCd = "";
var g_teamFirstCd = "empty";
var g_gradeFirstCd = "";
var g_dtyFirstCd = "";
var pwdMod = "N";

function init() {
	datePicker("#usrMngmnt_entDt");
	datePicker("#usrMngmnt_retDt");
	initSelectBoxGrade();
	
	//소속 셀렉트 셋팅
	selAffiliation();
	
	//소속 상세보기 셀렉트 셋팅
	usrAffiliation();
	
	$("#usrMngmnt_tblUserList").jqGrid(
			{
				url : getContextPath() + "/softdb/jqgrid/user/userList.do",
				datatype : "json",
				mtype : "POST",
				postData : {
					pJson : getJsonStrUserList("", "", $("input[id=usrMngmnt_chkNotUse]:checkbox").prop("checked"))
				},
				jsonReader :
				{
					repeatitems: false
				},
				colNames : ["아이디", "이름", "등급", "핸드폰번호", "내선번호", "CTI ID", "퇴사여부", "수정일", "PW수정일"],
			   	colModel :
			   	[
			   	 	{ name : "usr_id", index : "USR_ID", width : 100, align : "center" },
					{ name : "usr_nm", index : "USR_NM", width : 100, align : "center" },
					{ name : "cd_nm", index : "CD_NM", width : 100, align : "center" },
					{ name : "cel_no_format", index : "CEL_NO_FORMAT", width : 100, align : "center" },
					{ name : "extn_no", index : "EXTN_NO", width : 100, align : "center" },
					{ name : "cti_lgn_id", index : "CTI_LGN_ID", width : 100, align : "center" },
					{ name : "ret_yn", index : "RET_YN", width : 100, align : "center" },
					{ name : "mod_dt_format", index : "MOD_DT_FORMAT", width : 100, align : "center" },
					{ name : "pw_mod_dt_format", index : "PW_MOD_DT_FORMAT", width : 100, align : "center" }
			   	],
			   	sortname : "USR_ID",
			   	sortorder : "asc",
			   	gridview : true,
			   	hidegrid : false,
			   	shrinkToFit : true,
			   	loadonce : false,
			   	scrollOffset : 0,
			   	height : "260",
			   	width : "100%",
			   	rowNum : 10,
			   	rowList : [10, 20, 30, 50, 100],
			   	autowidth : true,
			   	pager : "#usrMngmnt_pgUselList",
			   	rownumbers : true,
			   	rownumWidth : 30,
			   	multiselect : false,
			   	emptyrecords : "",
			   	caption : "",
			   	loadui : "enable",
			   	viewrecords: true,
			   	onSelectRow : function(rowid)
			   	{
			   		usrAffiliation();
			   		var row = $("#usrMngmnt_tblUserList").getRowData(rowid);
			   		
			   		$.ajax({
						type : "post",
						dataType: "json",
						async : true,
						url : getContextPath() + "/softdb/common/userspec.do",
						data : "pJson=" + getJsonStrUserspec(row.usr_id),
						success : function(data)
						{
							console.log('> userspec : ', data);
							
							initUserSpec();
							$("#usrMngmnt_usrIdText").prop("disabled", true);
							$("#usrMngmnt_usrIdText").val(data.USR_ID);
							$("#usrMngmnt_usrNmText").val(data.USR_NM);
							$("#usrMngmnt_pwdNoEncCntn").val("********");
							$("#usrMngmnt_entDt").val(data.ENT_DT_FORMAT);
							
							if(data.RET_DT_FORMAT != "--"){
								$("#usrMngmnt_retDt").val(data.RET_DT_FORMAT);
							};
							
							$("#usrMngmnt_cntrCd").val(data.CNTR_CD);
							$("#usrMngmnt_usrGrdCd").val(data.USR_GRD_CD);
							$("#usrMngmnt_usrGrdRetire").val(data.RET_RSN);
							
							// setObjSelectBoxWithCode("usrMngmnt_teamCd", "미선택", "", "CHILD", "90003", "");
							
							$("#usrMngmnt_deptCd").val(data.DEPT_CD);
							$("#usrMngmnt_teamCd").val(data.TEAM_CD);
							$("#usrMngmnt_dtyCd").val(data.DTY_CD);
							$("input[name=ctiUsrYn][value=" + data.CTI_USE_YN + "]").prop("checked", true); 
							$("#usrMngmnt_ctiLgnId").val(data.CTI_LGN_ID);
							$("#usrMngmnt_extnNo").val(data.EXTN_NO);
							$("#usrMngmnt_telNo").val(getPhoneNumFormat(data.TEL_NO));
							$("#usrMngmnt_celNo").val(getPhoneNumFormat(data.CEL_NO));
							$("#usrMngmnt_emlAdr").val(data.EML_ADR);
							$("#usrMngmnt_pcIp").val(data.PC_IP);
							$("#pcMac").val(data.PC_MAC);
							$("#usrMngmnt_faxNo").val(getPhoneNumFormat(data.FAX_NO));
							$("#usrMngmnt_modDt").val(data.MOD_DT_FORMAT +" "+ data.MOD_TM_FORMAT);
							$("#usrMngmnt_modUsrId").val(data.MOD_USR_NM);
							if(data.SVRFL_PTH != null)
								$("#usrMngmnt_imgView").attr("src", getImgUrl() + replaceFileUrl(data.SVRFL_PTH));
							else
								$("#usrMngmnt_imgView").attr("src", "");
							$("#usrMngmnt_btnUpdate").show();
							$("#usrMngmnt_btnInsert").hide();
							$("#usrMngmnt_btnModifyPw").show();
						},
						error : function(data, status, err) 
						{
							networkErrorHandler(data, status, err);
						}
					});
			   	},
			   	onPaging : function(pgButton)
			   	{	   		
			   		initUserSpec();
			   	}
			}).jqGrid("navGrid", "#usrMngmnt_pgUselList", {edit : false, add : false, del : false, search : false});	
			
	
	// 조회 버튼 클릭 이벤트 등록
	$("#usrMngmnt_btnSearch").bind("click", btnSearch_clickEvent);
	// 초기화 버튼 클릭 이벤트 등록
	$("#usrMngmnt_btnInit").bind("click", btnInit_clickEvent);
	// 검색어 텍스트인풋 엔터 키 이벤트 등록
	$("#usrMngmnt_tfSrchval").bind("keydown", function (key)
	{
		if (key.keyCode == 13)
			btnSearch_clickEvent();
	});
	
	// 미사용 포함 체크 박스 클릭 이벤트 등록
	$("#usrMngmnt_chkNotUse").bind("click", btnSearch_clickEvent);
	
	// 사용자 상세 수정 버튼 클릭 이벤트 등록
	$("#usrMngmnt_btnInsert").bind("click", btnInsert_clickEvent);
	
	// 사용자 상세 수정 버튼 클릭 이벤트 등록
	$("#usrMngmnt_btnUpdate").bind("click", btnUpdate_clickEvent);
	
	// 비밀번호 변경 버튼 클릭 이벤트 등록
	$("#usrMngmnt_btnModifyPw").bind("click", btnModifyPw_clickEvent);
	
	// 사용자 상세  초기화 버튼 클릭 이벤트 등록
	$("#usrMngmnt_btnReset").bind("click", function(e)
	{
		$("#usrMngmnt_tblUserList").trigger("reloadGrid");
		initUserSpec();
		$("#usrMngmnt_usrGrdCd").empty();
		initSelectBoxGrade();
	});
	
}

function search() {
	$("#usrMngmnt_tblUserList").jqGrid("setGridParam", 
			{postData : {pJson : 
				getJsonStrUserList(g_srchtype
						, g_srchval
						, $("input[id=usrMngmnt_chkNotUse]:checkbox").prop("checked"))
				}
				, page : 1
				, sortname : "usr_id"
				, sortorder : "asc"}
	);
}

function getJsonStrUserList(srchtype, srchval, notuse)
{			
	var loParam = {
		"qt" : "c2VsZWN0TGlzdA==",
		"mi" : "b20wMDEuc2VsZWN0TGlzdA==",
		"map" : {
			"key" : "value",
			"optSrchType" : srchtype,
			"tfSrchVal" : srchval,
			"chkRetire" : notuse,
			"cntr_cd" : g_srchCntrCd,
			"team_cd" : g_srchTeamCd,
			"dept_cd" : g_srchDeptCd,
			"sidx" : "CNTR_CD, USR_GRD_CD DESC, CD_ORD, USR_ID",
			"sord" : "asc",	
		}
	};	
	console.log(JSON.stringify(loParam));
	return  encodeURIComponent(JSON.stringify(loParam));
}

//조회 버튼 클릭 이벤트
function btnSearch_clickEvent()
{
	g_srchtype = $("#usrMngmnt_optSrchtype").val();
	g_srchval = $("#usrMngmnt_tfSrchval").val();
	g_srchCntrCd = $("#usrMngmnt_selCenter").val();
	g_srchTeamCd = $("#usrMngmnt_selTeam").val();
	g_srchDeptCd = $("#usrMngmnt_selDept").val();
	
	$("#usrMngmnt_tblUserList").jqGrid("setGridParam", {postData : {pJson : getJsonStrUserList(g_srchtype, g_srchval, $("input[id=usrMngmnt_chkNotUse]:checkbox").prop("checked"))}, page : 1, sortname : "usr_id", sortorder : "asc"});
	$("#usrMngmnt_tblUserList").trigger("reloadGrid");
	
	initUserSpec();
}

//추가버튼 클릭 이벤트
function btnInsert_clickEvent()
{		
	var rMsg = checkUserSpec();
	
	if(rMsg !== "")
	{
		alert(rMsg);
		return;
	}
	
	if (confirm("저장 하시겠습니까?"))
	{
		$.ajax({
			type : "post",
			dataType: "json",
			async : true,
			// url : getContextPath() + "/ajax/user/userspec.do",
			url : getContextPath() + "/softdb/common/userspec.do",
			data : "pJson=" + getJsonStrUserspec($("#usrMngmnt_usrIdText").val()),
			success : function(data)
			{
				console.log('>>> data ', data);
				
				if(data != null && data.usr_id) {
					alert("중복된 ID가 존재 합니다.");
					$("#usrMngmnt_usrIdText").focus();
				} else {
					$.ajax({
						type : "post",
						dataType: "json",
						url : getContextPath() + "/softdb/user/userManagementInsert.do",
						data : "pJson=" + getJsonStrInsertUser(),
						success : function(data) {
							
							//그룹권한등록
							$.ajax({
								type : "post",
								// url : getContextPath() + "/ajax/main/setSelectBoxGrade.do",
								url : getContextPath() + "/softdb/user/userAuthUpdate.do",
								dataType : "json",
								data : "pJson=" + getJsonStr("dXBkYXRl", "b3IwMDIudXNlckF1dGhVcGRhdGU=", {
									"key" : "value",
									"usr_id" : $("#usrMngmnt_usrIdText").val(),
									"cd" : $("#usrMngmnt_usrGrdCd").val(),
									"use_yn" : "Y"
								}),
								success : function(dt) {
									btnInit_clickEvent();
								},
								error : function(data, status, err) {
									networkErrorHandler(data, status, err);
								}
							});
							
						},
						error : function(data, status, err) {
							networkErrorHandler(data, status, err);
						}
					});
				}
			},
			error : function(data, status, err) 
			{
				networkErrorHandler(data, status, err);
			}
		});
	}
}

//프로그램 수정 버튼 클릭 이벤트
function btnUpdate_clickEvent()
{
	if($("#usrMngmnt_retDt").val()!=""){
		if($("#usrMngmnt_usrGrdRetire").val()=="all"){
			alert("퇴사사유를 선택 바랍니다");
			return;
		}
	}
	
	var rMsg = checkUserSpec();
	
	if(rMsg !== "")
	{
		alert(rMsg);
		return;
	}
	
	if(confirm("저장 하시겠습니까?"))
	{
		// gAppendHidden("usrMngmnt_frm1", "pJson", getJsonStrUpdateUser());
		// gSubmitPost("usrMngmnt_frm1", true);
		$.ajax({
			type : "post",
			dataType: "json",
			async : true,
			url : getContextPath() + "/softdb/user/userManagementUpdate.do",
			data : "pJson=" + getJsonStrUpdateUser(),
			success : function(data) {
			},
			error : function(data, status, err) {
				networkErrorHandler(data, status, err);
			}
		});
		
		// 감성분석 솔루션 상담사정보 수정
		var obj = new Object();
		var agentId = $("#usrMngmnt_usrIdText").val();
		
		//obj.agentId = $("#usrMngmnt_usrIdText").val();
		obj.agentName = $("#usrMngmnt_usrNmText").val();
		obj.agentNumber = $("#usrMngmnt_extnNo").val().replace(/-/gi, "");
		obj.agentIp = $("#usrMngmnt_pcIp").val();	
			
		var jsonData = JSON.stringify(obj);
		
		btnInit_clickEvent();
	}
}

//비밀번호 변경 버튼 클릭 이벤트
function btnModifyPw_clickEvent() {
	openPwModifyPopup("OM0108");
}

//초기화 버튼 클릭 이벤트
function btnInit_clickEvent()
{
	g_srchtype = "all";
	g_srchval = "";
	g_srchCntrCd = "all";
	g_srchTeamCd = "all";
	g_srchDeptCd = "all";
	
	//센터 코드
	$("#usrMngmnt_selCenter").val("all");
	// $("#usrMngmnt_selTeam option[value!='all'],#usrMngmnt_selDept option[value!='all']").remove();
	
	initSelectBoxGrade();
	
	g_srchCntrCd = $("#usrMngmnt_selCenter").val();
	g_srchTeamCd = $("#usrMngmnt_selTeam").val();
	g_srchDeptCd = $("#usrMngmnt_selDept").val();
	
	$("#usrMngmnt_btnInsert").show();
	$("#usrMngmnt_btnModifyPw").hide();
	$("#usrMngmnt_btnUpdate").hide();
	
	$("#usrMngmnt_optSrchtype").val("all");
	$("#usrMngmnt_tfSrchval").val("");
	$("input[id=usrMngmnt_chkNotUse]:checkbox").prop("checked", false) ;	
	
	$("#usrMngmnt_tblUserList").jqGrid("setGridParam", 
			{postData : {pJson : 
				getJsonStrUserList("", "", $("input[id=usrMngmnt_chkNotUse]:checkbox").prop("checked"))}
				, page : 1
				, sortname : "usr_id"
				, sortorder : "asc"}
	);
	$("#usrMngmnt_tblUserList").trigger("reloadGrid");

	initUserSpec();
}

//프로그램 상세 초기화
function initUserSpec()
{	
	$("#usrMngmnt_btnInsert").show();
	$("#usrMngmnt_btnUpdate").hide();
	$("#usrMngmnt_btnModifyPw").hide();
	
	$("#usrMngmnt_usrIdText").prop("disabled", false);
	
	$("#usrMngmnt_usrIdText").val("");
	$("#usrMngmnt_usrNmText").val("");
	$("#usrMngmnt_pwdNoEncCntn").val("");
	$("#usrMngmnt_pwdNoEncCntnChk").val("");
	$("#pwdNoEncCntnChk").val("");
	
	$("#usrMngmnt_dtyCd").val("all");
	$("#usrMngmnt_cntrCd").val("all");
	$("#usrMngmnt_teamCd").val("all");
	$("#usrMngmnt_deptCd").val("all");
	
	//그룹목록에서 등급을 가져옴
	//$("#usrMngmnt_usrGrdCd").empty();
	
	
	// setSelectBoxWithCode("usrMngmnt_dtyCd", "", g_dtyCd, "", "", "");
	$("#usrMngmnt_entDt").val("");
	$("#usrMngmnt_retDt").val("");
	$("input:radio[name=ctiUsrYn]:input[value=Y]").prop("checked", true);
	$("#usrMngmnt_extnNo").val("");
	$("#usrMngmnt_telNo").val("");
	$("#usrMngmnt_celNo").val("");
	$("#usrMngmnt_emlAdr").val("");
	$("#usrMngmnt_pcIp").val("");
	$("#pcMac").val("");
	$("#usrMngmnt_ctiLgnId").val("");
	$("#usrMngmnt_faxNo").val("");
	$("#usrMngmnt_modDt").val("");
	$("#usrMngmnt_modUsrId").val("");
	$("#usrMngmnt_USR_IMG_PTH").val("");
	$("#usrMngmnt_imgView").attr("src", "");
}

//저장 및 수정 예외 처리
function checkUserSpec()
{
    var rMsg = "";
	pwdMod = "N";
	
	if($("#usrMngmnt_usrIdText").val() == "")
		rMsg += "\n\nID를 입력 해 주세요.";
	if($("#usrMngmnt_usrNmText").val() == "")
		rMsg += "\n\n이름을 입력 해 주세요.";
	if($("#usrMngmnt_entDt").val() == "")
		rMsg += "\n\n입사일을 입력 해 주세요.";
	if($("#usrMngmnt_usrGrdCd").val() == "" || $("#usrMngmnt_usrGrdCd").val() == null)
		rMsg += "\n\n등급을 선택 해 주세요.";
	if($("#usrMngmnt_dtyCd").val() == "" || $("#usrMngmnt_dtyCd").val() == null)
		rMsg += "\n\n직급을 선택 해 주세요.";
	if($("#usrMngmnt_cntrCd").val() == "all" || $("#usrMngmnt_cntrCd").val() == "" || $("#usrMngmnt_cntrCd").val() == null||$("#usrMngmnt_cntrCd").val() == "all")
		rMsg += "\n\n센터를 선택 해 주세요.";
	if($("#usrMngmnt_extnNo").val() == "" || $("#usrMngmnt_extnNo").val() == null)
		rMsg += "\n\n내선번호를 입력 해 주세요.";
	
	return rMsg;
}

function initSelectBoxGrade() {
	$.ajax({
		type : "post",
		async : true,
		url : getContextPath() + "/softdb/common/selectBoxGrade.do",
		dataType : "json",
		data : "pJson=" + getJsonStr("c2VsZWN0TGlzdA==", "b3IwMDIudXNyQXV0aExpc3Q=", {
			"key" : "value",
			"usr_id" : '${sessionScope.LoginVO.usrId}',
			"grdMode" : "Y"
		}),
		success : function(result) {
			console.log('> data ', result);
			var options = "";
			
			var data = result.rows;
			if(data) {
				for(var i = 0; i < data.length; i++) {
					options += "<option value='" + data[i].auth_cd + "'>" + data[i].cd_nm + "</option>";
				}
				$("#usrMngmnt_usrGrdCd").empty().prepend(options);
			}
		},
		error : function(data, status, err) {
			networkErrorHandler(data, status, err);
		}
	});
}

function selAffiliation(){//head 셀렉트박스
	/*
	setObjSelectBoxWithCode("usrMngmnt_usrGrdRetire", "미선택", "","CHILD", "90060", "");
	//센터 코드 선택했을때
	$("#usrMngmnt_selCenter").bind("change", function(){
		if($("#usrMngmnt_selCenter").val()=="010000"){
			setObjSelectBoxWithCode("usrMngmnt_selTeam", "전체", "", "CHILD", "90003", "");
		}
		if($("#usrMngmnt_selCenter").val()=="990000"){
			$("#usrMngmnt_selTeam option[value!='all'],#usrMngmnt_selDept option[value!='all']").remove();
		}
		
	});
	// 조회 부분 소속 정보 셋팅
	setObjSelectBoxWithCode("usrMngmnt_selCenter", "전체", "", "CHILD", "90002", "");
	$("#usrMngmnt_selTeam,#usrMngmnt_selDept").append("<option value='all'>전체</option>");
	*/
}

function usrAffiliation(){
	/*
	//센터 코드 선택했을때
	$("#usrMngmnt_cntrCd").bind("change", function(){
		
		if($("#usrMngmnt_cntrCd").val()=="010000"){
			setObjSelectBoxWithCode("usrMngmnt_teamCd", "미선택", "", "CHILD", "90003", "");
		}
		if($("#usrMngmnt_cntrCd").val()=="990000"){
			$("#usrMngmnt_teamCd option[value!='all'],#usrMngmnt_deptCd option[value!='all']").remove();
		}
		
	});
	// 조회 부분 소속 정보 셋팅
	setObjSelectBoxWithCode("usrMngmnt_cntrCd", "미선택", "", "CHILD", "90002", "");
	$("#usrMngmnt_teamCd,#usrMngmnt_deptCd").append("<option value='all'>미선택</option>");
	setObjSelectBoxWithCode("usrMngmnt_dtyCd", "미선택", "", "CHILD", "90005", "");
	*/
}

function getJsonStrUserspec(usrId)
{
	var loParam = {
			"qt" : "c2VsZWN0T25l",
			"mi" : "b20wMDEuc2VsZWN0",
			"map" : {
				"key" : "value",
				"usr_id" : usrId
			}
		};
		
		console.log(JSON.stringify(loParam));
		return encodeURIComponent(encodeURIComponent(JSON.stringify(loParam)));
}

//파라미터 셋팅_UpdateProgram
function getJsonStrUpdateUser()
{
	var modYn = "";
	if($("#usrMngmnt_USR_IMG_PTH").val() != "")
		modYn = 'Y';
	
	pwdMod = "N";
	var loParam = {
		"qt" : "aW5zZXJ0",
		"mi" : "b20wMDEudXBkYXRl",
		"map" : {
			"key" : "value",
			"usr_id" : $("#usrMngmnt_usrIdText").val(),
			"usr_nm" : $("#usrMngmnt_usrNmText").val(),
			"pwdMod" : pwdMod,
			"ent_dt" : $("#usrMngmnt_entDt").val().replace(/-/g,""),
			"ret_dt" : $("#usrMngmnt_retDt").val().replace(/-/g,""),
			"cntr_cd" : $("#usrMngmnt_cntrCd").val(),
			"team_cd" : $("#usrMngmnt_teamCd").val(),
			"dept_cd" : $("#usrMngmnt_deptCd").val(),
			"usr_grd_cd" : $("#usrMngmnt_usrGrdCd").val(),
			"dty_cd" : $("#usrMngmnt_dtyCd").val(),
			"cti_use_yn" : $(":radio[name='ctiUsrYn']:checked").val(),
			"cti_lgn_id" : $("#usrMngmnt_ctiLgnId").val(),
			"extn_no" : $("#usrMngmnt_extnNo").val(),
			"tel_no" : $("#usrMngmnt_telNo").val().replace(/-/gi, ""),
			"cel_no" : $("#usrMngmnt_celNo").val().replace(/-/gi, ""),
			"eml_adr" : $("#usrMngmnt_emlAdr").val(),
			"pc_ip" : $("#usrMngmnt_pcIp").val(),
			"tbl_nm" : "om001",
		    "tbl_pk": $("#usrMngmnt_usrIdText").val(),
		    "tbl_pk2": $("#usrMngmnt_usrIdText").val(),
		    "modYn" : modYn,
		    "callback" : "cb_merge",
		    "ret_rsn" : $("#usrMngmnt_usrGrdRetire").val()
		}
	};
	console.log(JSON.stringify(loParam));
	return encodeURIComponent(encodeURIComponent(JSON.stringify(loParam)));
}

function getJsonStrInsertUser()
{
	var loParam = {
		"qt" : "aW5zZXJ0",
		"mi" : "b20wMDEuaW5zZXJ0",
		"map" : {
			"key" : "value",
			"usr_id" : $("#usrMngmnt_usrIdText").val(),
			"usr_nm" : $("#usrMngmnt_usrNmText").val(),
			"pwd_no_enc_cntn" : SHA256($("#usrMngmnt_usrIdText").val() + "!"), // 사용자 신규 추가시 default 비밀번호는 "아이디+!"
			"ent_dt" : $("#usrMngmnt_entDt").val().replace(/-/g,""),
			"ret_dt" : $("#usrMngmnt_retDt").val().replace(/-/g,""),
			"cntr_cd" : $("#usrMngmnt_cntrCd").val(),
			"team_cd" : $("#usrMngmnt_teamCd").val(),
			"dept_cd" : $("#usrMngmnt_deptCd").val(),
			"usr_grd_cd" : $("#usrMngmnt_usrGrdCd").val(),
			"dty_cd" : $("#usrMngmnt_dtyCd").val(),
			"cti_use_yn" : $(":radio[name='ctiUsrYn']:checked").val(),
			"cti_lgn_id" : $("#usrMngmnt_ctiLgnId").val(),
			"cti_usr_yn" : "Y",
			"extn_no" : $("#usrMngmnt_extnNo").val(),
			"tel_no" : $("#usrMngmnt_telNo").val().replace(/-/gi, ""),
			"cel_no" : $("#usrMngmnt_celNo").val().replace(/-/gi, ""),
			"eml_adr" : $("#usrMngmnt_emlAdr").val(),
			"pc_ip" : $("#usrMngmnt_pcIp").val(),
			"tbl_nm" : "om001",
		    "tbl_pk": $("#usrMngmnt_usrIdText").val(),
		    "callback" : "cb_merge"
		}
	};
	
	console.log(JSON.stringify(loParam));
	return encodeURIComponent(encodeURIComponent(JSON.stringify(loParam)));
}

</script>
</body>
</html>