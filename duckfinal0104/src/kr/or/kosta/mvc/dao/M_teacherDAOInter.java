package kr.or.kosta.mvc.dao;

import dto.M_teacherVO;
import dto.Teacher_natureVO;

public interface M_teacherDAOInter {

	public void createM_teacher(M_teacherVO mtvo) throws Exception;
	public void createTeacher_nature(Teacher_natureVO tnvo);
	public M_teacherVO readM_teacherLogin(String mt_id, String mt_pwd) throws Exception;
	public M_teacherVO readM_teacher(String mt_id) throws Exception;
	public void updateM_teacher(M_teacherVO mtvo) throws Exception;
	public void deleteM_teacher(String mt_id) throws Exception;
	public String findteacherId(String mt_name, String mt_email);
	
	// 수정된 부분
	public String findPw(String mt_name);
	public void updatePW(String mt_id, String mt_email, String mt_pwd);
	
	//2018.12.24
	public int idChk(String mt_id);
}
