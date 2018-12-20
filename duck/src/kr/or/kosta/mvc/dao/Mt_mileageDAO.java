package kr.or.kosta.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.T_mileageVO;

@Repository
public class Mt_mileageDAO implements Mt_mileageDaoInter {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public T_mileageVO tm_point_s(String mt_id) {
		return ss.selectOne("t_mileageMapper.tm_point_s", mt_id);
	}

	@Override
	public void t_mileageupdate(T_mileageVO tmvo) {
		ss.update("t_mileageMapper.t_mileageupdate", tmvo);
	}

	@Override
	public void t_mileageCreate(T_mileageVO tmvo) {
		ss.insert("t_mileageMapper.insert",tmvo);
	}

	@Override
	public void t_mileagedelecte(String mt_id) {
		ss.delete("t_mileageMapper.t_mileageDelete",mt_id);
		
	}
}
