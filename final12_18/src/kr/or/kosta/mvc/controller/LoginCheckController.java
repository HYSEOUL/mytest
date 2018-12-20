package kr.or.kosta.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.M_studentVO;
import kr.or.kosta.mvc.dao.M_studentDAOInter;

@Controller
public class LoginCheckController {

	//private static final Logger logger = LoggerFactory.getLogger(LoginCheckController.class);

	// Dao를 주입
	@Autowired
	private M_studentDAOInter m_studentDAOInter;

	@RequestMapping(value = "/loginform")
	public String loginForm() {
		return "login_student_Form";
	}

	@PostMapping("/loginProcess")
	public ModelAndView loginfProcess(HttpSession session, 
			HttpServletRequest request, String ms_id, String ms_pwd,
			@RequestHeader("User-Agent") String userAgent) throws Exception {

		M_studentVO msvo = new M_studentVO();
		if (ms_id != null && ms_pwd != null) {
			msvo = m_studentDAOInter.readLoginM_studentInfo(ms_id, ms_pwd);
		}

		System.out.println("userAgent : " + userAgent);

		ModelAndView mav = new ModelAndView();
		if (msvo == null) {
			mav.setViewName("error");
		} else { // 로그인 성공
			session.setAttribute("ms_num", msvo.getMs_num());
			session.setAttribute("ms_id", msvo.getMs_id());
			mav.setViewName("index");
		}
		return mav;
	}

	@GetMapping("/logout")
	public ModelAndView loginfoutProcess(HttpSession session, HttpServletRequest request) {
		session.removeAttribute("ms_num");
		session.removeAttribute("ms_id"); // 로그인한 사용자의 세션 삭제
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
}
