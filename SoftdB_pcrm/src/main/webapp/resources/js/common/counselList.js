var dataArr=[];
var usrId = window.sessionStorage.getItem("USR_ID");
function setSelectBoxWithUser()
{	
	$.ajax({
		type : "post",
		dataType: "json",
		async : true,
		url : '/counsel/ajaxUserList.do',
		data : dataArr,
		success : function(data)
		{
			console.log("userList=="+data.result);
			$("#cslist_selCounselNm").html("");
			// param값을 JSON으로 파싱
			var value = "";
			value += "<option value='all'>전체</option>";
			$.each(data.result, function(key, state)
			{
				value += "<option value='" + state.usrId + "'>" + state.usrNm + "</option>";
			});
			
			$("#cslist_selCounselNm").append(value);
			$("#cslist_selCounselNm").trigger("change");
		},
		error : function(data, status, err) 
		{
			networkErrorHandler(data, status, err);
		}
	});
}

function setSelectBoxWithCode(selectId,tp_cd){
	$.ajax({
		type : "post",
		dataType: "json",
		async : true,
		url : '/counsel/ajaxCodeList.do',
		data : {tp_cd : tp_cd},
		success : function(data)
		{
			console.log("codeList=="+data.result);
			// param값을 JSON으로 파싱
			var value = "";
			value += "<option value='all'>전체</option>";
			$.each(data.result, function(key, state)
			{
				value += "<option value='" + state.cd + "'>" + state.cdNm + "</option>";
			});
			
//			$("#cslist_selActTypeCd").append(value);
//			$("#cslist_selActTypeCd").trigger("change");
			$("#"+selectId).append(value);
			$("#"+selectId).trigger("change");
		},
		error : function(data, status, err) 
		{
			networkErrorHandler(data, status, err);
		}
	});
}

function setSelectBoxWithCCtgCode(){
	$.ajax({
		type : "post",
		dataType: "json",
		async : true,
		url : '/counsel/ajaxCodeList.do',
		data : {
			categoryGb : categoryGb,
			parntCd : parntCd
		},
		success : function(data)
		{
			console.log("ctgCodeList=="+data.result);
			// param값을 JSON으로 파싱
			var value = "";
			value += "<option value='all'>전체</option>";
			$.each(data.result, function(key, state)
					{
				value += "<option value='" + state.cd + "'>" + state.cd_nm + "</option>";
					});
			
//			$("#cslist_selActTypeCd").append(value);
//			$("#cslist_selActTypeCd").trigger("change");
			$("#"+selectId).append(value);
			$("#"+selectId).trigger("change");
		},
		error : function(data, status, err) 
		{
			networkErrorHandler(data, status, err);
		}
	});
}

//파라미터 셋팅 CounselList
function getJsonStrCounselList(srchtype, srchval, srchDtType, usrId)
{
	var cust_id=null;	
	var frDt = $("#cslist_selFrDate").val();
	var toDt = $("#cslist_selToDate").val();

	if($("#cslist_selFrDate").val() != null)
		frDt = frDt.replace(/[-, :, \s]/g,"");
	if($("#cslist_selToDate").val() != null)
		toDt = toDt.replace(/[-, :, \s]/g,"");

	var loParam = {
			"key" : "value",
			"srchtype" : srchtype,
			"srchDtType" : "rcvDt",
			"frDt" : frDt,
			"toDt" : toDt,
			"usrGrdCd" : window.sessionStorage.getItem("USR_GRD_CD"),
			"selUsrId" : usrId,
			"selChGbCd" : $("#cslist_selChGbCd").val(),
			"selActTypeCd" : $("#cslist_selActTypeCd").val(),
			"selActStCd" : $("#cslist_selActStCd").val(),
			"srchval" : srchtype=="srchKeyWord"?"temp":srchval.replace(/-/g,""),
			/* "intv_ex_cd" : $("#cslist_selSrchIntvExCd").val(), */
			"intv_lg_cd" : $("#cslist_selSrchIntvLgCd").val(),
			"intv_md_cd" : $("#cslist_selSrchIntvMdCd").val(),
			"intv_sm_cd" : $("#cslist_selSrchIntvSmCd").val(),
			"call_gb_cd" : $("#cslist_selCallGb").val(),
			"keyWord" : $("#cslist_selSrchKeyWordCd").val(),
			"loc_yn" : "",
			"cust_id" : cust_id
	};
	console.log(JSON.stringify(loParam));
	return  encodeURIComponent(JSON.stringify(loParam));
}

