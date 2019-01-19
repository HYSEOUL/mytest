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

import dto.M_teacherVO;
import dto.Teacher_natureVO;
import kr.or.kosta.mvc.dao.M_teacherDAOInter;

@Controller
public class M_teacherController {

	//2. Dao ����(crud)
	@Autowired
	private M_teacherDAOInter m_teacherDAOInter;
	
	
	//1. form �̵�
	@GetMapping("/reg_m_teacher")
	public String m_teacher() {
		return "m_teacher_Form";		
	}
	
	//ȸ������
	@PostMapping("/m_teacher_create")
	public String m_teacherCreate(
			@ModelAttribute(value="tvo") M_teacherVO tvo,
			//http ��û �Ķ���͸� VO�� ���ε��ؼ� �ѹ��� �޴´�. Ŀ�ǵ� ��ü
			HttpSession session,
			HttpServletRequest request,
			Model m, Teacher_natureVO tnvo) throws Exception
			{
		System.out.println("pass");
		//�̹��� ��� ����
		String img_path = "resources\\images";	//2 �̹��� ���
		String r_path = request.getRealPath("/");	//1 root path
		System.out.println("pass2");
		MultipartFile mfile = tvo.getMf_img();
		System.out.println(mfile);
		String oriFn = mfile.getOriginalFilename();	//�����̸�
		System.out.println("���ϸ� : " + oriFn);
		System.out.println("pass4");
		long size = mfile.getSize();	//���� ũ��
		System.out.println("pass5");
		String contentType = mfile.getContentType();	//����Ÿ��
		
		System.out.println(r_path);
		System.out.println("���ϸ� : " + oriFn);
		System.out.println("����ũ�� : " + size);
		System.out.println("Type : " + contentType);
		
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(img_path).append("\\").append(oriFn);
		System.out.println(path);	//���ۿ� ���� path Ȯ��
		
		File f = new File(path.toString());	//���Ͽ� ���ۿ� �� path�� toString���� ��ȯ
		System.out.println(f.exists());
		
		//���� ���ε� ����		
		tvo.setMt_img(oriFn);	//�̹��� �̸��� ���� DB�� �����ϱ� ����
		m_teacherDAOInter.createM_teacher(tvo);
		
		try {
			mfile.transferTo(f);
				//���� ������ ������ ��� ���Ϸ� ����
				//���� �ý��ۿ��� ������ �̵� or ���� �ý��ۿ��� ������ �����ϰų�, �޸� ���� ������ ��� ���Ͽ� ���� ����.
				//��� ������ �̹� ������ ���� ����			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		String mt_id = request.getParameter(tvo.getMt_id());
		
		System.out.println(mt_id);
		return "redirect:./";		
	}
	/*
	//update ���� ���� ���� ������ �̵�
	@GetMapping("/modify_m_teacher")
	public String m_teacherUpdate(HttpSession session, Model m) throws Exception{
		String mt_id = (String) session.getAttribute("mt_id");
		System.out.println(mt_id);
		//System.out.println("test");
		M_teacherVO mtvo = new M_teacherVO();
		if (mt_id != null) {
			mtvo = m_teacherDAOInter.readM_teacher(mt_id);
		}
		m.addAttribute("mtvo",mtvo);
		return "m_teacher_update_Form";		
	}
	*/
	//ȸ�� ���� ����
	@PostMapping("/m_teacher_modify")
	public String m_teacherModify(HttpSession session, 
			HttpServletRequest request, Model m, M_teacherVO mtvo) 
					throws Exception{
		if (session.getAttribute("mt_id") != null) {
			String mt_id = (String) session.getAttribute("mt_id");
			System.out.println(mt_id);
			String mt_pwd = request.getParameter("mt_pwd");
			String mt_name = request.getParameter("mt_name");
			//String mt_email = request.getParameter("mt_email");
			String mt_phone = request.getParameter("mt_phone");
			//String mt_img = request.getParameter("mt_img");
			System.out.println(mt_pwd);
			System.out.println(mt_name);
			//System.out.println(mt_email);
			System.out.println(mt_phone);
			//System.out.println(mt_img);
			
			mtvo.setMt_pwd(mt_pwd);
			mtvo.setMt_name(mt_name);
			//mtvo.setMt_email(mt_email);
			mtvo.setMt_phone(mt_phone);
			//mtvo.setMt_img(mt_img);
			m_teacherDAOInter.updateM_teacher(mtvo);
		}
		request.setAttribute("mtvo", mtvo);
		
		return "redirect:/mypage_teacher_info";
	}
	
	//ȸ�� ����
	@PostMapping("/m_teacher_delete")
	public String m_teacherDelete(HttpSession session) throws Exception{
		if (session.getAttribute("mt_id") != null) {
			String mt_id = (String) session.getAttribute("mt_id");
			System.out.println("1��üũ: "+mt_id);
			//int num = 9;
			//System.out.println("�� üũ!: "+num);
			System.out.println(mt_id);
			//m_teacherdao.deletetest(mt_id);
			m_teacherDAOInter.deleteM_teacher(mt_id);
			System.out.println("2��: "+mt_id);
		}
		session.invalidate();
		return "redirect:./";
	}
	
	// ���̵� ã�� ������ �̵�
	@RequestMapping(value="findid_teacher")
	public String findIdPage() {
		return "m_teacher_id_find_form";
	}
	
	// ���̵� ã�� ��, ��� ���
	@RequestMapping(value="find_teacher_id")
	public ModelAndView findTeacher(
			@RequestParam String mt_name, 
			@RequestParam String mt_email,
			Model model) {
		System.out.println(mt_name);
		System.out.println(mt_email);
		String mt_id = m_teacherDAOInter.findteacherId(mt_name, mt_email);
		ModelAndView mav = new ModelAndView();
		mav.addObject("mt_id", mt_id);
		mav.setViewName("m_id_result");
		return mav;
	}
	
	// ��й�ȣ ã�� ������ �̵�
	@RequestMapping(value = "findpw_teacher")
	public String findTeacherpwPage() {
		return "m_teacher_pw_find_form";
	}

	// ��й�ȣ �������� �����ؼ� ����
	@RequestMapping(value = "find_teacher_pw", method = RequestMethod.POST)
	public String findPw(Model model, String mt_name, 
			String mt_id, String mt_email) {
		System.out.println(mt_name + "," + mt_id + "," + mt_email);

		String pwd = randomPassword(10);
		System.out.println("pwd : " + pwd);
		m_teacherDAOInter.updatePW(mt_id, mt_email, pwd);

		String mt_pwd = m_teacherDAOInter.findPw(mt_name);
		model.addAttribute("mt_pwd", mt_pwd);

		return "m_pwd_result";
	}

	// ���� ��й�ȣ ������ ���� �޼ҵ�
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
	
	//���� ȸ������ �󼼺���
	@GetMapping("/m_teacher_selectOne")
	public String m_teacher_selectOne(HttpSession session, HttpServletRequest request) throws Exception {
		String mt_id = (String) session.getAttribute("mt_id");
		System.out.println(mt_id);

		M_teacherVO mtvo = new M_teacherVO();
		if (mt_id != null) {
			mtvo = m_teacherDAOInter.readM_teacher(mt_id);
		}
		request.setAttribute("mtvo", mtvo);

		return "mypage_teacher_listOne";
	}
	
	// ���� ���� ������ �̵�
   @GetMapping("/modify_m_teacher_update")
   public String m_studentModify(HttpSession session, HttpServletRequest request) throws Exception {
      String mt_id = (String) session.getAttribute("mt_id");
      System.out.println(mt_id);

      M_teacherVO mtvo = new M_teacherVO();
      if (mt_id != null) {
         mtvo = m_teacherDAOInter.readM_teacher(mt_id);
      }
      System.out.println("���̵�����������"+mtvo.getMt_name());
      request.setAttribute("mtvo", mtvo);

      return "mypage_teacher_update_Form";
   }
	
}
