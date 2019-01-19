package kr.or.kosta.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.M_studentVO;
import dto.Sc_listVO;
import dto.ShopBag_Class_listDTO;
import dto.ShopBag_Stuudy_listDTO;
import dto.Student_natureVO;
import dto.Study_listVO;
import kr.or.kosta.mvc.dao.M_studentDAOInter;
import kr.or.kosta.mvc.dao.ShopBagDAO;
import kr.or.kosta.mvc.dao.Student_natureDAOInter;

@Controller
public class ShopBagController {
	
	@Autowired
	private ShopBagDAO sbdao;
	
	@Autowired
	private Student_natureDAOInter sninter;
	
	@Autowired
	private M_studentDAOInter msdao;
	
	@RequestMapping("/shopbag")
	public ModelAndView shopbag(HttpSession session){
		String sl_id = (String) session.getAttribute("ms_id");
		Sc_listVO scvo = new Sc_listVO();
		scvo.setMs_id(sl_id);
		scvo.setSc_buy(1);
		List<ShopBag_Class_listDTO> scvolist = sbdao.readClassList(scvo);
		
		Study_listVO slvo = new Study_listVO();
		slvo.setSl_id(sl_id);
		slvo.setSl_buy(1);
		List<ShopBag_Stuudy_listDTO> slvolist = sbdao.readStudyList(slvo);
		ModelAndView mav = new ModelAndView("mypage_student_shopbag");
		mav.addObject("slvolist",slvolist);
		mav.addObject("scvolist",scvolist);
		
		return mav;
	}
}

/*M_studentVO msvo = msdao.readMs_id(sl_id);
Student_natureVO snvo = sninter.readSn_id(sl_id);

mav.addObject("msvo", msvo);
mav.addObject("snvo", snvo);*/
