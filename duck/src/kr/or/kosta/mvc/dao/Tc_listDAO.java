package kr.or.kosta.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Tc_listVO;


@Repository
public class Tc_listDAO {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	public List<Tc_listVO> tc_list_1(String mt_id){
		List<Tc_listVO> list = ss.selectList("tc_listMapper.tc_list",mt_id);
		return list;
	}
	
	public void createTc_list(Tc_listVO tcvo) {
		ss.insert("tc_listMapper.create",tcvo);
	}
	
	public void deleteTc_list(int tc_num) {
		ss.delete("tc_listMapper.tc_listDelete",tc_num);
	}
	
}
