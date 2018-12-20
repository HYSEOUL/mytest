package kr.or.kosta.mvc.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.M_studentVO;
import dto.Student_natureVO;

@Repository
public class M_studentDAO implements M_studentDAOInter {

	@Autowired
	private SqlSessionTemplate ss;

	// 학생 회원가입
	@Override
	public void createM_studentInfo(M_studentVO smvo) {
		System.out.println("smvo : " + smvo);
		ss.insert("m_student.infoCreate", smvo);
	}

	@Override
	public void createStudent_natureInfo(Student_natureVO snvo) {
		System.out.println("snvo : " + snvo);
		ss.insert("m_student.natureCreate", snvo);
	}

	// 학생 회원 로그인하기
	@Override
	public M_studentVO readLoginM_studentInfo(String ms_id, String ms_pwd) {
		Map<String, Object> m_studentMap = new HashMap<>();
		m_studentMap.put("ms_id", ms_id);
		m_studentMap.put("ms_pwd", ms_pwd);

		return ss.selectOne("m_student.readLogin", m_studentMap);
	}

	// 학생회원정보 pk인 아이디로 읽어오기
	@Override
	public M_studentVO readMs_id(String ms_id) {
		return ss.selectOne("m_student.readMsInfo", ms_id);
	}

	// 학생회원정보 수정하기
	@Override
	public void updateMsInfo(M_studentVO msvo) {
		ss.update("m_student.updateMsInfo", msvo);
	}

	// 학생회원정보 삭제하기
	@Override
	public void deleteMsInfo(String ms_id) {
		ss.delete("m_student.deleteMsInfo", ms_id);
	}
	
	// 아이디 중복 확인 메소드
	@Override
	public int idChk(String ms_id) {
		return ss.selectOne("m_student.idChk", ms_id);
	}

}
