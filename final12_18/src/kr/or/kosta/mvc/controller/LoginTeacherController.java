package kr.or.kosta.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.M_teacherVO;
import kr.or.kosta.mvc.dao.M_teacherDAOInter;

@Controller
public class LoginTeacherController {

	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(LoginTeacherController.class);

	// Dao를 주입
	@Autowired
	private M_teacherDAOInter m_teacherDAOInter;
	
	@RequestMapping(value="/login_T")
	public String loginTeacher() {
		return "login_teacher_Form";
	}
	
	@RequestMapping(value="/teacher_loginProcess")//teacher_loginProcess
	public ModelAndView loginfProcess(HttpSession session, 
			HttpServletRequest request, String mt_id, String mt_pwd,
			@RequestHeader("User-Agent") String userAgent) throws Exception{
		
		M_teacherVO mtvo = new M_teacherVO();
		if (mt_id != null && mt_pwd != null) {
			mtvo = m_teacherDAOInter.readM_teacherLogin(mt_id, mt_pwd);
		}
		
		System.out.println(userAgent);
		System.out.println("확인"+mtvo);
		
		ModelAndView mav = new ModelAndView();
		if (mtvo == null) {
			mav.setViewName("error");
		} else {	//로그인성공
			session.setAttribute("mt_num", mtvo.getMt_num());
			session.setAttribute("mt_id", mtvo.getMt_id());
			mav.setViewName("redirect:/");
		}		
		return mav;		
	}
	
	@GetMapping("/teacher_logout")
	public ModelAndView loginfoutProcess(HttpSession session, HttpServletRequest request) {
		session.removeAttribute("mt_num");
		session.removeAttribute("mt_id");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;		
	}
}
