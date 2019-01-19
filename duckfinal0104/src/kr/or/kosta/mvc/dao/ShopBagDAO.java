package kr.or.kosta.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Sc_listVO;
import dto.ShopBag_Class_listDTO;
import dto.ShopBag_Stuudy_listDTO;
import dto.Study_listVO;

@Repository
public class ShopBagDAO {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	public List<ShopBag_Stuudy_listDTO> readStudyList(Study_listVO slvo){
		return ss.selectList("shopBagMapper.readStudyBagList", slvo);
	}
	
	public List<ShopBag_Class_listDTO> readClassList(Sc_listVO scvo){
		return ss.selectList("shopBagMapper.readClassBagList",scvo);
	}

}
