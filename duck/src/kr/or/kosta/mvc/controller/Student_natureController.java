package kr.or.kosta.mvc.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import dto.Student_natureVO;
import kr.or.kosta.mvc.dao.Student_natureDAOInter;

@Controller
public class Student_natureController {

	//private static final Logger logger = LoggerFactory.getLogger(Student_natureController.class);

	@Autowired
	private Student_natureDAOInter student_natureDAOInter;


	// 성향입력 폼으로 이동
	@GetMapping("/characterInsert")
	public String m_studentReg() {
		return "student_nature_Form";
	}

	// 성향입력 폼에서 입력한 데이터 추가
	@PostMapping("/characterCreate")
	public String m_studentCreateNature(HttpSession session, String sn_my, String sn_you, String sn_category,
			HttpServletRequest request, Model m) throws Exception {
		if (session.getAttribute("ms_id") != null) {
			String ms_id = (String) session.getAttribute("ms_id");
			request.getAttribute(sn_my);
			request.getAttribute(sn_you);
			request.getAttribute(sn_category);
			System.out.println(ms_id);
			System.out.println(sn_my);
			System.out.println(sn_you);
			System.out.println(sn_category);

			Student_natureVO snvo = new Student_natureVO();
			snvo.setMs_id(ms_id);
			snvo.setSn_my(sn_my);
			snvo.setSn_you(sn_you);
			snvo.setSn_category(sn_category);
			student_natureDAOInter.createStudent_natureVO(snvo);
		}
		return "index";
	}

	// 성향수정 폼으로 이동
	@GetMapping("/characterModify")
	public String m_studentModify(HttpSession session, HttpServletRequest request) throws Exception {
		String ms_id = (String) session.getAttribute("ms_id");
		System.out.println(ms_id);

		Student_natureVO snvo = new Student_natureVO();
		if (ms_id != null) {
			snvo = student_natureDAOInter.readSn_id(ms_id);
		}
		request.setAttribute("snvo", snvo);

		return "student_nature_update_Form";
	}

	// 성향변경
	@PostMapping("/natureModify")
	public String m_studentModifySend(HttpSession session, 
			HttpServletRequest request, Model m, 
			Student_natureVO snvo)
			throws Exception {
		if (session.getAttribute("ms_id") != null) {
			String ms_id = (String) session.getAttribute("ms_id");
			System.out.println(ms_id);
			String sn_my = request.getParameter("sn_my");
			String sn_you = request.getParameter("sn_you");
			String sn_category = request.getParameter("sn_category");
			System.out.println(sn_my);
			System.out.println(sn_you);
			System.out.println(sn_category);

			snvo.setMs_id(ms_id);
			snvo.setSn_my(sn_my);
			snvo.setSn_you(sn_you);
			snvo.setSn_category(sn_category);
			student_natureDAOInter.updateStudent_natureVO(snvo);
		}
		request.setAttribute("snvo", snvo);

		return "redirect:/";
	}

	// 성향삭제
	@PostMapping("/natureDelete")
	public String m_studentDelete(HttpSession session) throws Exception {
		if (session.getAttribute("ms_id") != null) {
			String ms_id = (String) session.getAttribute("ms_id");
			System.out.println(ms_id);
			student_natureDAOInter.deleteStudent_natureVO(ms_id);
		}
		return "redirect:/";
	}
}
