package kr.or.kosta.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.kosta.mvc.dao.PushAlarmInter;
import kr.or.kosta.vo.PushAlarmLoggerDTO;
import kr.or.kosta.vo.UserMemberVO;

@Controller
public class DefaultController {
	
	@Autowired
	private PushAlarmInter pushAlarmInter;
	
	@RequestMapping("/")
	public String defaultView() {
		return "index";
	}

	@RequestMapping("/pushtest")
	public String pushtestView() {
		return "pushtest";
	}

	@PostMapping("/pushAlarm")
	public ModelAndView pushAlarmProcess(HttpSession session,
			HttpServletRequest request, UserMemberVO vo,
			@RequestHeader("User-Agent") String userAgent) {
		System.out.println("pushAlarmProcess");
		ModelAndView mav = new ModelAndView();
		PushAlarmLoggerDTO dto = new PushAlarmLoggerDTO();
		String id = (String) session.getAttribute("id");
		System.out.println("id " + id);
		if (id != null) {
			dto.setIdn(id);
			dto.setStatus("pushAlarm");
			dto.setReip(request.getRemoteAddr());
			dto.setUagent("web");
			pushAlarmInter.addPushAlarmLogging(dto);
		}
		mav.setViewName("redirect:/pushtest");
		return mav;
	}
}
