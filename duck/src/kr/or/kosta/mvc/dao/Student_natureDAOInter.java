package kr.or.kosta.mvc.dao;

import dto.Student_natureVO;

public interface Student_natureDAOInter {
	public void createStudent_natureVO(Student_natureVO snvo);
	public Student_natureVO readSn_id(String ms_id);
	public void updateStudent_natureVO(Student_natureVO snvo);
	public void deleteStudent_natureVO(String ms_id);
}
