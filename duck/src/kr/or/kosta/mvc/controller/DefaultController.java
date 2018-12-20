package kr.or.kosta.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dto.ClassadVO;
import dto.M_studentVO;
import dto.PushAlarmLoggerDTO;
import kr.or.kosta.mvc.dao.ClassadDAO;
import kr.or.kosta.mvc.dao.PushAlarmInter;

@Controller
public class DefaultController {
	
	@Autowired
	private PushAlarmInter pushAlarmInter;
	
	
	@Autowired
	private ClassadDAO classadDAO;
	
	/*@RequestMapping("/main")
	public String defaultView() {
		return "index";
	}*/
	
	@RequestMapping(value="/")
	public String defaultView(ClassadVO advo, Model m) {
		List<ClassadVO> classadVO = classadDAO.adVO();
		m.addAttribute("classadVO", classadVO);
		return "index";
	}
	
	@RequestMapping(value="/advertising")
	public ModelAndView ahrefMove(int ad_num) {
		ModelAndView mav = new ModelAndView();
		ClassadVO advo = new ClassadVO();
		System.out.println(ad_num);
		advo = classadDAO.adSelectOne(ad_num);
		mav.addObject("advo", advo);
		mav.setViewName("advertise");
		return mav;
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
