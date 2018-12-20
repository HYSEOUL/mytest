package kr.or.kosta.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.ShopBag_Class_listDTO;
import dto.ShopBag_Stuudy_listDTO;

@Repository
public class ShopBagDAO {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	public List<ShopBag_Stuudy_listDTO> readStudyList(String sl_id){
		return ss.selectList("shopBagMapper.readStudyBagList", sl_id);
	}
	
	public List<ShopBag_Class_listDTO> readClassList(String sl_id){
		return ss.selectList("shopBagMapper.readClassBagList",sl_id);
	}

}
