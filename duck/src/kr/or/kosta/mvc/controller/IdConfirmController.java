package kr.or.kosta.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosta.mvc.dao.M_studentDAOInter;

// @RestController는 JSP와 같은 뷰를 만들어 내지 않고,
// 데이터 자체를 반환함.
@RestController
@RequestMapping("/idconfirm")
public class IdConfirmController {

	// Dao를 주입
	@Autowired
	private M_studentDAOInter m_studentDAOInter;

	// http://localhost/springproject/idconfirm/idcheck?ms_id=s_park
	// 값을 웹브라우저로 전달하여 데이터가 제대로 출력되는지 먼저 확인!!
	// pom.xml에 jackson-databind 추가해야함!!
	// 아이디 중복 확인
	@GetMapping("/idcheck")
	public String idConfirmid(@RequestParam("ms_id") String ms_id, 
			HttpServletRequest req, HttpServletResponse resp) {
		int cnt = m_studentDAOInter.idChk(ms_id);
		req.setAttribute("cnt", cnt);
		return String.valueOf(cnt);
	}
}
