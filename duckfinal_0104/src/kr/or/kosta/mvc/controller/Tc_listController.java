package kr.or.kosta.mvc.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dto.Sc_listVO;
import dto.Tc_listVO;
import kr.or.kosta.mvc.dao.Tc_listDAO;

@Controller
public class Tc_listController {
	
	@Autowired
	private Tc_listDAO tc_listdao;
	
	@RequestMapping("/classForm")
	public String classForm() {
		return "class_Form";
	}
	
	//강사 개설강좌목록
	@RequestMapping("/mypage_teacher_Tc_list")
	public String mypage_teacher_tc_List(Model m,HttpSession session) {
		System.out.println("개설강좌목록 컨트롤 입성");
		String mt_id = (String) session.getAttribute("mt_id");
		System.out.println("강사 아이디는?==>"+mt_id);
		List<Tc_listVO> tclist = tc_listdao.tc_list_read(mt_id);
		m.addAttribute("tclist", tclist);
		return "mypage_teacher_tc_list";
	}
	
	@RequestMapping("/tc_list")
	public String tc_list_1(Model m,String mt_id) {
		List<Tc_listVO> tclist = tc_listdao.tc_list_read(mt_id);
		m.addAttribute("tclist", tclist);
		return "tc_list_list";
	}
	
	@RequestMapping("/createTc_list")
	public String createTc_list(Tc_listVO tcvo) {
		tc_listdao.createTc_list(tcvo);
		return "redirect:/tc_list?mt_id="+tcvo.getMt_id();
	}
	
	@RequestMapping("/deleteTc_list")
	public String deleteTc_list(int tc_num, String mt_id) {
		tc_listdao.deleteTc_list(tc_num);
		return "redirect:/tc_list?mt_id="+mt_id;
	}
	
	// 개설 강좌 학생list
	@RequestMapping("/tc_list_studentRead")
	public ModelAndView tc_list_student_Read(HttpServletRequest req ,@RequestParam String c_title, HttpSession session) throws UnsupportedEncodingException {
		req.setCharacterEncoding("EUC-KR");
		System.out.println("학생쫌 보자아@@@@@");
		System.out.println("으아아앗ㄱ"+c_title);
		List<Sc_listVO> sclist = tc_listdao.tc_list_student_read(c_title);
		int studentNum = 0;
		for(Sc_listVO sc: sclist) {
			System.out.println("나와라 호갱들"+sc.getMs_id());
			studentNum++;
		}

		String mt_id = (String) session.getAttribute("mt_id");
		List<Tc_listVO> tclist = tc_listdao.tc_list_read(mt_id);

		ModelAndView mav = new ModelAndView("mypage_teacher_tc_list");
		int titleNum = 0;
		for(Tc_listVO tcvo :tclist) {
			System.out.println("나와라 제목들 얍얍얍 "+tcvo.getC_title());
			mav.addObject("tctitle"+titleNum,tcvo.getC_title());
			titleNum++;
		}
		mav.addObject("sNum",studentNum);
		mav.addObject("tNum",titleNum);
		mav.addObject("tclist", tclist);
		mav.addObject("sclist", sclist);
		return mav;
	}

}
