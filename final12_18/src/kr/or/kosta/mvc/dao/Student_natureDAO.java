package kr.or.kosta.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Student_natureVO;

@Repository
public class Student_natureDAO implements Student_natureDAOInter{

	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public void createStudent_natureVO(Student_natureVO snvo) {
		ss.insert("student_nature.natureCreate", snvo);
	}

	@Override
	public Student_natureVO readSn_id(String ms_id) {
		return ss.selectOne("student_nature.natureReadOne", ms_id);
	}

	@Override
	public void updateStudent_natureVO(Student_natureVO snvo) {
		ss.update("student_nature.updateNatureInfo", snvo);
	}

	@Override
	public void deleteStudent_natureVO(String ms_id) {
		ss.delete("student_nature.deleteNatureInfo", ms_id);
	}

}
