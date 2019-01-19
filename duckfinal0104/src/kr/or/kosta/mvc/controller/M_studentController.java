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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
	@GetMapping("/modify_m_student_update")
	public String m_studentModify(HttpSession session, HttpServletRequest request) {
		String ms_id = (String) session.getAttribute("ms_id");
		System.out.println(ms_id);

		M_studentVO msvo = new M_studentVO();
		if (ms_id != null) {
			msvo = m_studentDAOInter.readMs_id(ms_id);
		}
		request.setAttribute("msvo", msvo);

		return "mypage_student_update_Form";
	}

	// 회원정보변경
	   @PostMapping("/m_student_modify")
	   public String m_studentModifySend(HttpSession session, HttpServletRequest request,M_studentVO msvo){
	      System.out.println("학생정보수정 시작");
	      String img_path = "resources\\images";
	      String r_path = request.getRealPath("/");
	      System.out.println(r_path+" 알패쓰");
	      
	      MultipartFile mfile = msvo.getMf_img(); 
	      System.out.println(mfile+" 엠파일");
	      
	      String oriFn = mfile.getOriginalFilename();
	      System.out.println(oriFn+" 오리진파일네임");

	      StringBuffer path = new StringBuffer();
	      path.append(r_path).append(img_path).append("\\").append(oriFn);
	      System.out.println(path);

	      File f = new File(path.toString());
	      
	      try {
	         mfile.transferTo(f);
	      } catch (IllegalStateException | IOException e) {
	         e.printStackTrace();
	      }
	      
	      
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
	         msvo.setMs_img(oriFn);
	         System.out.println("파일명 : " + oriFn);
	         m_studentDAOInter.updateMsInfo(msvo);
	      }

	      return "redirect:/m_student_selectOne";
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
	
	// 아이디 찾기 폼으로 이동
	@RequestMapping(value="findid_student")
	public String findIdPage() {
		return "m_student_id_find_form";
	}
	
	// 아이디 찾기 후, 결과 출력
	@RequestMapping(value="find_student_id")
	public ModelAndView findStudent(
			@RequestParam String ms_name, 
			@RequestParam String ms_email,
			Model model) {
		String ms_id = m_studentDAOInter.findstudentId(ms_name, ms_email);
		ModelAndView mav = new ModelAndView();
		mav.addObject("ms_id", ms_id);
		mav.setViewName("m_id_result");
		return mav;
	}
	
	// 비밀번호 찾기 폼으로 이동
	@RequestMapping(value = "findpw_student")
	public String findStudentpwPage() {
		return "m_student_pw_find_form";
	}
	
	// 비밀번호 랜덤으로 생성해서 전달
	@RequestMapping(value = "find_student_pw", method = RequestMethod.POST)
	public String findPw(Model model, 
			String ms_name, 
			String ms_id, String ms_email) {
		System.out.println(ms_name + "," + ms_id + "," + ms_email);

		String pwd = randomPassword(10);
		m_studentDAOInter.updatePW(ms_id, ms_email, pwd);
		
		String ms_pwd = m_studentDAOInter.findPw(ms_name);
		model.addAttribute("ms_pwd", ms_pwd);
		
		return "m_pwd_result";
	}
	
	// 랜덤 비밀번호 생성을 위한 메소드
	public String randomPassword(int length) {
		int index = 0;
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a',
				'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
				'w', 'x', 'y', 'z' };

		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			index = (int) (charSet.length * Math.random());
			sb.append(charSet[index]);
		}

		return sb.toString();
	}
	
	// 학생 회원정보 상세보기
	@GetMapping("/m_student_selectOne")
	public String m_student_selectone(HttpSession session, HttpServletRequest request) {
		String ms_id = (String) session.getAttribute("ms_id");
		System.out.println(ms_id);

		M_studentVO msvo = new M_studentVO();
		if (ms_id != null) {
			msvo = m_studentDAOInter.readMs_id(ms_id);
		}
		request.setAttribute("msvo", msvo);

		return "mypage_student_listOne";
	}
	

}
