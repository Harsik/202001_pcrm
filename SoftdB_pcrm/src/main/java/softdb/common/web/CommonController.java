package softdb.common.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

import egovframework.com.cmm.EgovMessageSource;
import softdb.common.service.CommonService;


@Controller
public class CommonController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

	@Resource(name = "commonService")
	private CommonService commonService;
	
	@Autowired
	@Qualifier("JacksonJsonView")
	protected View jsonView;
	
	
	@RequestMapping(value="/softdb/common/selectBoxGrade.do")
	public View selectBoxGrade(HttpServletRequest req, ModelMap model, @RequestParam Map params) throws Exception {
		try {
			Map reParam = refinedParam(req, params);
			
			List list = commonService.usrAuthList(reParam);
			logger.debug(">>> list : " + list);
			responseModelMapping(model, list);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("result", "true");
		
		return jsonView;
	}
	
	@RequestMapping(value="/softdb/common/userspec.do")
	public View userspec(HttpServletRequest req, ModelMap model, @RequestParam Map params) throws Exception {
		try {
			Map reParam = refinedParam(req, params);
			
			Map map = commonService.userspec(reParam);
			logger.debug(">>> map : " + map);
			responseModelMapping(model, map);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("result", "true");
		
		return jsonView;
	}
	
}