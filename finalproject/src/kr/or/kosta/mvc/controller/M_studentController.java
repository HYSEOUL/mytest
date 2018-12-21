package kr.or.kosta.mvc.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dto.M_studentVO;
import dto.Student_natureVO;
import kr.or.kosta.mvc.dao.M_studentDAOInter;

@Controller
public class M_studentController {

	// Dao를 주입
	@Autowired
	private M_studentDAOInter m_studentDAOInter;


	//private static final Logger logger = LoggerFactory.getLogger(M_studentController.class);

	// 회원가입 폼으로 이동
	@GetMapping("/reg_m_student")
	public String m_studentReg() {
		return "m_student_Form";
	}

	// 회원가입 폼에서 입력한 데이터 추가
	@PostMapping("/m_student_create")
	public String m_studentCreate(@ModelAttribute(value = "smvo") M_studentVO smvo, HttpSession session,
			HttpServletRequest request, Model m, Student_natureVO snvo) {

		String img_path = "resources\\images";
		String r_path = request.getRealPath("/");
		System.out.println(r_path+" 알패쓰");
		
		MultipartFile mfile = smvo.getMf_img(); 
		System.out.println(mfile+" 엠파일");
		
		String oriFn = mfile.getOriginalFilename();
		System.out.println(oriFn+" 오리진파일네임");
		
		long size = mfile.getSize();
		String contentType = mfile.getContentType();

		System.out.println(r_path);
		System.out.println("파일명 : " + oriFn);
		System.out.println("파일크기 : " + size);
		System.out.println("Type : " + contentType);

		StringBuffer path = new StringBuffer();
		path.append(r_path).append(img_path).append("\\").append(oriFn);
		System.out.println(path);

		File f = new File(path.toString());
		System.out.println(f.exists());

		// 파일 업로드 진행

		// 이미지의 이름만 따로 Database에 저장하기 위해서
		smvo.setMs_img(oriFn);
		m_studentDAOInter.createM_studentInfo(smvo);

		try {
			mfile.transferTo(f);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		String ms_id = request.getParameter(smvo.getMs_id());
		System.out.println(ms_id);
		return "index";
	}

	// 회원수정 폼으로 이동
	@GetMapping("/modify_m_student")
	public String m_studentModify(HttpSession session, HttpServletRequest request) {
		String ms_id = (String) session.getAttribute("ms_id");
		System.out.println(ms_id);

		M_studentVO msvo = new M_studentVO();
		if (ms_id != null) {
			msvo = m_studentDAOInter.readMs_id(ms_id);
		}
		request.setAttribute("msvo", msvo);

		return "m_student_update_Form";
	}

	// 회원정보변경
	@PostMapping("/m_student_modify")
	public String m_studentModifySend(
			HttpSession session, HttpServletRequest request, 
			M_studentVO msvo)
			{
		// String ms_id = (String) session.getAttribute("ms_id");
		// System.out.println(ms_id);
		if (session.getAttribute("ms_id") != null) {
			String ms_id = (String) session.getAttribute("ms_id");
			System.out.println(ms_id);
			String ms_pwd = request.getParameter("ms_pwd");
			String ms_name = request.getParameter("ms_name");
			String ms_phone = request.getParameter("ms_phone");
			String ms_loc1 = request.getParameter("ms_loc1");

			msvo.setMs_pwd(ms_pwd);
			msvo.setMs_name(ms_name);
			msvo.setMs_phone(ms_phone);
			msvo.setMs_loc1(ms_loc1);
			m_studentDAOInter.updateMsInfo(msvo);
		}

		return "redirect:modify_m_student";
	}

	// 회원삭제
	@PostMapping("/m_student_delete")
	public String m_studentDelete(HttpSession session){
		if (session.getAttribute("ms_id") != null) {
			String ms_id = (String) session.getAttribute("ms_id");
			System.out.println(ms_id);
			m_studentDAOInter.deleteMsInfo(ms_id);
		}
		session.invalidate();
		return "index";
	}

}