// init Page
$(document).ready(function()
{	
	datePicker("#cslist_selFrDate");
	datePicker("#cslist_selToDate");
	$("#cslist_selFrDate").val(getDate());
	$("#cslist_selToDate").val(getDate());
	
	setSelectBoxWithUser();
	setSelectBoxWithCode("cslist_selActTypeCd","90014");	//처리유형
	setSelectBoxWithCode("cslist_selActStCd","90013");	 	//상담결과
	setSelectBoxWithCode("cslist_selCallGb","90010");		//통화구분
	setSelectBoxWithCode("cslist_hAddr","98002");			//주소
	
	setObjectSelectBoxWithCode2("cslist_selSrchIntvLgCd", "선택", "1", "", "00000000", "", "CHANGE");
	
	// 상담유형 대분류 선택 시 이벤트
	$("#cslist_selSrchIntvLgCd").bind("change", function(e)
	{	
		var eXid=e.target.value;
		
		setObjectSelectBoxWithCode2("cslist_selSrchIntvMdCd", "", "1", "", e.target.value, "", "CHANGE");
	});

	// 상담유형 대분류 선택 시 이벤트

	$("#cslist_selSrchIntvMdCd").bind("change", function(e)
	{		
		setObjectSelectBoxWithCode2("cslist_selSrchIntvSmCd", "", "2", "", e.target.value, "", "CHANGE");
		
	});

	// 상담유형 중분류 선택 시 이벤트

	$("#cslist_selSrchIntvMdCd").bind("change", function(e)
	{
		setObjectSelectBoxWithCode2("cslist_selSrchIntvSmCd", "선택", "3", "", e.target.value, "", "");
		
	});
	
	$("#cslist_tblCounselList").jqGrid(
			{
				url : "/counsel/ajaxCounselList.do",
				datatype : "json",
				mtype : "POST",
				postData : {
					pJson : getJsonStrCounselList($("#cslist_optSrchtype").val(), $("#cslist_tfSrchval").val(),  $("#cslist_selDtType").val(), usrId)
				},
				jsonReader :
				{
					repeatitems: false
				},
				colNames : ["ID", "녹취경로","녹취ID","등록일","상담사ID", "수정자ID", "접수일시", "상담사", "민원인명", "전화번호", "상담유형", "처리유형", "상담결과", "통화구분", "위치동의","민원처리결과", "녹취듣기"],
			
			   	colModel :
			   	[
			   	 	{ name : "TCKT_ID", index : "TCKT_ID", hidden:true },
			   	 	{ name : "RECD_ID", index : "RECD_ID", hidden:true },
			   	 	{ name : "CALL_ID", index : "CALL_ID" ,hidden:true },
			   	 	{ name : "RCV_DT", index : "RCV_DT" ,hidden:true },
			   	 	{ name : "RCV_USR_ID", index : "RCV_USR_ID" ,hidden:true },
			   	 	{ name : "MOD_USR_ID", index : "MOD_USR_ID" ,hidden:true },
					{ name : "RCV_DT_FORMAT", index : "RCV_DT_FORMAT", align : "center", width : 90 },
					{ name : "RCV_USR_NM", index : "RCV_USR_NM", align : "center", width : 60 },
					{ name : "CUST_NM", index : "CUST_NM", align : "center", width : 70, hidden:true },
					{ name : "CNTCT_INFM_FORMAT", index : "CNTCT_INFM_FORMAT", align : "center", width : 70 },
					{ name : "INTV_NM", index : "INTV_NM", align : "left", width : 240 },			
					{ name : "ACT_TYPE_NM", index : "ACT_TYPE_NM", align : "center", width : 50 },
					{ name : "ACT_ST_NM", index : "ACT_ST_NM", align : "center", width : 60, formatter:fnStatusFormatter },
					{ name : "CALL_GB_NM_ENG", index : "CALL_GB_NM_ENG", align : "center", width : 50 },
					{ name : "LOC_YN", index : "LOC_YN", align : "center", width : 50 },
			   		{ name : "TRNR_ACT_ST_NM", index : "TRNR_ACT_ST_NM", align : "center", width : 80, hidden:true },
					{ name : "REC_BUTTON", align : "center", width: 50 }
			   	],
			   	sortname : "RCV_DT_FORMAT",
			   	sortorder : "desc",
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
			   	pager : "#cslist_pgCounselList",
			   	rownumbers : true,
			   	rownumWidth : 30,
			   	multiselect : false,
			   	emptyrecords : "",
			   	caption : "",
			   	loadui : "enable",
			   	viewrecords: true,
			   	onSelectRow : function(rowid)
			   	{
			   		$("#cslist_POPUP").val("CHILD");
			   		var row = $("#cslist_tblCounselList").getRowData(rowid);	   			   			   		
			   		counselInitTable(row.TCKT_ID, "list", "counsel");
			   	},
			   	gridComplete : function()
			   	{
			   		var ids = $(this).getDataIDs();
			   		
			   		// 녹취 버튼 표시
			   		for(var i = 0; i < ids.length; i++)
			   		{
			   			var rowId = ids[i];
			   			var row = $(this).getRowData(rowId);

			   			// 특이민원 색상 //고쳐야함
		                // if(row.INTV_EX_CD=="70000000"){
			   			//if(row.INTV_LG_CD=="70000000"){
				   			if(row.INTV_LG_CD=="90000000"){
			   				 $("#cslist_tblCounselList").setRowData(rowId,false,{background:"#ffb3b3"});
			   			}
			   			
			   			if(row.CALL_ID != null && row.CALL_ID != "")
			   			{
			   				// 청취 키 (녹취날짜 + con_id + agentId)
							var rec_param=row.RCV_DT+"|"+row.CALL_ID+"|"+row.RECD_ID;
				   			
							//2018.11.19 상담사는 자신것만 들을 수 있다.
				   			var rec_visible = "";
				   			if(window.sessionStorage.getItem("USR_GRD_CD") == "010100" &&
				   					window.sessionStorage.getItem("USR_ID") != row.MOD_USR_ID){
				   				rec_visible = " display:none; ";
				   			}
				   			
							var recBtn = "<button class='button' style='width: 50px;"+ rec_visible +"' id='rec_" + row.TCKT_ID + "' " + "name='" + rec_param + "'>청취</button>";
				   			$(this).jqGrid("setRowData", rowId, { REC_BUTTON : recBtn });
				   			$("#rec_" + row.TCKT_ID).bind("click", fnReclisten);
				   			
			   			}
			   		}
			   		
			   
			   		// in, out 건수 표시
			   		$.ajax({
						type : "post",
						dataType: "json",
						async : true,
						url : getContextPath() + "/ajax/counsel/externalCorpInsert.do",
						data : "pJson=" + getJsonStrCounselListCnt($("#cslist_optSrchtype").val(), $("#cslist_optSrchtype").val() == "srchPhone" ? $("#cslist_tfSrchval").val().replace(/-/gi, "") : $("#cslist_tfSrchval").val(),  $("#cslist_selDtType").val(), $("#cslist_selCounselNm").val()),
						success : function(data)
						{
							if(data != 0)
							{
								$("#cslist_labCnslListInOutCnt").html("IN : " + data.INCNT.toString() + ", OUT : " + data.OUTCNT.toString());
							}
						},
						error : function(data, status, err) 
						{
							
						}
					});
			   		
			   	}
			}).jqGrid("navGrid", "#cslist_pgCounselList", {edit : false, add : false, del : false, search : false});
});