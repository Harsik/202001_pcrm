DEXTTOP={DEXT5:{}};DEXTTOP.DEXT5.browser=void 0;DEXTTOP.DEXT5.util={};DEXTTOP.DEXT5.util.writeLog=function(){};DEXTTOP.G_CURREDITOR={};DEXTTOP.G_CURREDITOR._config=void 0;importScripts("editor_htmlProcessUtil.js");
self.addEventListener("message",function(a){a=a.data;var b=bak_html="";try{bak_html=a.callFnParam[0];var c=eval(a.callFn);if(c)"htmlTagRevision"==a.callFn&&importScripts("editor_htmlparser.js"),DEXTTOP.DEXT5.browser=a.editorBrowser,DEXTTOP.G_CURREDITOR._config=a.editorConfig,b=c.apply(null,a.callFnParam),"SetCorrectOfficeHtml"==a.callFn?postMessage({htmlResult:"undefined"==typeof b?bak_html:b,wordProcessorType:G_wordProcessorType}):postMessage({htmlResult:"undefined"==typeof b?bak_html:b});else throw"error";
}catch(d){postMessage({htmlResult:bak_html,errorMessage:d.message})}},!1);
