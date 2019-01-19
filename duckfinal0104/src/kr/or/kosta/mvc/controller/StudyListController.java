package kr.or.kosta.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.S_mileageVO;
import dto.Study_ListDTO;
import dto.Study_listVO;
import kr.or.kosta.mvc.dao.Ms_mileageDAO;
import kr.or.kosta.mvc.dao.Study_listDAO;
import kr.or.kosta.mvc.service.BuyPointService;

@Controller
public class StudyListController {

	@Autowired
	private Study_listDAO stldao;
	@Autowired
	private Ms_mileageDAO msDao;
	@Autowired
	private BuyPointService bps;
	
	@RequestMapping("/study_list_1")
	public String study_list_1(Model m, String ms_id) {
		//DTO sltvo, VO slvo
		List<Study_ListDTO> slvo = stldao.study_list_1(ms_id);
		m.addAttribute("slvo", slvo);
		return "study_list_list";		
	}
	
	/*다혜부분*/
	//스터디 리스트 입력
	@RequestMapping(value="/insertStudyList_l")
	public String insertStudyList(HttpServletRequest req,HttpSession session,int num,int buynum,String msid) {
		String sl_id = (String) session.getAttribute("ms_id");
		String ms_id = req.getParameter("msid");
		int s_num = Integer.parseInt(req.getParameter("num"));
		int sl_buy = Integer.parseInt(req.getParameter("buynum"));
		
		Study_listVO slvo = new Study_listVO();
		slvo.setS_num(s_num);
		slvo.setSl_id(sl_id);
		slvo.setMs_id(ms_id);
		slvo.setSl_buy(sl_buy);
		
		stldao.insertStudyList(slvo);
		int buySelector = slvo.getSl_buy();
		String urlpath ="";
		if(buySelector == 1) {
			System.out.println("장바구니로 가자!");
			urlpath += "redirect:/shopbag";
		}else if(buySelector == 2) {
			System.out.println("수강목록으로 가자!");
			urlpath +=  "redirect:/mypage_class_study_list";
		}
		return urlpath;
	}
	
	//스터디 리스트 구매 
	@RequestMapping(value="/updateStudy_list")
	public String updateStudyForm(HttpSession session,HttpServletRequest req,int num,int buynum,int price)throws Exception {
		//세션으로 id 값 받기
		String ms_id = (String) session.getAttribute("ms_id");
		System.out.println("스터디 Id => "+ms_id);
		// 내포인트 알아오기
		S_mileageVO getsmvo = msDao.selectOneS_mileage(ms_id);
		System.out.println(getsmvo.getSm_point()+"Point");
		int my_point = getsmvo.getSm_point(); 
		
		// 구매하려는 스터디 가격,list의 번호,분기번호 일아오기
		int s_price = Integer.parseInt(req.getParameter("price"));
		int sl_num = Integer.parseInt(req.getParameter("num"));
		int sl_buy = Integer.parseInt(req.getParameter("buynum"));
		System.out.println("스터디 구매 업데이트 진입"+sl_num+sl_buy);
		
		
		bps.studyBuyPoint(sl_num, sl_buy, s_price, my_point, ms_id);
		System.out.println("★★★★★★★★구매 완료★★★★★★★★★★");
		return "redirect:/mypage_class_study_list";
	}
	
	// 장바구니에서 스터디 삭제 delete
	@RequestMapping(value="deleteStudy_list")
	public String deleteStudy_List(HttpServletRequest req,int num) {
		System.out.println("스터디 삭제할꺼야~~~!!!!");
		int sc_num = Integer.parseInt(req.getParameter("num"));
		stldao.deleteStudyList(sc_num);
		return "redirect:/shopbag";
	}
}
