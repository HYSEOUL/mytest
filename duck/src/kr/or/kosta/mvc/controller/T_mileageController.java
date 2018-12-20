package kr.or.kosta.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.T_mileageVO;
import kr.or.kosta.mvc.dao.Mt_mileageDAO;

@Controller
public class T_mileageController {

	@Autowired
	private Mt_mileageDAO mt_mileageDAO;
	
	@RequestMapping("/tmileage")
	   public String tmileage() {
	      return "t_mileage_Form";
	}
	
	// 포인트 조회
	@RequestMapping("/tm_point_s")
	public String tm_point_s(Model m,String mt_id) {
		T_mileageVO tmvo = mt_mileageDAO.tm_point_s(mt_id);
		m.addAttribute("tmvo",tmvo);
		return "t_mileage_listOne";
	}
	
	// 포인트 수정
	@RequestMapping("/t_mileageupdate")
	public String t_mileageupdate_update(Model m,T_mileageVO tmvo) {
		mt_mileageDAO.t_mileageupdate(tmvo);
		return "redirect:tmileage";
	}
	

		
	
}
