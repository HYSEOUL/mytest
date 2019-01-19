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
import org.springframework.web.servlet.ModelAndView;

import dto.ClassadVO;
import dto.M_studentVO;
import dto.StudyadVO;
import kr.or.kosta.mvc.dao.ClassadDAO;
import kr.or.kosta.mvc.dao.StudyadDAO;

@Controller
public class DefaultController {
	
	@Autowired
	private ClassadDAO classadDAO;
	
	@Autowired
	private StudyadDAO studyadDAO;
	
	@RequestMapping(value= {"/","/main"})
	public String defaultView(
			ClassadVO advo, Model m) {
		List<ClassadVO> classadVO = classadDAO.adClassVO();
		List<StudyadVO> studyadVO = studyadDAO.adStudyVO();
		m.addAttribute("classadVO", classadVO);
		m.addAttribute("studyadVO", studyadVO);
		
		return "index";
	}
	
	@RequestMapping(value="/classadd")
	public ModelAndView ahrefClassMove(int c_num) {
		ModelAndView mav = new ModelAndView();
		ClassadVO cvo = new ClassadVO();
		//StudyadVO stvo = new StudyadVO();
		System.out.println(c_num);
		cvo = classadDAO.adClassSelectOne(c_num);
		mav.addObject("cvo", cvo);
		mav.setViewName("class_add_print");
		return mav;
	}
	
	@RequestMapping(value="/studyadd")
	public ModelAndView ahrefStudyMove(int s_num) {
		ModelAndView mav = new ModelAndView();
		//ClassadVO cvo = new ClassadVO();
		StudyadVO svo = new StudyadVO();
		System.out.println(s_num);
		svo = studyadDAO.adStudySelectOne(s_num);
		mav.addObject("svo", svo);
		mav.setViewName("study_add_print");
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
}
