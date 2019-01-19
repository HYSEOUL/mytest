package kr.or.kosta.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.T_mileageVO;
import kr.or.kosta.mvc.dao.Mt_mileageDAO;

@Controller
public class T_mileageController {

	@Autowired
	private Mt_mileageDAO tmdao;
	
	@RequestMapping("/tmileage")
	   public String tmileage() {
	      return "t_mileage_Form";
	}
	
	// 포인트 조회
	@RequestMapping("/mileageForm_teacher")
	public String tm_point_s(Model m, HttpSession session) {
		String mt_id = (String) session.getAttribute("mt_id");
		T_mileageVO tmvo = tmdao.t_mileageRead(mt_id);
		m.addAttribute("tmvo",tmvo);
		return "mypage_teacher_mileage";
	}
			
	
	// 포인트 수정
	@RequestMapping("/t_mileageupdate")
	public String t_mileageupdate_update(Model m,T_mileageVO tmvo) {
		tmdao.t_mileageupdate(tmvo);
		return "redirect:/mileageForm_teacher";
	}
	

		
	
}
