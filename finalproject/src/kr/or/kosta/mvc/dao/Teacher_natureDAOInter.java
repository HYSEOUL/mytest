package kr.or.kosta.mvc.dao;

import dto.Teacher_natureVO;

public interface Teacher_natureDAOInter {
	public void createTeacher_natureVO(Teacher_natureVO tnvo) throws Exception;
	public Teacher_natureVO readMt_id(String mt_id) throws Exception;
	public void updateTeacher_natureVO(Teacher_natureVO tnvo) throws Exception;
	public void deleteTeacher_natureVO(String mt_id) throws Exception;
}
