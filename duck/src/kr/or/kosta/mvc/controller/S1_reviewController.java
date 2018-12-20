package kr.or.kosta.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.S1_reviewDTO;
import dto.S1_reviewVO;
import kr.or.kosta.mvc.dao.S1_reviewDAO;

@Controller
public class S1_reviewController {
	
	@Autowired
	private S1_reviewDAO s1r;
	
	@RequestMapping("/s_reviewInsert")
	public String reviewInsert(Model m,S1_reviewVO vo) {
		s1r.s1_reviewInsert(vo);
		List<S1_reviewDTO> list = s1r.s1_reviewRead();
		m.addAttribute("list",list);
		return "redirect:/s1_review_list";
	}
	
	@RequestMapping("/s_reviewList")
	public String s_reviewList(Model m) {
		List<S1_reviewDTO> list = s1r.s1_reviewRead();
		m.addAttribute("list",list);
		return "s1_review_list";
	}
	
	@RequestMapping("/s_reviewDelete")
	public String s_reviewDelete(Model m,int s1_num) {
		s1r.s1_reviewDelete(s1_num);
		List<S1_reviewDTO> list = s1r.s1_reviewRead();
		m.addAttribute("list",list);
		return "s1_review_list";
	}
}
