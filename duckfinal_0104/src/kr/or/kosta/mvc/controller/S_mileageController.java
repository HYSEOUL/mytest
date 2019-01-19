package kr.or.kosta.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.M_studentVO;
import dto.S_mileageVO;
import dto.Student_natureVO;
import kr.or.kosta.mvc.dao.M_studentDAOInter;
import kr.or.kosta.mvc.dao.Ms_mileageDAO;
import kr.or.kosta.mvc.dao.Student_natureDAOInter;

@Controller
public class S_mileageController {
	
	@Autowired
	Ms_mileageDAO smdao;
	
	@Autowired
	private Student_natureDAOInter sninter;
	
	@Autowired
	private M_studentDAOInter msdao;
	
	@RequestMapping(value = "/mileageForm")
	public String setmileage(Model m, HttpSession  session) {
		String ms_id = (String) session.getAttribute("ms_id");
		S_mileageVO smvo = smdao.selectOneS_mileage(ms_id);
		M_studentVO msvo = msdao.readMs_id(ms_id);
		Student_natureVO snvo = sninter.readSn_id(ms_id);

		m.addAttribute("smvo", smvo);
		m.addAttribute("msvo", msvo);
		m.addAttribute("snvo", snvo);
		return "mypage_student_mileage";
	}
	
	@RequestMapping("/creatS_mileage")
	public String createS_mileage(HttpSession session) {
		String ms_id = (String) session.getAttribute("ms_id");
		S_mileageVO smvo = new S_mileageVO();
		smvo.setMs_id(ms_id);
		smvo.setSm_point(3000);
		smdao.createS_mileage(smvo);
		return "redirect:mypage_student_info";
	}
	
	@PostMapping("/updateS_mileage")
	public String updateS_mileage(Model m, S_mileageVO smvo, HttpSession session) {
		String ms_id = (String) session.getAttribute("ms_id");
		smvo.setMs_id(ms_id); 
		System.out.println("ID :"+smvo.getMs_id());
		System.out.println("변화주고자 하는 금액 : "+smvo.getMath_point());
		System.out.println("기존 금액 : "+smvo.getSm_point());
		System.out.println(smvo.getSmNumber());
		
		String gourl ="";
		if (smvo.getMath_point() >= 0) { //else의 sysout 확인
			if (smvo.getSmNumber() == 4) { //포인트 충전 = 4 // 포인트 환전 = 5
				smdao.updateS_mileage(smvo);
				gourl = "redirect:mileageForm?ms_id="+ms_id;
			}else if(smvo.getSmNumber() == 5) {
				if(smvo.getSm_point() >= smvo.getMath_point()) {
					smdao.updateS_mileage(smvo);
					gourl = "redirect:mileageForm?ms_id="+ms_id;
				}else {
					System.out.println("가진 돈 보다 많은 금액을 환전하려 합니다.");
					gourl ="error_point";
				}
			}else {
				System.out.println("충전(4) 및 환전(5)이 아닌 상황에서 진행되고 있는 update문 입니다.");
				gourl ="error_point";
			}
		}else {
			System.out.println("포인트 충전 중 충전하려는 금액이 음수이거나 0 입니다.");
			gourl ="error_point";
		}
		return gourl;

	}
	
}
