package kr.or.kosta.mvc.dao;

import dto.T_mileageVO;

public interface Mt_mileageDaoInter {
	public void t_mileageCreate(T_mileageVO vo);
	public T_mileageVO tm_point_s(String mt_id);
	public void t_mileageupdate(T_mileageVO tmvo);
	public void t_mileagedelecte(String mt_id);
}
