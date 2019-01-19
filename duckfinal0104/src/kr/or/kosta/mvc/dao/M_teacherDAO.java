package kr.or.kosta.mvc.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.M_teacherVO;
import dto.Teacher_natureVO;

@Repository
public class M_teacherDAO implements M_teacherDAOInter{

	@Autowired
	private SqlSessionTemplate ss;
	
	//가입
	@Override
	public void createM_teacher(M_teacherVO mtvo) throws Exception{
		System.out.println("mtvo");
		ss.insert("teacher.create", mtvo);
	}

	//해당 데이터
	@Override
	public M_teacherVO readM_teacher(String mt_id) throws Exception {
		System.out.println("read");
		return ss.selectOne("teacher.read", mt_id);
	}

	//수정
	@Override
	public void updateM_teacher(M_teacherVO mtvo) throws Exception {
		System.out.println("update");
		ss.update("teacher.update", mtvo);
	}

	//삭제
	@Override
	public void deleteM_teacher(String mt_id) throws Exception {
		System.out.println("delete");
		ss.delete("teacher.delete", mt_id);
	}

	//가져오기
	@Override
	public M_teacherVO readM_teacherLogin(String mt_id, String mt_pwd) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("mt_id", mt_id);
		map.put("mt_pwd", mt_pwd);
		System.out.println("login");
		return ss.selectOne("teacher.readLogin_T", map);
	}

	//성향입력
	@Override
	public void createTeacher_nature(Teacher_natureVO tnvo) {
		System.out.println(tnvo);
		ss.insert("teacher.natureCreate", tnvo);
	}
	
	
	/*public void deletetest(int num){
		System.out.println("M_teacherDAO에서 65번쨰 라인과 인자값!"+num);
		ss.delete("teacher.delete2", num);
	}*/
/*
	@Override
	public M_teacherVO readM_teacher(String mt_id, String mt_pwd) throws Exception {
		Map<String, Object> m_teacherMap = new HashMap<>();`
		m_teacherMap.put("mt_id", mt_id);
		m_teacherMap.put("mt_pwd", mt_pwd);
		return ss.selectOne("teacher.readLogin", m_teacherMap);
	}*/
	
	@Override
	public String findteacherId(String mt_name, String mt_email) {
		Map<String, Object> map = new HashMap<>();
		map.put("mt_name", mt_name);
		map.put("mt_email", mt_email);
		return ss.selectOne("teacher.findteacher", map);
	}

	@Override
	public String findPw(String mt_name) {
		return ss.selectOne("teacher.findPassword", mt_name);
	}

	@Override
	public void updatePW(String mt_id, String mt_email, String mt_pwd) {
		Map<String, Object> map = new HashMap<>();
		map.put("mt_id", mt_id);
		map.put("mt_email", mt_email);
		map.put("mt_pwd", mt_pwd);

		ss.update("teacher.updatePassword", map);
		
	}

	// 아이디 중복 확인 메소드 2018.12.24
	@Override
	public int idChk(String mt_id) {
		System.out.println("mt_id"+mt_id);
		return ss.selectOne("teacher.idChk_T", mt_id);
	}
}
