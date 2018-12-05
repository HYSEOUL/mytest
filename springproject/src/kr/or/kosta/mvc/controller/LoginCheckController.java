package kr.or.kosta.mvc.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.kosta.mvc.dao.UserMemberInter;
import kr.or.kosta.vo.UserMemberVO;

@Controller
public class LoginCheckController {

	// Dao를 주입
	@Autowired
	private UserMemberInter userMemberInter;

	@RequestMapping(value = "/loginform")
	public String loginForm() {
		return "loginform";
	}
	
	@RequestMapping(value = "/pushform")
	public String pushForm() {
		return "pushform";
	}

	@PostMapping("/loginProcess")
	public ModelAndView loginfProcess(HttpSession session, 
			HttpServletRequest request, UserMemberVO vo,
			@RequestHeader("User-Agent") String userAgent) {
		System.out.println("id : " + vo.getId());
		System.out.println("pwd : " + vo.getPwd());
		System.out.println("userAgent : " + userAgent);
		UserMemberVO map = userMemberInter.loginChk(vo);
		ModelAndView mav = new ModelAndView();
		if (map == null) {
			mav.setViewName("error");
		} else { // 로그인 성공
			session.setAttribute("num", map.getNum());
			session.setAttribute("id", map.getId());
			session.setAttribute("name", map.getName());
			session.setAttribute("birth", map.getBirth());
			mav.setViewName("index");
		}
		return mav;
	}
	
	@GetMapping("/logout")
	public ModelAndView loginfoutProcess(HttpSession session, HttpServletRequest request) {
		session.removeAttribute("num");
		session.removeAttribute("id"); // 로그인한 사용자의 세션 삭제
		session.removeAttribute("name");
		session.removeAttribute("birth");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
	
	

	/*
	 * @GetMapping("/logout") public ModelAndView loginfoutProcess(HttpSession
	 * session, HttpServletRequest request) { session.removeAttribute("uname");
	 * session.removeAttribute("uid"); // 로그인한 사용자의 세션 삭제 ModelAndView mav = new
	 * ModelAndView(); mav.setViewName("redirect:/"); return mav; }
	 */
}
