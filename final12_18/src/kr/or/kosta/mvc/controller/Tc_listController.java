package kr.or.kosta.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("/tc_list")
	public String tc_list_1(Model m,String mt_id) {
		List<Tc_listVO> tcvo = tc_listdao.tc_list_1(mt_id);
		m.addAttribute("tcvo", tcvo);
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

}
