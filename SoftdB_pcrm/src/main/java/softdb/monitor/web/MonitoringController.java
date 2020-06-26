package softdb.monitor.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

import egovframework.com.cmm.EgovMessageSource;
import softdb.common.service.LoginVO;
import softdb.common.web.BaseController;
//import egovframework.com.cmm.util.EgovUserDetailsHelper;
import softdb.monitor.service.MonitoringService;


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
public class MonitoringController extends BaseController {

	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

	@Resource(name = "monitoringService")
	private MonitoringService monitoringService;
	
	@Autowired
	@Qualifier("JacksonJsonView")
	protected View jsonView;
	
	@Value(value="${ptcc.pcrm.referer.host}")
	private String gRef;
	
	@Value("${ptcc.pcrm.referer.endUrl}")
	private String endUrl;
	
	@RequestMapping(value="/monitor/MonitoringMapView.do")
 	public String monitoringHome (HttpServletRequest req, ModelMap model) throws Exception {
//		System.out.println(">>> gProperty referer : " +  gRef);
//		System.out.println(">>> gProperty endUrl : " +  endUrl);
		if (!checkAuthority(req, model)) {
			String reqUsrId = req.getParameter("reqUsrId");
			System.out.println(">>> reqUsrId : " + reqUsrId);
			String referer = req.getHeader("referer");
			System.out.println(">>> referer : " + referer);	// http://localhost:8080/web/civilservice/civilServiceWork.do
			
			// PRCM 권한을 갖고 링크 타고 들어 온 경우
			if(referer != null && referer.contains(gRef) && referer.endsWith(endUrl) && reqUsrId != null && !reqUsrId.equals("")) {
				System.out.println("=====PRCM 권한을 갖고 링크 타고 들어 온 경우");
				// login 처리
				LoginVO resultVO = new LoginVO();
				resultVO.setUsrId(reqUsrId);
				req.getSession().setAttribute("LoginVO", resultVO);
				System.out.println("여기---------------"+resultVO);
				return "/softdb/monitor/MonitoringMapView";
			}
			
			// 그냥 URL 접근하거나 링크는 타고 왔어도 형식이 맞지 않는 경우 Login 페이지 이동 
			System.out.println("=====일반 권한을 갖고 링크 타고 들어 온 경우");
			String cPath = req.getContextPath();
			String url = req.getRequestURL().toString();
			if(url != null) {
				String[] parsed = url.split("/");
				if(parsed.length > 1 && parsed[0].startsWith("http")) {
					parsed =  url.split(parsed[2] + cPath);
					url = parsed[1];
				}
				System.out.println(">>> url : " + url);
				model.put("url", url);
			}
			return "softdb/login/LoginUsr";	// server-side 권한 확인
		}
		
		List list = monitoringService.selectMonitoringList(new HashMap());
		System.out.println(">>> result " + list.toString());
		return "/softdb/monitor/MonitoringMapView";
	}    

	@RequestMapping(value = "/monitor/ajaxRtData.do")
	public View api5(HttpServletRequest req, Model model, @RequestParam Map params) throws Exception {
		try {
			System.out.println("params : " + params);
			List list = monitoringService.selectMainChartList(params);
			System.out.println("chart list : " + list);
			model.addAttribute("result", list);
//			List ctgList = monitoringService.selectCtgList(params);
//			System.out.println("code ctgList : " + ctgList);
//			model.addAttribute("ctgList", ctgList);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
//		model.addAttribute("result", "true");
		return jsonView;
	}
	
	@RequestMapping(value = "/monitor/ajaxCodeList.do")
	public View ajaxCodeList(HttpServletRequest req, Model model, @RequestParam Map params) throws Exception {
		try {
			System.out.println("params : " + params);
			List list = monitoringService.selectCodeList(params);
			System.out.println("code list : " + list);
			model.addAttribute("result", list);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
//		model.addAttribute("result", "true");
		return jsonView;
	}
	
	@RequestMapping(value = "/monitor/ajaxCtgList.do")
	public String ajaxCtgList(HttpServletRequest req, Model model, @RequestParam Map params) throws Exception {
		try {
			System.out.println("params : " + params);
			List ctgList = monitoringService.selectCtgList(params);
			System.out.println("code ctgList : " + ctgList);
			model.addAttribute("ctgList", ctgList);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
//		model.addAttribute("result", "true");
		return  "softdb/monitor/MonitoringMapView";
	}
	
	@RequestMapping(value = "/monitor/detailMain.do")
	public String detailMain(HttpServletRequest req, Model model, @RequestParam Map params) throws Exception {
		System.out.println("params : " + params);
		
		
		//return "softdb/main/detailMain";
		return "softdb/monitor/MonitoringMapDetail";
	}

	@RequestMapping(value = "/monitor/ajaxRtCounselList.do")
	public View ajaxRtCounselList(HttpServletRequest req, Model model, @RequestParam Map params) throws Exception {
		try {
			System.out.println("params : " + params);
			List list = monitoringService.selectRtCounseltList(params);
			System.out.println("result : " + list);
			model.addAttribute("rMap", list);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("result", "true");
		return jsonView;
	}
	
}