package softdb.monitor.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

import softdb.common.web.BaseController;
import softdb.monitor.service.CounselService;

@Controller
public class CounselController extends BaseController {
	@Resource(name = "counselService")
	private CounselService counselService;
	
	@Autowired
	@Qualifier("JacksonJsonView")
	protected View jsonView;
	
	@RequestMapping(value = "/counsel/counselMain.do")
	public String counselMain(HttpServletRequest req, Model model, @RequestParam Map params) throws Exception {
		System.out.println("params : " + params);
		System.out.println("counselMain");
		
		//return "softdb/main/detailMain";
		return "softdb/counsel/counselList";
	}
	
	@RequestMapping(value = "/counsel/ajaxCounselList.do")
	public View counselList(HttpServletRequest req, Model model,@RequestParam Map params) throws Exception{
		try {
			List list = counselService.selectCounselList(params);
			System.out.println("CounselList : " + list);
			model.addAttribute("result", list);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return jsonView;
		
	}
	
	@RequestMapping(value = "/counsel/ajaxUserList.do")
	public View userList(HttpServletRequest req, Model model,@RequestParam Map params) throws Exception{
		try {
			List list = counselService.selectUserList(params);
			System.out.println("userList : " + list);
			model.addAttribute("result", list);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return jsonView;
		
	}
	
	@RequestMapping(value = "/counsel/ajaxCodeList.do")
	public View codeList(HttpServletRequest req, Model model,@RequestParam Map params) throws Exception{
		try {
			List list = counselService.selectCodeList(params);
			System.out.println("codeList : " + list);
			model.addAttribute("result", list);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return jsonView;
		
	}
	
	@RequestMapping(value = "/counsel/ajaxCtgCodeList.do")
	public View CtgCodeList(HttpServletRequest req, Model model,@RequestParam Map params) throws Exception{
		try {
			List list = counselService.selectCtgCodeList(params);
			System.out.println("ctgCodeList : " + list);
			model.addAttribute("result", list);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return jsonView;
		
	}
	
	@RequestMapping(value = "/ajax/main/CommonSetObjList.do")
	public View CategoryObjList(HttpServletRequest req, Model model,@RequestParam Map params) throws Exception{
		try {
			List list = counselService.selectCategoryObjList(params);
			System.out.println("CategoryObjList : " + list);
			model.addAttribute("result", list);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return jsonView;
		
	}
}
