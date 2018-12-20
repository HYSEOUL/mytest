package kr.or.kosta.mvc.dao;

import dto.M_studentVO;
import dto.Student_natureVO;

public interface M_studentDAOInter {
	public void createM_studentInfo(M_studentVO smvo);
	public void createStudent_natureInfo(Student_natureVO snvo);
	public M_studentVO readLoginM_studentInfo(String ms_id, String ms_pwd);
	public M_studentVO readMs_id(String ms_id);
	public void updateMsInfo(M_studentVO msvo);
	public void deleteMsInfo(String ms_id);
	public int idChk(String id);
}
