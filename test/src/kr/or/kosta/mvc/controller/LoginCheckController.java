package kr.or.kosta.mvc.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.kosta.dto.MyMemVO;
import kr.or.kosta.mvc.dao.MemberDaoInter;

@Controller
public class LoginCheckController {
	
	@Autowired
	private MemberDaoInter memberDaoInter;
	
	@RequestMapping(value="/loginForm")
	public String loginForm() {
		return "loginform";
	}
	
	@PostMapping("/loginProcess")
	public ModelAndView loginProcess(HttpServletRequest req, MyMemVO vo) {
		HashMap<String, String> h=new HashMap<>();
		ModelAndView mav=new ModelAndView();
		h = memberDaoInter.idChk2(vo);
		if(h!=null) {
			HttpSession session = req.getSession();
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", h.get("NAME"));
		}else {
			mav.setViewName("error");
		}
		mav.setViewName("index");
		return mav;
	}
	
	@GetMapping("/logout")
	public ModelAndView logoutProcess(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.removeAttribute("id");
		session.removeAttribute("name");
		ModelAndView mav=new ModelAndView();
		mav.setViewName("index");
		
		return mav;
	}
}