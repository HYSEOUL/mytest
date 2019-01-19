package kr.or.kosta.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import kr.or.kosta.pwdemail.Email;
import kr.or.kosta.pwdemail.EmailSender;
import kr.or.kosta.pwdemail.RandomPassword;

@Controller
public class M_studentController {

	@Autowired
	private M_studentDAOInter m_studentDAOInter;

	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private Email email;

	// private static final Logger logger =
	// LoggerFactory.getLogger(M_studentController.class);

	@GetMapping("/reg_m_student")
	public String m_studentReg() {
		return "m_student_Form";
	}

	@PostMapping("/m_student_create")
	public String m_studentCreate(@ModelAttribute(value = "smvo") M_studentVO smvo, HttpSession session,
			HttpServletRequest request, Model m, Student_natureVO snvo) {

		String img_path = "resources\\images";
		String r_path = request.getRealPath("/");
		System.out.println(r_path);

		MultipartFile mfile = smvo.getMf_img();
		System.out.println(mfile);

		String oriFn = mfile.getOriginalFilename();
		System.out.println(oriFn);

		long size = mfile.getSize();
		String contentType = mfile.getContentType();

		System.out.println(r_path);
		System.out.println(oriFn);
		System.out.println(size);
		System.out.println("Type : " + contentType);

		StringBuffer path = new StringBuffer();
		path.append(r_path).append(img_path).append("\\").append(oriFn);
		System.out.println(path);

		File f = new File(path.toString());
		System.out.println(f.exists());

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

	@PostMapping("/m_student_modify")
	public String m_studentModifySend(HttpSession session, HttpServletRequest request, M_studentVO msvo) {
		System.out.println("�л��������� ����");
		String img_path = "resources\\images";
		String r_path = request.getRealPath("/");
		System.out.println(r_path + " ���о�");

		MultipartFile mfile = msvo.getMf_img();
		System.out.println(mfile + " ������");

		String oriFn = mfile.getOriginalFilename();
		System.out.println(oriFn + " ���������ϳ���");

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
			System.out.println("���ϸ� : " + oriFn);
			m_studentDAOInter.updateMsInfo(msvo);
		}

		return "redirect:/m_student_selectOne";
	}

	@PostMapping("/m_student_delete")
	public String m_studentDelete(HttpSession session) {
		if (session.getAttribute("ms_id") != null) {
			String ms_id = (String) session.getAttribute("ms_id");
			System.out.println(ms_id);
			m_studentDAOInter.deleteMsInfo(ms_id);
		}
		session.invalidate();
		return "index";
	}

	@RequestMapping(value = "findid_student")
	public String findIdPage() {
		return "m_student_id_find_form";
	}

	@RequestMapping(value = "find_student_id")
	public ModelAndView findStudent(@RequestParam String ms_name, @RequestParam String ms_email, Model model) {
		String ms_id = m_studentDAOInter.findstudentId(ms_name, ms_email);
		ModelAndView mav = new ModelAndView();
		mav.addObject("ms_id", ms_id);
		mav.setViewName("m_id_result");
		return mav;
	}

	@RequestMapping(value = "findpw_student")
	public String findStudentpwPage() {
		return "m_student_pw_find_form";
	}

	@RequestMapping(value = "find_student_pw", method = RequestMethod.POST)
	public String findPw(Model model, 
			String ms_name, String ms_id, String ms_email, 
			HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		System.out.println(ms_name + "," + ms_id + "," + ms_email);
		
		PrintWriter out = response.getWriter();
		RandomPassword rpw = new RandomPassword();
		String ms_pwd = rpw.randomPassword(10);

		email.setContent(rpw.makeContent(ms_name, ms_id, ms_pwd));
		email.setReceiver(ms_email);
		email.setSubject(ms_name + "님의 임시 비밀번호입니다.");
		
		try {
			emailSender.sendEmail(email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		out.println("<script>alert('성공적으로 메일을 발송했습니다.');history.go(-1);</script>");
		out.flush();
		
		m_studentDAOInter.updatePW(ms_id, ms_email, ms_pwd);

		return "choiseLogin";
	}

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

	/*@RequestMapping("/sendpw.do")
	public ModelAndView sendEmailAction(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
		ModelAndView mav;
		String id = (String) paramMap.get("id");
		String e_mail = (String) paramMap.get("email");
		String pw = mainService.getPw(paramMap);
		System.out.println(pw);
		if (pw != null) {
			email.setContent("비밀번호는 " + pw + " 입니다.");
			email.setReceiver(e_mail);
			email.setSubject(id + "님 비밀번호 찾기 메일입니다.");
			emailSender.SendEmail(email);
			mav = new ModelAndView("redirect:/login.do");
			return mav;
		} else {
			mav = new ModelAndView("redirect:/logout.do");
			return mav;
		}
	}*/

}
