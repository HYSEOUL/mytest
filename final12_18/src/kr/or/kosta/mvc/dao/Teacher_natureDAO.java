package kr.or.kosta.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Teacher_natureVO;

@Repository
public class Teacher_natureDAO implements Teacher_natureDAOInter{

	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public void createTeacher_natureVO(Teacher_natureVO tnvo) throws Exception {
		ss.insert("teacher_nature.natureCreate", tnvo);
	}

	@Override
	public Teacher_natureVO readMt_id(String mt_id) throws Exception {
		return ss.selectOne("teacher_nature.natureRead", mt_id);
	}

	@Override
	public void updateTeacher_natureVO(Teacher_natureVO tnvo) throws Exception {
		ss.update("teacher_nature.natureUpdate", tnvo);
	}

	@Override
	public void deleteTeacher_natureVO(String mt_id) throws Exception {
		ss.delete("teacher_nature.natureDelete", mt_id);
	}
	
	public void createTeacher_natureVO2(Teacher_natureVO tnvo) {
		ss.insert("teacher_nature.mtnatureCreate", tnvo);
	}
	
}
