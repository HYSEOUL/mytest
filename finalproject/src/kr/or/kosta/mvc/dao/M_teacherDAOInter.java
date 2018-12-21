package kr.or.kosta.mvc.dao;

import dto.M_teacherVO;
import dto.Teacher_natureVO;

public interface M_teacherDAOInter {

	public void createM_teacher(M_teacherVO tvo) throws Exception;
	public void createTeacher_nature(Teacher_natureVO tnvo);
	public M_teacherVO readM_teacherLogin(String mt_id, String mt_pwd) throws Exception;
	public M_teacherVO readM_teacher(String mt_id) throws Exception;
	public void updateM_teacher(M_teacherVO mtvo) throws Exception;
	public void deleteM_teacher(String mt_id) throws Exception;
	
}
