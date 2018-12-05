package kr.or.kosta.mvc.controller;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.kosta.mvc.dao.UserMemberInter;
import kr.or.kosta.vo.UserMemberVO;

@Controller
public class UserMemberController {
	
	// Dao�� ����
	@Autowired
	private UserMemberInter userMemberInter;
	
	// form
	@GetMapping("/usermember")
	public String memberJoin() {
		return "usermember";
	}
	
	@PostMapping("/usermemberjoin")
	public String myMemberJoin(Model m, UserMemberVO vo) {
		System.out.println(vo.getId());
		System.out.println(vo.getName());
		userMemberInter.addMem(vo);
		return "index";
	}
	
	@GetMapping("/idcheck")
	public String idCheck(Model m,
			@RequestParam("id") String id) {
		int cnt = userMemberInter.idChk(id);
		System.out.println(id);
		System.out.println(cnt);
//		String msg = "�̹� ������� ���̵��Դϴ�.";
//		if(cnt == 0) {
//			msg = "��� ������ ���̵��Դϴ�.";
//		}
		m.addAttribute("cnt", cnt);
		return "idchk";
	}
}
