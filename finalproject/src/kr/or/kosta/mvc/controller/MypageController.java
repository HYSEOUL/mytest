package kr.or.kosta.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.Sc_listVO;
import dto.ShopBag_Class_listDTO;
import dto.ShopBag_Stuudy_listDTO;
import dto.Student_natureVO;
import dto.StudyVO;
import dto.Study_listVO;
import kr.or.kosta.mvc.dao.ShopBagDAO;
import kr.or.kosta.mvc.dao.Student_natureDAOInter;

@Controller
public class MypageController {
	
	@Autowired
	private ShopBagDAO sbdao;
	
	@Autowired
	   private Student_natureDAOInter sninter;
	
	@RequestMapping(value="mypage_class_study_list")
	public ModelAndView mypage_ClassStudy_list(HttpSession session){
		String sl_id = (String) session.getAttribute("ms_id");
		Sc_listVO scvo = new Sc_listVO();
		scvo.setMs_id(sl_id);
		scvo.setSc_buy(2);
		List<ShopBag_Class_listDTO> scvolist = sbdao.readClassList(scvo);
		Study_listVO slvo = new Study_listVO();
		slvo.setSl_id(sl_id);
		slvo.setSl_buy(2);
		List<ShopBag_Stuudy_listDTO> slvolist = sbdao.readStudyList(slvo);
		
		ModelAndView mav = new ModelAndView("mypage_student_class&study_list");
		mav.addObject("slvolist",slvolist);
		mav.addObject("scvolist",scvolist);
		return mav;
	}
	
	@RequestMapping("matching_study")
	   public ModelAndView matching_study(Student_natureVO snvo) {
	      ModelAndView mav = new ModelAndView("student_nature_listOne");
	      StudyVO svo = sninter.natureMatchingStudy(snvo);
	      mav.addObject("svo",svo);
	      return mav;
	   }

}
