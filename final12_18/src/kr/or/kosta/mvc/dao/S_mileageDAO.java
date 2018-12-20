package kr.or.kosta.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.S_mileageVO;
@Repository
public class S_mileageDAO {

	@Autowired
	private SqlSessionTemplate ss;
	
	public void createS_mileage(S_mileageVO smvo) {
		ss.insert("s_mileage.create", smvo);
	}
	
	public S_mileageVO selectOneS_mileage(String ms_id) {
		return ss.selectOne("s_mileage.selectOne", ms_id);
	}
	
	public void updateS_mileage(S_mileageVO smvo) {
		ss.update("s_mileage.update",smvo);
	}
	
}
