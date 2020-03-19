 
function listenRecPopup(dn, agentId, agentNm, recCallId)
{
	 //청취 플레이어  키 (녹취날짜 + con_id + agentId)
		var REC_URL="http://172.17.0.17/player/player.jsp"; 
		var recParam=recCallId.split("|");
		openPopup(REC_URL+"?date="+recParam[0]+"&keycode="+recParam[1]+"&local="+recParam[2],"_player","556","590","yes","center");
 
}
 
// open popup
var openPopup = function (mypage,myname,w,h,scroll,pos){
	var win=null;
	if(pos=='random'){LeftPosition=(screen.width)?Math.floor(Math.random()*(screen.width-w)):100;TopPosition=(screen.height)?Math.floor(Math.random()*((screen.height-h)-75)):100;}
	if(pos=='center'){LeftPosition=(screen.width)?(screen.width-w)/2:100;TopPosition=(screen.height)?(screen.height-h-100)/2:100;}
	else if((pos!='center' && pos!='random') || pos==null){LeftPosition=0;TopPosition=0}
	
	settings='width='+w+',height='+h+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',location=no,directories=no,status=no,menubar=no,toolbar=no,resizable=no';
	win=window.open(mypage,myname,settings);
	
	//if(win==null){ alert("팝업 차단기능을 해제한 후 다시 시도해 주십시오."); }
	//if(win.focus){win.focus();}
};