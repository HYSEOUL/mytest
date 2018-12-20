package kr.or.kosta.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.BlockVO;
import kr.or.kosta.mvc.dao.BlockDAO;

@Controller
public class BlockController {

	@Autowired
	BlockDAO bdao;
	
	@RequestMapping("/blockForm")
	public String blockForm() {
		return "block_Form";
	}
	
	@PostMapping("/createBlock")
	public String createBlock(BlockVO bvo) {
		bdao.createBlock(bvo);
		return "redirect:blockForm";
	}
	
	@RequestMapping("/selectListBlock")
	public String selectListBlock(Model m) {
		List<BlockVO> blist = bdao.selectListBlock();
		m.addAttribute("blist", blist);
		return "block_list";
	}
	
	@RequestMapping("/selectOneBlock")
	public String selectOneBlock(Model m, int b_num) {
		BlockVO bvo = bdao.selectOneBlock(b_num);
		m.addAttribute("bvo", bvo);
		return "block_listOne";
	}
	
	@RequestMapping("/deleteBlock")
	public String deleteBlock(int b_num) {
		bdao.deleteBlock(b_num);
		return "redirect:selectListBlock";
	}
}
