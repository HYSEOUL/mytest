package kr.or.kosta.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.Teacher_natureVO;
import kr.or.kosta.mvc.dao.Teacher_natureDAOInter;

@Controller
public class Teacher_natureController {

	//private static final Logger logger = LoggerFactory.getLogger(M_teacherController.class);
	
	@Autowired
	private Teacher_natureDAOInter teacher_natureDAOInter;
	
	//성향입력 폼으로 이동
	@GetMapping("/teacher_natureInsert")
	public String m_teacherReg() {
		return "mypage_teacher_nature_Form";
	}
	
	//성향입력 폼에서 입력한 데이터 추가
	@PostMapping("/teacher_nature_Create")
	public String m_teacherCreateNature(HttpSession session, String tn_my, String tn_you, String tn_category, HttpServletRequest request, Model m) throws Exception{
		if (session.getAttribute("mt_id") != null) {
			String mt_id = (String) session.getAttribute("mt_id");
			request.getAttribute(tn_my);
			request.getAttribute(tn_you);
			request.getAttribute(tn_category);
			
			Teacher_natureVO tnvo = new Teacher_natureVO();
			tnvo.setMt_id(mt_id);
			tnvo.setTn_my(tn_my);
			tnvo.setTn_you(tn_you);
			tnvo.setTn_category(tn_category);
			
			teacher_natureDAOInter.createTeacher_natureVO(tnvo);	
		}
				
		return "redirect:/mypage_teacher_info";		
	}
	
	//강사 성향수정 폼으로 이동
	@GetMapping("/modify_m_teacher")
	public String m_teacherModify(HttpSession session, HttpServletRequest request, Model m) throws Exception{
		String mt_id = (String) session.getAttribute("mt_id");
		System.out.println(mt_id);
		
		Teacher_natureVO tnvo = teacher_natureDAOInter.readMt_id(mt_id);
		
		m.addAttribute("tnvo", tnvo);
		return "teacher_nature_updete_Form";
	}
	
	//강사 성향 변경
	@PostMapping("/natureModify_teacher")
	public String m_teacherModifySend(HttpSession session, 
			HttpServletRequest request, Model m, Teacher_natureVO tnvo) throws Exception{
		if (session.getAttribute("mt_id") != null) {
			String mt_id = (String) session.getAttribute("mt_id");
			System.out.println(mt_id);
			String tn_my = request.getParameter("tn_my");
			String tn_you = request.getParameter("tn_you");
			String tn_category = request.getParameter("tn_category");
			System.out.println(tn_my);
			System.out.println(tn_you);
			System.out.println(tn_category);
			
			tnvo.setMt_id(mt_id);
			tnvo.setTn_my(tn_my);
			tnvo.setTn_you(tn_you);
			tnvo.setTn_category(tn_category);
			teacher_natureDAOInter.updateTeacher_natureVO(tnvo);
		}
		request.setAttribute("tnvo", tnvo);
		return "redirect:/mypage_teacher_nature";
	} 
	
	// 너는 뭐임? 뿡뽕빵
	@RequestMapping(value="mtnatureCreate")
	public String createNature(HttpSession session,Teacher_natureVO tnvo) throws Exception { //Teacher_natureVO tnvo,HttpSession session
		String mt_id = (String) session.getAttribute("mt_id");
//		tnvo.setMt_id(mt_id);
		System.out.println("받는아이다: "+mt_id);
		System.out.println("나의 성향: "+tnvo.getTn_my());
		System.out.println("상대방 성향: "+tnvo.getTn_you());
		System.out.println("나의 성향: "+tnvo.getTn_category());
		System.out.println("진입");
		tnvo.setMt_id(mt_id);
		teacher_natureDAOInter.createTeacher_natureVO(tnvo);		
		return "redirect:./";
	}
	
	//성향삭제
	@PostMapping("/mtnatureDelete")
	public String m_teacherDelete(HttpSession session) throws Exception{
		if (session.getAttribute("mt_id") != null) {
			String mt_id = (String) session.getAttribute("mt_id");
			System.out.println(mt_id);
			teacher_natureDAOInter.deleteTeacher_natureVO(mt_id);
		}
		return "redirect:./";		
	}	
}
