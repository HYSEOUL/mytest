package kr.or.kosta.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.M_studentVO;
import dto.M_teacherVO;
import dto.S_mileageVO;
import dto.Sc_listVO;
import dto.ShopBag_Class_listDTO;
import dto.ShopBag_Stuudy_listDTO;
import dto.Student_natureVO;
import dto.StudyVO;
import dto.Study_listVO;
import dto.T_mileageVO;
import dto.Teacher_natureVO;
import kr.or.kosta.mvc.dao.M_studentDAOInter;
import kr.or.kosta.mvc.dao.M_teacherDAOInter;
import kr.or.kosta.mvc.dao.Ms_mileageDAO;
import kr.or.kosta.mvc.dao.Mt_mileageDaoInter;
import kr.or.kosta.mvc.dao.ShopBagDAO;
import kr.or.kosta.mvc.dao.Student_natureDAOInter;
import kr.or.kosta.mvc.dao.Teacher_natureDAOInter;

@Controller
public class MypageController {

	@Autowired
	private ShopBagDAO sbdao;

	@Autowired
	private Teacher_natureDAOInter tninter;

	@Autowired
	private Student_natureDAOInter sninter;
	
	@Autowired
	private M_studentDAOInter msdao;

	@Autowired
	private M_teacherDAOInter mtdao;

	@Autowired
	private Ms_mileageDAO smdao;

	@Autowired
	private Mt_mileageDaoInter tmdao;

	 // 학생 마이페이지
	 @GetMapping("mypage_student_info")
	   public ModelAndView myInfo_student(HttpSession session) {
	      String ms_id = (String) session.getAttribute("ms_id");
	      // 학생 정보 가져오기
	      M_studentVO msvo = msdao.readMs_id(ms_id);
	      // 학생 성향 가져오기
	      Student_natureVO snvo = null;
	      try {
	         snvo = sninter.readSn_id(ms_id);
	      }catch (Exception e) {
	         snvo = null;
	      }
	      // 멤버(학생) 마일리지 가져오기
	      S_mileageVO smvo = null;
	      try {
			smvo = smdao.selectOneS_mileage(ms_id);
	      }catch(Exception e) {
	         smvo = null;
	      }
	      ModelAndView mav = new ModelAndView("mypage_student_info");
	      mav.addObject("msvo", msvo);
	      mav.addObject("snvo", snvo);
	      mav.addObject("smvo", smvo);
	      return mav;
	   }
	 
	 //학생 성향페이지 성향 매칭++
	 @GetMapping("mypage_student_nature")
	   public ModelAndView myInfo_student_nature(HttpSession session) {
	      String ms_id = (String) session.getAttribute("ms_id");
	      // 학생 정보 가져오기
	      M_studentVO msvo = msdao.readMs_id(ms_id);
	      // 학생 성향 가져오기
	      Student_natureVO snvo = null;
	      List<StudyVO> slist = null;
	      try {
	         snvo = sninter.readSn_id(ms_id);
	      }catch (Exception e) {
	         snvo = null;
	      }
	      //성향매칭파트
	      try {
	      slist = sninter.natureMatchingStudy(snvo);
	      }catch (Exception e) {
	      slist = null;
	      }
	      System.out.println(slist);
	      System.out.println("아이디 => "+ms_id);
	      System.out.println("이름 => "+ msvo.getMs_name());
	      ModelAndView mav = new ModelAndView("mypage_student_nature");
	      mav.addObject("msvo", msvo);
	      mav.addObject("snvo", snvo);
	      mav.addObject("slist",slist);
	      return mav;
	   }

	// 학생 강의,스터디 수강완료 리스트
	@RequestMapping(value = "mypage_class_study_list")
	public ModelAndView mypage_ClassStudy_list(HttpSession session) {
		String sl_id = (String) session.getAttribute("ms_id");
		Sc_listVO scvo = new Sc_listVO();
		scvo.setMs_id(sl_id);
		scvo.setSc_buy(2);
		List<ShopBag_Class_listDTO> scvolist = sbdao.readClassList(scvo);
		Study_listVO slvo = new Study_listVO();
		slvo.setSl_id(sl_id);
		slvo.setSl_buy(2);
		List<ShopBag_Stuudy_listDTO> slvolist = sbdao.readStudyList(slvo);
		/*M_studentVO msvo = msdao.readMs_id(sl_id);
		Student_natureVO snvo = sninter.readSn_id(sl_id);*/

		ModelAndView mav = new ModelAndView("mypage_student_class&study_list");
		mav.addObject("slvolist", slvolist);
		mav.addObject("scvolist", scvolist);
		/*mav.addObject("msvo", msvo);
		mav.addObject("snvo", snvo);*/
		return mav;
	}
		
	 
	// 강사 마이페이지
	@GetMapping("mypage_teacher_info")
	public ModelAndView myInfo_teacher(HttpSession session) throws Exception {
		System.out.println("학생 마이페이지 내정보 컨트롤 입성");
		String mt_id = (String) session.getAttribute("mt_id");

		// 강사 정보 가져오기
		M_teacherVO mtvo = mtdao.readM_teacher(mt_id);

		// 강사 성향 가져오기
		Teacher_natureVO tnvo = null;
		// ist<StudyVO> tlist = null; 강사 매칭???무엇을????
		try {
			tnvo = tninter.readMt_id(mt_id);
		} catch (NullPointerException e) {
			tnvo = null;
		}
//	      강사매칭 -- ????
//	      try {
//	      tlist = sninter.natureMatchingStudy(tnvo);
//	      }catch (NullPointerException e) {
//	      tlist = null;
//	      }
//	      
		// 강사 마일리지 가져오기
		T_mileageVO tmvo = null;
		try {
			tmvo = tmdao.t_mileageRead(mt_id);
		} catch (NullPointerException e) {
			tmvo = null;
		}
		// System.out.println(tlist);
		System.out.println("아이디 => " + mt_id);
		System.out.println("이름 => " + mtvo.getMt_name());
		ModelAndView mav = new ModelAndView("mypage_teacher_info");
		mav.addObject("mtvo", mtvo);
		mav.addObject("tnvo", tnvo);
		// mav.addObject("slist",slist);
		mav.addObject("tmvo", tmvo);

		return mav;
	}
	
	//강사 성향페이지
	 @GetMapping("mypage_teacher_nature")
	 public ModelAndView myInfo_Teacher_nature(HttpSession session) throws Exception {
      String mt_id = (String) session.getAttribute("mt_id");
      // 강사 정보 가져오기
      M_teacherVO mtvo = mtdao.readM_teacher(mt_id);
      // 강사 성향 가져오기
      Teacher_natureVO tnvo = null;
      try {
    	  tnvo = tninter.readMt_id(mt_id);
      }catch (Exception e) {
    	  tnvo = null;
      }
      System.out.println("아이디 => "+ mt_id);
      System.out.println("이름 => "+ mtvo.getMt_name());
      ModelAndView mav = new ModelAndView("mypage_teacher_nature");
      mav.addObject("mtvo", mtvo);
      mav.addObject("tnvo", tnvo);
      return mav;
   }

}
