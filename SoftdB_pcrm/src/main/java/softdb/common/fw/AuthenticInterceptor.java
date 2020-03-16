package softdb.common.fw;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.mvc.WebContentInterceptor;

import softdb.common.service.LoginVO;

/**
 * 인증여부 체크 인터셉터
 * @author 공통서비스 개발팀 서준식

 *  </pre>
 */

public class AuthenticInterceptor extends WebContentInterceptor {

	/**
	 * 세션에 계정정보(LoginVO)가 있는지 여부로 인증 여부를 체크한다.
	 * 계정정보(LoginVO)가 없다면, 로그인 페이지로 이동한다.
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException {

//		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		HttpSession session  = request.getSession();
		LoginVO loginVO = (LoginVO) session.getAttribute("LoginVO");

		System.out.println(">>> loginVO : " + loginVO);
		if (loginVO == null || loginVO.getUsrId() == null) {
//			ModelAndView modelAndView = new ModelAndView("redirect:/uat/uia/egovLoginUsr.do");
			ModelAndView modelAndView = new ModelAndView("redirect:/softdb/loginUsr.do");
			throw new ModelAndViewDefiningException(modelAndView);
		} else {
			return true;
		}
		
	}

}
