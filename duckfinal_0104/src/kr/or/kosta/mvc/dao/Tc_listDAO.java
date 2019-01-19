package kr.or.kosta.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Sc_listVO;
import dto.Tc_listVO;


@Repository
public class Tc_listDAO {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	public List<Tc_listVO> tc_list_read(String mt_id){
		List<Tc_listVO> list = ss.selectList("tc_listMapper.tc_list",mt_id);
		return list;
	}
	
	public void createTc_list(Tc_listVO tcvo) {
		ss.insert("tc_listMapper.create",tcvo);
	}
	
	public void deleteTc_list(int tc_num) {
		ss.delete("tc_listMapper.tc_listDelete",tc_num);
	}
	// 개설한 강좌에 대한 학생리스트 - 이다혜 1224
	public List<Sc_listVO> tc_list_student_read(String c_title){
		List<Sc_listVO> list = ss.selectList("tc_listMapper.tc_list_student",c_title);
		return list;
	}
}
