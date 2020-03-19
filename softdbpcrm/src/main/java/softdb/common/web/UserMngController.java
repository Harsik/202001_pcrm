package softdb.common.web;

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
import softdb.common.service.UserMngService;


/**
 * 
 * 공휴일에 관한 요청을 받아 서비스 클래스로 요청을 전달하고 서비스클래스에서 처리한 결과를 웹 화면으로 전달을 위한 Controller를 정의한다
 * @author 공통서비스 개발팀 이중호
 * @since 2009.04.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.01  이중호          최초 생성
 *
 * </pre>
 */
@Controller
public class UserMngController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(UserMngController.class);
	
	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

	@Resource(name = "userMngService")
	private UserMngService userMngService;
	
	@Autowired
	@Qualifier("JacksonJsonView")
	protected View jsonView;
	
	@RequestMapping(value="/softdb/user/userListView.do")
	public String userListView (HttpServletRequest req, ModelMap model) throws Exception {
		
		List list = null;
		
		if (!checkAuthority(req, model)) {
//			List list = monitoringService.selectMonitoringList(new HashMap());
		}
		
		model.addAttribute("userList", list);
		
		return "/softdb/user/userManagement";
	}
	
	@RequestMapping(value="/softdb/jqgrid/user/userList.do")
	public View jqUuserList (HttpServletRequest req, ModelMap model, @RequestParam Map params) throws Exception {
		try {
			Map reParam = refinedParam(req, params);
			
			List list = userMngService.jqUuserList(reParam);
			logger.debug("chart list : " + list);
			responseModelMapping(model, list);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("result", "true");
		
		return jsonView;
	}
	
	@RequestMapping(value="/softdb/user/userManagementUpdate.do")
	public View userManagementUpdate(HttpServletRequest req, ModelMap model, @RequestParam Map params) throws Exception {
		try {
			Map reParam = refinedParam(req, params);
			
			int result = userMngService.om001Update(reParam);
			logger.debug(">>> result : " + result);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("result", "true");
		
		return jsonView;
	}
	
	@RequestMapping(value="/softdb/user/userManagementInsert.do")
	public View userManagementInsert(HttpServletRequest req, ModelMap model, @RequestParam Map params) throws Exception {
		try {
			Map reParam = refinedParam(req, params);
			
			int result = userMngService.om001Insert(reParam);
			logger.debug(">>> result : " + result);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("result", "true");
		
		return jsonView;
	}
	
	@RequestMapping(value="/softdb/user/userAuthUpdate.do")
	public View userAuthUpdate(HttpServletRequest req, ModelMap model, @RequestParam Map params) throws Exception {
		try {
			Map reParam = refinedParam(req, params);
			
			int result = userMngService.or002AuthUpdate(reParam);
			logger.debug(">>> result : " + result);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("result", "true");
		
		return jsonView;
	}
	
}