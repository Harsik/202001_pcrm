function htmlTagRevision(a,b,e){var c=a;if(""!=c&&(DEXTTOP.DEXT5.browser.ie&&11>=DEXTTOP.DEXT5.browser.ieVersion||DEXTTOP.DEXT5.browser.gecko))try{var d=c.toLowerCase().indexOf("<body"),g=c.toLowerCase().lastIndexOf("<body");if(-1<d&&-1<g&&d!=g)return DEXTTOP.DEXT5.util.writeLog("DEBUG","htmlTagRevision return - "+a,"",""),a;if("ieplugin"!=DEXTTOP.G_CURREDITOR._config.runtimes&&-1<c.indexOf("mso-fareast-font-family")){var f=RegExp("<[^>]+style=(.*?)>","gi"),h="",d=!1;try{var k=c.match(f);if(k){for(var l=
k.length,f=0;f<l;f++)c=c.replace(k[f],"_DEXT_T_S{"+f+"}_");for(f=0;f<l;f++){var m=k[f];-1<m.indexOf("-font-family")&&(m=m.replace("-font-family","-font-dext-family"));g=!1;0>m.indexOf("font-family")&&(g=!0);-1<m.indexOf("-font-dext-family")&&(m=m.replace("-font-dext-family","-font-family"));g&&(m=m.replace(/mso-fareast-font-family/gi,"font-family"));c=c.replace("_DEXT_T_S{"+f+"}_",m)}}}catch(n){d=!0}d&&(c=a)}b&&(c=DEXT5_EDITOR.HTMLParser.RemoveOfficeTag(c,e));var h=c.toLowerCase(),p=realValue2=c,
q=h.lastIndexOf("<body"),r=h.indexOf("</body");if(-1<q&&-1<r)try{var t=p.substring(r),u=p.substring(q).indexOf(">"),v=p.substring(0,q+u+1),c=p.substring(q+u+1,r)}catch(w){q=r=-1,c=realValue2}c=DEXT5_EDITOR.HTMLParser.HTMLtoXML(c,e);-1<q&&-1<r&&(c=v+c+t)}catch(x){return DEXTTOP.DEXT5.util.writeLog("DEBUG","htmlTagRevision return - "+a,"",""),a}else if("1"==DEXTTOP.G_CURREDITOR._config.removeComment)for(b=c.indexOf("\x3c!--"),a=c.indexOf("--\x3e");-1<b&&-1<a;)b=c.substring(0,b),c=c.substring(a+3),c=
b+c,b=c.indexOf("\x3c!--"),a=c.indexOf("--\x3e");else c=c.replace(/--\x3e\s</gi,"--\x3e<");DEXTTOP.DEXT5.util.writeLog("DEBUG","htmlTagRevision return - "+c,"","");return c}var G_wordProcessorType="";
function SetCorrectOfficeHtml(a){var b=a;if(-1<a.indexOf("<meta name=ProgId content=Word.Document>")||-1<a.indexOf('<meta name=Generator content="Microsoft Word'))G_wordProcessorType="DOC",a=GetMsWordHtml(a);else if(-1<a.indexOf("<meta name=ProgId content=Excel.Sheet>"))G_wordProcessorType="XLS",a=GetMsExcelHtml(a);else if(-1<a.indexOf("<meta name=ProgId content=PowerPoint.Slide>"))G_wordProcessorType="PPT",a=GetMsPptHtml2(a);else if(-1<a.indexOf('<meta name=Generator content="Jungum Global">'))G_wordProcessorType=
"GUL",a=GetJungumHtml(a);else if(isHwpPasteAction(a))G_wordProcessorType="HWP",a=GetHanHwpHtml(a);else if(-1<a.indexOf(' xmlns:m="http://schemas.microsoft.com/office/'))G_wordProcessorType="PPT",a=GetMsPptHtml2(a);else if(-1<a.indexOf('<meta name=Generator content="Microsoft'))G_wordProcessorType="DOC",a=GetMsWordHtml(a);else if(!DEXTTOP.DEXT5.browser.ie){var b=a.indexOf("\x3c!--StartFragment--\x3e"),e=a.lastIndexOf("\x3c!--EndFragment--\x3e");-1<b&&-1<e&&(b=a.substr(b+20),e=b.lastIndexOf("\x3c!--EndFragment--\x3e"),
-1<e&&(a=b=b.substring(0,e)))}a=DEXTTOP.DEXT5.util.replaceAll(a,"<![if !supportEmptyParas]>","");a=DEXTTOP.DEXT5.util.replaceAll(a,"<![endif]>","");a=DEXTTOP.DEXT5.util.replaceAll(a,"\x3c!--[if !supportEmptyParas]--\x3e","");a=DEXTTOP.DEXT5.util.replaceAll(a,"\x3c!--[if !supportLists]--\x3e","");a=DEXTTOP.DEXT5.util.replaceAll(a,"\x3c!--[endif]--\x3e","");a=DEXTTOP.DEXT5.util.replaceAll(a,"\x3c!--StartFragment--\x3e","");a=DEXTTOP.DEXT5.util.replaceAll(a,"\x3c!--EndFragment--\x3e","");a=DEXTTOP.DEXT5.util.replaceAll(a,
"<![if ppt]>","");DEXTTOP.DEXT5.util.writeLog("DEBUG","SetCorrectOfficeHtml return - "+a,"","");return a}
function GetMsWordHtml(a){var b=a,e,b=a.indexOf("/* Style Definitions */"),c=a.indexOf("</head>");-1<b&&-1<c&&(b=a.substr(b+23),c=b.indexOf("</head>"),-1<c&&(e=b.substring(0,c),e=GetStyleMap(e)));var b=a,c=!1,d="\x3c!--StartFragment--\x3e",g="\x3c!--EndFragment--\x3e",f=a.indexOf(d),h=a.indexOf(g);if(-1==f&&-1==h){var d="<body ",g="</body>",k=a.indexOf(d);-1<k&&(h=a.indexOf(">",k),d=a.Mid(k,h-k+1),f=a.indexOf(d),h=a.indexOf(g))}if(-1<f&&-1<h&&(b=a.substr(f+d.length),h=b.indexOf(g),-1<h)){for(;;)if(a=
b.indexOf(g,h+g.length),-1<a)h=a;else break;a=b=b.substring(0,h);c=!0}if(c){a=b;var l="<div class=WordSection1>",g=a.indexOf(l);-1==g&&(l='<div class="WordSection1">',g=a.indexOf(l));-1<g&&(l=DEXTTOP.DEXT5.util.replaceAll(a,l,""),l.length!=a.length&&(a=l,l=a.lastIndexOf("/"),-1<l&&(a=a.substring(0,l-1))));d="\x3c!--[if supportFields]>";for(g="<![endif]--\x3e";;){f=a.indexOf(d);-1<f&&(h=a.indexOf(g,f+d.length));l=a.length;if(f>l||h>l)break;if(-1<f&&-1<h){if(f<h){var m,b=a.substring(0,f);m=a.substr(h+
g.length);a=b+m}}else break;h=-1}}if(c){d="\x3c!--[if gte vml 1]>";g="<![if !vml]>";try{for(;;){f=a.indexOf(d);-1<f&&(h=a.indexOf(g,f+d.length));var n=a.length;if(n>f||n>h){a=DEXTTOP.DEXT5.util.replaceAll(a,d,"");a=DEXTTOP.DEXT5.util.replaceAll(a,g,"");break}if(-1<f&&-1<h)f>h?(b=a.substring(0,f),m=a.substr(f),b=DEXTTOP.DEXT5.util.replaceAll(b,g,""),a=b+m):(b=a.substring(0,f),m=a.substr(h+g.length),a=b+m,c=!0);else break}}catch(p){}}d="\x3c!--[if gte mso 9]>";g="<![endif]--\x3e";try{for(;;){f=a.indexOf(d);
-1<f&&(h=a.indexOf(g,f+d.length));l=a.length;if(f>l||h>l){a=DEXTTOP.DEXT5.util.replaceAll(a,d,"");a=DEXTTOP.DEXT5.util.replaceAll(a,g,"");break}if(-1<f&&-1<h)f>h?(b=a.substring(0,f),m=a.substr(f),b=DEXTTOP.DEXT5.util.replaceAll(b,g,"")):(b=a.substring(0,f),m=a.substr(h+g.length)),a=b+m;else break}}catch(q){}c&&(a=DEXTTOP.DEXT5.util.replaceAll(a,"><![endif]></span>"," /></span>"),a=DEXTTOP.DEXT5.util.replaceAll(a,"<![endif]></span>","</span>"),a=DEXTTOP.DEXT5.util.replaceAll(a,"</span><![endif]>",
"</span>"),a=DEXTTOP.DEXT5.util.replaceAll(a,"<![endif]>",""),a=DEXTTOP.DEXT5.util.replaceAll(a,"<![if !vml]>",""));a=RepaireSpanInImageTag4MsWord(a);a=DEXTTOP.DEXT5.util.replaceAll(a,"<v:rect ","<div ");a=DEXTTOP.DEXT5.util.replaceAll(a,"</v:rect>","</div>");a=DEXTTOP.DEXT5.util.replaceAll(a,"<v:shadow ","<hr ");a=DEXTTOP.DEXT5.util.replaceAll(a,"<v:shape ","<span ");a=DEXTTOP.DEXT5.util.replaceAll(a,"</v:shape>","</span>");a=DEXTTOP.DEXT5.util.replaceAll(a,"<v:imagedata","<img border=0");a=DEXTTOP.DEXT5.util.replaceAll(a,
"<![if !supportLists]>","");a=DEXTTOP.DEXT5.util.replaceAll(a,"<![endif]>","");a=setPasteClassStyle(e,a,!0);DEXTTOP.DEXT5.util.writeLog("DEBUG","GetMsWordHtml return - "+a,"","");return a}
function GetMsExcelHtml(a){var b=a,e,b=a.indexOf("<style>"),c=a.indexOf("</head>");-1<b&&-1<c&&(b=a.substr(b+7),c=b.indexOf("</head>"),-1<c&&(e=b.substring(0,c),e=GetStyleMap(e)));var b=a,c=!1,d,g="</body>",f=a.indexOf("<table"),h=a.indexOf(g);-1<f&&-1<h&&(b=a.substr(f),h=b.indexOf(g),-1<h&&(b=b.substring(0,h),c=!0));if(c){c=!1;a=b;d="\x3c!--[if gte vml 1]>";g="<![if !vml]>";try{for(;;){f=a.indexOf(d);-1<f&&(h=a.indexOf(g,f+d.length));var k=a.length;if(k>f||k>h){a=DEXTTOP.DEXT5.util.replaceAll(a,
d,"");a=DEXTTOP.DEXT5.util.replaceAll(a,g,"");break}if(-1<f&&-1<h)if(f>h){var l,b=a.substring(0,f);l=a.substr(f);b=DEXTTOP.DEXT5.util.replaceAll(b,g,"");a=b+l}else b=a.substring(0,f),l=a.substr(h+g.length),a=b+l,c=!0;else break}}catch(m){}}c&&(a=DEXTTOP.DEXT5.util.replaceAll(a,"></span><![endif]>"," /></span>"),a=DEXTTOP.DEXT5.util.replaceAll(a,"</span><![endif]>","</span>"),a=DEXTTOP.DEXT5.util.replaceAll(a,"<![endif]>",""),k=_T("<![if !vml]>"),a=DEXTTOP.DEXT5.util.replaceAll(a,k,""));a=DEXTTOP.DEXT5.util.replaceAll(a,
"<v:rect ","<div ");a=DEXTTOP.DEXT5.util.replaceAll(a,"</v:rect>","</div>");a=DEXTTOP.DEXT5.util.replaceAll(a,"<v:shadow ","<hr ");a=DEXTTOP.DEXT5.util.replaceAll(a,"<v:shape ","<span ");a=DEXTTOP.DEXT5.util.replaceAll(a,"</v:shape>","</span>");a=DEXTTOP.DEXT5.util.replaceAll(a,"<v:imagedata","<img border=0");a=DEXTTOP.DEXT5.util.replaceAll(a,"\x3c!--StartFragment--\x3e","");a=DEXTTOP.DEXT5.util.replaceAll(a,"\x3c!--EndFragment--\x3e","");k=a.indexOf("<col ");-1<k&&(a=a.substring(0,k)+"\n<colgroup>\n"+
a.substring(k,a.length+1));k=a.indexOf("<tr ");-1<k&&(a=a.substring(0,k)+"\n<tbody>\n"+a.substring(k,a.length+1),k=a.lastIndexOf("</table>"),-1<k&&(a=a.substring(0,k)+"\n</tbody>\n"+a.substring(k,a.length+1)));a=setPasteClassStyle(e,a);"1"==DEXTTOP.G_CURREDITOR._config.officeLineFix&&(a=DEXTTOP.DEXT5.util.replaceAll(a,"border-left:none;",""),a=DEXTTOP.DEXT5.util.replaceAll(a,"border-top:none;",""),a=DEXTTOP.DEXT5.util.replaceAll(a,"border-right:none;",""),a=DEXTTOP.DEXT5.util.replaceAll(a,"border-bottom:none;",
""));a=DEXTTOP.DEXT5.util.replaceAll(a,"\r","");a=DEXTTOP.DEXT5.util.replaceAll(a,"\n","");DEXTTOP.DEXT5.util.writeLog("DEBUG","GetMsExcelHtml return - "+a,"","");return a}
function GetMsPptHtml2(a){var b=a,e,b=a.indexOf("\x3c!--tr"),c=a.indexOf("</head>");-1<b&&-1<c&&(b=a.substr(b+6),c=b.indexOf("</head>"),-1<c&&(e=b.substring(0,c),e=GetStyleMap(e)));b=a.indexOf("\x3c!--StartFragment--\x3e");c=a.indexOf("\x3c!--EndFragment--\x3e");if(-1<b&&-1<c&&(b=a.substr(b+20),c=b.indexOf("\x3c!--EndFragment--\x3e"),-1<c)){for(;;)if(a=b.indexOf("\x3c!--EndFragment--\x3e",c+18),-1<a)c=a;else break;a=b=b.substring(0,c)}a=setPasteClassStyle(e,a);"1"==DEXTTOP.G_CURREDITOR._config.officeLineFix&&
(a=DEXTTOP.DEXT5.util.replaceAll(a,"border-right:none;",""));e=RegExp("<spanstyle","ig");a=a.replace(e,"<span style");a=a.replace(e,"<p style");DEXTTOP.DEXT5.util.writeLog("DEBUG","GetMsPptHtml2 return - "+a,"","");return a}
function GetJungumHtml(a){if("1"==DEXTTOP.G_CURREDITOR._config.useHtmlProcessByWorker)return a;var b=a.indexOf("<body>"),e=a.indexOf("</body>"),c=!1;-1<b&&-1<e&&(strTemp=a.substr(b+6),e=strTemp.indexOf("</body>"),-1<e&&(a=strTemp=strTemp.substring(0,e),c=!0));if(c){b=document.createElement("div");b.innerHTML=a;a=b.getElementsByTagName("table");for(var e=a.length,d,g,c=0;c<e;c++)""!=a[c].getAttribute("width")&&(d=parseInt(a[c].getAttribute("width"),10)),""!=a[c].getAttribute("height")&&(g=parseInt(a[c].getAttribute("height"),
10)),d&&(a[c].style.width=d+"px"),g&&(a[c].style.height=g+"px");a=b.innerHTML}DEXTTOP.DEXT5.util.writeLog("DEBUG","GetJungumHtml return - "+a,"","");return a}
function GetHanHwpHtml(a){var b=a,b=">\x3c!--p.0",e="</head>",c,d=a.indexOf(b),g=a.indexOf(e);-1==d&&(b=">\r\n\x3c!--p.0",d=a.indexOf(b));-1==d&&(b="\x3c!--p.0",d=a.indexOf(b));-1==g&&(e="</HEAD>",g=a.indexOf(e));-1<d&&-1<g&&(b=a.substr(d+b.length),g=b.indexOf(e),-1<g&&(c=b.substring(0,g),c=GetStyleMap(c)));var b=a,f=!1,h="\x3c!--StartFragment--\x3e",e="\x3c!--EndFragment--\x3e",g=a.indexOf(h),d=a.indexOf(e);if(-1<g&&-1<d&&(b=a.substr(g+h.length),d=b.indexOf(e),-1<d)){for(;;)if(f=b.indexOf(e,d+e.length),
-1<f)d=f;else break;b=b.substring(0,d);f=!0}if(f){f=!1;a=b;h="\x3c!--[if gte vml 1]>";e="<![if !vml]>";try{for(;;){g=a.indexOf(h);-1<g&&(d=a.indexOf(e,g+h.length));var k=a.length;if(k>g||k>d){a=DEXTTOP.DEXT5.util.replaceAll(a,h,"");a=DEXTTOP.DEXT5.util.replaceAll(a,e,"");break}if(-1<g&&-1<d)if(g>d){var l,b=a.substring(0,g);l=a.substr(g);b=DEXTTOP.DEXT5.util.replaceAll(b,e,"");a=b+l}else b=a.substring(0,g),l=a.substr(d+e.length),a=b+l,f=!0;else break}}catch(m){}}a=setPasteClassStyle(c,a);f&&(a=DEXTTOP.DEXT5.util.replaceAll(a,
"/><![endif]>"," />"),a=DEXTTOP.DEXT5.util.replaceAll(a,"</span><![endif]>","</span>"),a=DEXTTOP.DEXT5.util.replaceAll(a,"<![endif]>",""),a=DEXTTOP.DEXT5.util.replaceAll(a,"<![if !vml]>",""));a=DEXTTOP.DEXT5.util.replaceAll(a,"<![if !supportEmptyParas]>&nbsp;<![endif]>","");a=DEXTTOP.DEXT5.util.replaceAll(a,"<![endif]>","");a=DEXTTOP.DEXT5.util.replaceAll(a,"background:#ffffff;","");a=DEXTTOP.DEXT5.util.replaceAll(a,"mso-fareast-","");a=DEXTTOP.DEXT5.util.replaceAll(a,"mso-hansi-","");a=DEXTTOP.DEXT5.util.replaceAll(a,
"mso-ascii-","");a=DEXTTOP.DEXT5.util.replaceAll(a,"mso-bidi-","");a=DEXTTOP.DEXT5.util.replaceAll(a,"mso-","");DEXTTOP.DEXT5.util.writeLog("DEBUG","GetHanHwpHtml return - "+a,"","");return a}
function GetStyleMap(a){var b={};a=a.split("}");for(var e="",c=a.length,d=0;d<c;d++){var g=a[d].split("{"),f=g.length;if(2==f)for(var h=0;h<f-1;h++){var k=g[h],l=g[h+1],k=k.replace(/\r\n/g,""),k=k.replace(/\r/g,""),k=k.replace(/\n/g,""),k=k.replace(/\t/g,""),l=l.replace(/\r\n/g,""),l=l.replace(/\r/g,""),l=l.replace(/\n/g,""),l=l.replace(/\t/g,"");""==e&&"td"==k&&(e=l=DEXTTOP.DEXT5.util.replaceAll(l,"'",'"'));0<k.length&&(l=DEXTTOP.DEXT5.util.replaceAll(l,"'",'"'),"."==k.substring(0,1)&&0<e.length?
b[k]=e+l:b[k]=l)}}return b}
function RepaireSpanInImageTag4MsWord(a){for(var b,e,c,d,g;;)if(b="<v:shape ",e=a.indexOf(b),-1==e&&(b="<v:shape\r\n",e=a.indexOf(b)),-1<e)if(c=a.indexOf("</v:shape>",e+b.length),d=a.indexOf("<v:imagedata",e+b.length),-1<c&&-1<d&&d<c)if(g=a.indexOf("/>",d+12),-1<g)d=a.substring(0,e),e=a.substr(e,g-e+2),a=a.substr(c+10),e=DEXTTOP.DEXT5.util.replaceAll(e,"<v:imagedata"," "),e=DEXTTOP.DEXT5.util.replaceAll(e,b,"<v:imagedata "),e=DEXTTOP.DEXT5.util.replaceAll(e,">"," "),e=DEXTTOP.DEXT5.util.rtrim(e),e+=
">",e=DEXTTOP.DEXT5.util.replaceAll(e,"/>"," />"),e=DEXTTOP.DEXT5.util.replaceAll(e,"  "," "),a=d+e+a;else break;else break;else break;return a}
function setPasteClassStyle(a,b,e){for(var c in a){var d=a[c],d=DEXTTOP.DEXT5.util.replaceAll(d,"hairline ","dotted "),d=DEXTTOP.DEXT5.util.replaceAll(d," hairline;"," dotted;"),d=DEXTTOP.DEXT5.util.replaceAll(d,"dot-dot-dash ","dotted "),d=DEXTTOP.DEXT5.util.replaceAll(d," dot-dot-dash;"," dotted;"),d=DEXTTOP.DEXT5.util.replaceAll(d,"dot-dash ","dotted "),d=DEXTTOP.DEXT5.util.replaceAll(d," dot-dash;"," dotted;"),d=DEXTTOP.DEXT5.util.replaceAll(d,"dot-dash-slanted ","dotted "),d=DEXTTOP.DEXT5.util.replaceAll(d,
" dot-dash-slanted;"," dotted;");c=c.split(",")[0];c=c.substring(c.indexOf("."));if("."==c.substring(0,1))for(var g=new RegExp("<[^>]*class=(\"|'|)"+c.substr(1)+"[\\s\\S]*?>","i"),f;f=g.exec(b);){var h=b.substring(0,f.index),k=f[0].toString();b=b.substr(f.index+f[0].length);f=/style=("|'|)/i;if(1==f.test(k)){var l=RegExp.$1;"'"==l?d=d.replace(/'/gi,'"'):'"'==l&&(d=d.replace(/"/gi,"'"));k=k.replace(f,"style="+l+d+" ");f=new RegExp("class=(\"|'|)"+c.substr(1)+"(\"|'|)","i");k=k.replace(f,"")}else f=
new RegExp("class=(\"|'|)"+c.substr(1)+"(\"|'|)","i"),k=k.replace(f,"style='"+d+"'");b=h+k+b}if(e&&(h=c.toLowerCase(),-1<h.indexOf("h1")||-1<h.indexOf("h2")||-1<h.indexOf("h3")||-1<h.indexOf("h4")||-1<h.indexOf("h5")||-1<h.indexOf("h6"))&&(d=GetFontSizeForWordH1ToH7Tag(d),""!=d))for(var g=new RegExp("<"+c+"[^>]*>","igm"),g=b.match(g),l=g.length,m=0;l>m;m++)h=b.substring(0,b.indexOf(g[m])),k=g[m],b=b.substring(b.indexOf(g[m])+g[m].length),f=/(style=("|'|))/i,1==f.test(k)?k=k.replace(f,RegExp.$1+d):
(f=new RegExp("<"+c,"i"),k=k.replace(f,"<"+c+" style='"+d+"'")),b=h+k+b}DEXTTOP.DEXT5.util.writeLog("DEBUG","setPasteClassStyle return - "+b,"","");return b}function GetFontSizeForWordH1ToH7Tag(a){var b="",e=a.indexOf("font-size");-1<e&&(a=a.substr(e),e=a.indexOf(";"),-1<e&&(b=a.substring(0,e),b+=";"));return b}
function isHwpPasteAction(a){if(-1<a.indexOf(">\x3c!--p.")||-1<a.indexOf('<META NAME="Generator" CONTENT="Hancom HWP')||-1<a.indexOf("\x3c!--[if !supportEmptyParas]--\x3e"))return!0;DEXTTOP.DEXT5.util.writeLog("DEBUG","isHwpPasteAction return - false","","");return!1}
"undefined"==typeof DEXTTOP.DEXT5.util.officeClean&&(DEXTTOP.DEXT5.util.officeClean=function(a,b){if(""==a||void 0==a)return"";var e=null,c=[];a=a.replace(/\.0px/g,"px");a=a.replace(/\t/g,"");a=DEXTTOP.DEXT5.util.removeOfficeDummyTag(a,"\x3c!--[if supportFields]>","<![endif]--\x3e");e=RegExp("<o:p></o:p>","gi");a=a.replace(e,"");e=RegExp("<o:p>\\s+</o:p>","gi");a=a.replace(e,"");e=RegExp("<o:p ([^>]+)></o:p>","gi");a=a.replace(e,"");e=RegExp("<o:p ([^>]+)>\\s+</o:p>","gi");a=a.replace(e,"");a=a.replace(/\slang=[\"]?en-us[\"]?/gi,
"");"1"==DEXTTOP.G_CURREDITOR._config.removeMsoClass&&(a=a.replace(/\sclass=[\"]?(mso)\w+[\"]?/gi,""));a=a.replace(/&quot;/gi,"&quot_dext");e=RegExp('mso-[^:]+:[^;">]+;',"gi");a=a.replace(e,"");e=RegExp('mso-[^:]+:[^;">]+("|\')',"gi");a=a.replace(e,"$1");a=a.replace(/&quot_dext/gi,"&quot;");a=DEXTTOP.DEXT5.util.replaceAll(a,"hairline","dotted");for(var d=0;5>d;d++){for(var c=["o:p","span","font"],g=c.length,f=0;f<g;f++)e=new RegExp("<"+c[f]+"[^>]*></"+c[f]+">","gi"),a=a.replace(e,""),e=new RegExp("<"+
c[f]+"[^>]*>&nbsp;</"+c[f]+">","gi"),a=a.replace(e,"&nbsp;"),"span"!=c[f]&&(e=new RegExp("<"+c[f]+"[^>]*> </"+c[f]+">","gi"),a=a.replace(e,"&nbsp;"));c=["o","v","w","m","x"];g=c.length;for(f=0;f<g;f++)0==f&&(a=a.replace(/<o:p/gi,"<dexto:p")),e=new RegExp("<"+c[f]+":[^/>]+/>","gi"),a=a.replace(e,""),e=new RegExp("<"+c[f]+":[^>]+>[^<]*</"+c[f]+":[^>]+>","gi"),a=a.replace(e,""),f==g-1&&(a=a.replace(/<dexto:p/gi,"<o:p"))}a=a.replace(/style=""/gi,"");a=a.replace(/style=''/gi,"");a=a.replace(/\s>/gi,">");
a=DEXTTOP.DEXT5.util.replaceOneSpaceToNbsp(a);a=a.replace(/<\/td>&nbsp;<\/tr>/g,"</td></tr>");a=a.replace(/<\/td>&nbsp;<\/td>/g,"</td></td>");a=a.replace(/<\/th>&nbsp;<\/tr>/g,"</th></tr>");a=a.replace(/<\/th>&nbsp;<\/th>/g,"</th></th>");if(DEXTTOP.DEXT5.browser.ie&&10>DEXTTOP.DEXT5.browser.ieVersion){var e=a.length,f=c=!1,h=g="",k="";if(-1==a.indexOf("<")&&-1==a.indexOf(">"))for(d=0;d<e;d++)g=a.charAt(d),h=a.charAt(d+1)," "!=g&&32!=g.charCodeAt(0)||" "!=h&&32!=h.charCodeAt(0)||(g="&nbsp;"),k+=g;
else for(d=0;d<e;d++)g=a.charAt(d),h=a.charAt(d+1),"<"==g?(c=!1,f="p"==h.toLowerCase()?!0:!1):">"==g&&1==f?c=!0:1!=c||" "!=g&&32!=g.charCodeAt(0)||" "!=h&&32!=h.charCodeAt(0)||(g="&nbsp;"),k+=g;a=k}0==b&&(a=DEXTTOP.DEXT5.util.removeLocalFileImage(a));return a});
"undefined"==typeof DEXTTOP.DEXT5.util.removeLocalFileImage&&(DEXTTOP.DEXT5.util.removeLocalFileImage=function(a){if(""==a||void 0==a)return"";a=a.replace(/file:\/\/\//gi,"dext_local_file_image");reg_exp=RegExp("<img[^>]+dext_local_file_image[^>]+>","gi");return a=a.replace(reg_exp,"")});
"undefined"==typeof DEXTTOP.DEXT5.util.removeOfficeDummyTag&&(DEXTTOP.DEXT5.util.removeOfficeDummyTag=function(a,b,e){var c=a;try{for(var d=a.indexOf(b),g=a.indexOf(e);-1<d&&-1<g;)var f=c.substring(0,d),h=c.substring(g+e.length),c=f+h,d=c.indexOf(b),g=c.indexOf(e)}catch(k){c=a}return c});"undefined"==typeof DEXTTOP.DEXT5.util.replaceAll&&(DEXTTOP.DEXT5.util.replaceAll=function(a,b,e){a&&""!=a&&(a=a.split(b).join(e));return a});
"undefined"==typeof DEXTTOP.DEXT5.util.replaceOneSpaceToNbsp&&(DEXTTOP.DEXT5.util.replaceOneSpaceToNbsp=function(a){var b=a,e,c="";try{for(var d="span font a b strong i em strike u sup sub".split(" "),g=d.length,f=0;f<g;f++)for(var h=0;h<g;h++){c=b;e=new RegExp("<"+d[f]+" *([^>?+])*>(\\s+)</"+d[h]+">","gi");reg_exp2="u"==d[h]?new RegExp("</"+d[f]+">(\\s+)<"+d[h]+"[^l]","gi"):new RegExp("</"+d[f]+">(\\s+)<"+d[h]+" *([^>?+])*>","gi");reg_exp3=new RegExp("<"+d[f]+" *([^>?+])*>(\\s+)<"+d[h]+">","gi");
reg_exp4="u"==d[h]?new RegExp("</"+d[f]+">(\\s+)</"+d[h]+"[^l]","gi"):new RegExp("</"+d[f]+">(\\s+)</"+d[h]+" *([^>?+])*>","gi");try{var k=b.match(e);if(k)for(var l=k.length,m=0;m<l;m++)var n=k[m],p=/>\s+</.exec(n),q=p[0].replace(RegExp("\\s\\s","gi"),"&nbsp;&nbsp;"),n=n.replace(p,q),b=b.replace(k[m],n);if(k=b.match(reg_exp2))for(l=k.length,m=0;m<l;m++)n=k[m],"b"==d[h]&&-1<match_string.toLowerCase().indexOf("<br")||(p=/>\s+</.exec(n),q=p[0].replace(RegExp("\\s\\s","gi"),"&nbsp;&nbsp;"),n=n.replace(p,
q),b=b.replace(k[m],n));if(k=b.match(reg_exp3))for(l=k.length,m=0;m<l;m++)n=k[m],"b"==d[f]&&-1<match_string.toLowerCase().indexOf("<br")||(p=/>\s+</.exec(n),q=p[0].replace(RegExp("\\s\\s","gi"),"&nbsp;&nbsp;"),n=n.replace(p,q),b=b.replace(k[m],n));if(k=b.match(reg_exp4))for(l=k.length,m=0;m<l;m++)n=k[m],p=/>\s+</.exec(n),q=p[0].replace(RegExp("\\s\\s","gi"),"&nbsp;&nbsp;"),n=n.replace(p,q),b=b.replace(k[m],n)}catch(r){b=c}}for(f=0;f<g;f++)for(h=0;h<g;h++)c="","b"==d[h]?c="[^r]":"u"==d[h]&&(c="[^l]"),
e=new RegExp("/"+d[f]+">\\s<"+d[h]+c,"gi"),b=b.replace(e,"/"+d[f]+">&nbsp;<"+d[h]),e=new RegExp("/"+d[f]+">\\s\\n<"+d[h]+c,"gi"),b=b.replace(e,"/"+d[f]+">&nbsp;<"+d[h])}catch(t){b=a,DEXTTOP.DEXT5.util.writeLog("ERROR","util.replaceOneSpaceToNbsp - "+t.message,"","")}DEXTTOP.DEXT5.util.writeLog("DEBUG","util.replaceOneSpaceToNbsp return - "+b,"","");return b});"undefined"==typeof DEXTTOP.DEXT5.util.rtrim&&(DEXTTOP.DEXT5.util.rtrim=function(a){return""==a?a:a.replace(/\s+$/,"")});
