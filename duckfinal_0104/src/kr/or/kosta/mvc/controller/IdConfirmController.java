package kr.or.kosta.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosta.mvc.dao.M_studentDAOInter;
import kr.or.kosta.mvc.dao.M_teacherDAOInter;

@RestController
@RequestMapping("/idconfirm")
public class IdConfirmController {

	// Dao�� ����
	@Autowired
	private M_studentDAOInter m_studentDAOInter;
	
	@Autowired
	private M_teacherDAOInter m_teacherDAOInter;

	// http://localhost/springproject/idconfirm/idcheck?ms_id=s_park
	// pom.xml�� jackson-databind
	@GetMapping("/idcheck")
	public String idConfirmid(@RequestParam("ms_id") String ms_id, 
			HttpServletRequest req, HttpServletResponse resp) {
		int cnt = m_studentDAOInter.idChk(ms_id);
		req.setAttribute("cnt", cnt);
		return String.valueOf(cnt);
	}

	// http://localhost/springproject/idconfirm/idcheck2?mt_id=t_leeji
	@GetMapping("/idcheck2")
	public String idConfirmMtid(@RequestParam("mt_id") String mt_id, 
			HttpServletRequest req, HttpServletResponse resp) {
		int cnt = m_teacherDAOInter.idChk(mt_id);
		req.setAttribute("cnt", cnt);
		return String.valueOf(cnt);		
	}
}
