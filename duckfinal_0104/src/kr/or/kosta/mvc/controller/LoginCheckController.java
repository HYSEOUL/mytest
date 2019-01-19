package kr.or.kosta.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.ClassadVO;
import dto.M_studentVO;
import dto.StudyadVO;
import kr.or.kosta.mvc.dao.ClassadDAO;
import kr.or.kosta.mvc.dao.M_studentDAOInter;
import kr.or.kosta.mvc.dao.StudyadDAO;

@Controller
public class LoginCheckController {

	// private static final Logger logger =
	// LoggerFactory.getLogger(LoginCheckController.class);

	// Dao�� ����
	@Autowired
	private M_studentDAOInter m_studentDAOInter;

	@Autowired
	private ClassadDAO classadDAO;

	@Autowired
	private StudyadDAO studyadDAO;

	@RequestMapping(value = "/loginform")
	public String loginForm() {
		return "login_student_Form";
	}

	@PostMapping("/loginProcess")
	public ModelAndView loginfProcess(HttpSession session, HttpServletRequest request, String ms_id, String ms_pwd,
			@RequestHeader("User-Agent") String userAgent) throws Exception {

		M_studentVO msvo = new M_studentVO();
		if (ms_id != null && ms_pwd != null) {
			System.out.println(ms_id);
			System.out.println(ms_pwd);
			msvo = m_studentDAOInter.readLoginM_studentInfo(ms_id, ms_pwd);
		}

		System.out.println("userAgent : " + userAgent);

		ModelAndView mav = new ModelAndView();
		List<ClassadVO> classadVO = classadDAO.adClassVO();
		List<StudyadVO> studyadVO = studyadDAO.adStudyVO();
		
		try {
			session.setAttribute("ms_num", msvo.getMs_num());
			session.setAttribute("ms_id", msvo.getMs_id());
			mav.addObject("classadVO", classadVO);
			mav.addObject("studyadVO", studyadVO);
			mav.setViewName("index");
		} catch (NullPointerException e) {
			mav.setViewName("choiseLogin");
			mav.addObject("fail", "fail");
		}
		return mav;
	}

	@GetMapping("/logout")
	public ModelAndView loginfoutProcess(HttpSession session, HttpServletRequest request) {
		session.removeAttribute("ms_num");
		session.removeAttribute("ms_id");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}

}
