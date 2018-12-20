package kr.or.kosta.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dto.S_mileageVO;
import kr.or.kosta.mvc.dao.Ms_mileageDAO;

@Controller
public class S_mileageController {
	
	@Autowired
	Ms_mileageDAO smdao;
	
	@RequestMapping("/mileageForm")
	public String setmileage() {
		return "s_mileage_Form";
	}
	
	@PostMapping("/creatS_mileage")
	public String createS_mileage(Model m, S_mileageVO smvo) {
		smdao.createS_mileage(smvo);
		return "redirect:mileageForm";
	}
	
	@RequestMapping(value="/readS_mileage", method=RequestMethod.POST)
	public String selectOneS_mileage(Model m, @RequestParam String ms_id) {
		S_mileageVO smvo = smdao.selectOneS_mileage(ms_id);
		System.out.println(smvo.getSm_num());
		System.out.println(smvo.getMs_id());
		System.out.println(smvo.getSm_point());
		m.addAttribute("smvo",smvo);
		return "s_mileage_listOne";
	}
	
	@PostMapping("/updateS_mileage")
	public String updateS_mileage(Model m, @RequestParam String ms_id, @RequestParam int math_point) {
		S_mileageVO smvo = new S_mileageVO();
		smvo.setMs_id(ms_id);
		smvo.setMath_point(math_point);
		smdao.updateS_mileage(smvo);
		return "redirect:mileageForm";
		
	}
}
