package softdb.common.web;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;

import com.fasterxml.jackson.databind.ObjectMapper;

import softdb.common.service.LoginVO;

public class BaseController {

	private static final Logger logger = LoggerFactory.getLogger(BaseController.class);
	
	protected boolean checkAuthority(HttpServletRequest req, ModelMap model) throws Exception {
    	// 사용자권한 처리
    	/*if(!EgovUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return false;
    	}
    	else {
    		return true;
    	}*/
		
		HttpSession session  = req.getSession();
		LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO");
		return loginVO == null ? false : true;
    }
	
	protected Map refinedParam(HttpServletRequest req, Map map) {
		logger.debug(">>> raw parameter map : " + map);
		
		Map result = new HashMap();
		Object pJson = map.get("pJson");
		ObjectMapper objectMapper = new ObjectMapper();
		if(pJson != null) {
			try {
				Map pMap = objectMapper.readValue(URLDecoder.decode(pJson.toString(), "UTF-8"), Map.class);
				System.out.println(">>> pMap : " + pMap);
				result.putAll((Map) pMap.get("map"));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		HttpSession session  = req.getSession();
		LoginVO loginVO = (LoginVO) session.getAttribute("LoginVO");
		if (loginVO != null) {
			result.put("login_usr_id", StringUtils.defaultString(loginVO.getUsrId(), ""));
			result.put("login_usr_nm", StringUtils.defaultString(loginVO.getUsrNm(), ""));
		}
		
		result.put("login_usr_ip", req.getRemoteAddr());
		result.put("page", map.get("page"));
		result.put("rows", map.get("rows"));
		result.put("sidx", map.get("sidx"));
		result.put("sord", map.get("sord"));
		
		logger.debug(">>> refined parameter map : " + result);
		
		return result;
	}
	
	protected void responseModelMapping(ModelMap model, List rList) {
		if (rList != null && !rList.isEmpty()) {
			Map map = (Map) rList.get(0);
			model.addAttribute("rows", rList);
			model.addAttribute("page", map.get("PAGENUM"));
			model.addAttribute("total", map.get("TOTPAGECOUNT"));
			model.addAttribute("records", map.get("TOTROWCOUNT"));
		} else {
			model.addAttribute("rows", null);
			model.addAttribute("page", 1);
			model.addAttribute("total", 0);
			model.addAttribute("records", 0);
		}
	}
	
	protected void responseModelMapping(ModelMap model, Map<?,?> map) {
		/*Iterator iter = (Iterator) map.keySet().iterator();
		while(iter.hasNext()) {
			String key = iter.next().toString();
			model.addAttribute(key, map.get(key));
		}*/
		if(map == null) {
			logger.debug(">>> model mapping is null !");
			return;
		}
		for (Map.Entry<?,?> entry : map.entrySet()) {
			String key = entry.getKey().toString();
			model.addAttribute(key, entry.getValue());
			model.addAttribute(key.toUpperCase(), entry.getValue());

		}
	}
	
}
