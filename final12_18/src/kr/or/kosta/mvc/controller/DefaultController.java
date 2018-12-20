package kr.or.kosta.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.M_studentVO;
import dto.PushAlarmLoggerDTO;
import kr.or.kosta.mvc.dao.PushAlarmInter;

@Controller
public class DefaultController {
	
	@Autowired
	private PushAlarmInter pushAlarmInter;
	
	@RequestMapping("/")
	public String defaultView() {
		return "index";
	}
	
	@RequestMapping("/main")
	public String defaultMainView() {
		return "index";
	}
	
	//choiseLogin.jsp	
	@RequestMapping("choiseLogin")
	public String choiseLogin() {
		return "choiseLogin";
	}
	//choiseRegister.jsp
	@RequestMapping("choiseRegister")
	public String choiseRegister() {
		return "choiseRegister";
	}
	
	
	
	@RequestMapping("/pushtest")
	public String pushtestView() {
		return "pushtest";
	}
	
	@RequestMapping("/da_HW")
	public String da_HWView() {
		return "da_HW";
	}

	@PostMapping("/pushAlarm")
	public ModelAndView pushAlarmProcess(HttpSession session,
			HttpServletRequest request, M_studentVO msvo,
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
