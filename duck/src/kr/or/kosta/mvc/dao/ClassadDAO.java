package kr.or.kosta.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.ClassadVO;

@Repository
public class ClassadDAO {

	@Autowired
	private SqlSessionTemplate ss;
	
	public List<ClassadVO> adVO(){
		return ss.selectList("classad.commercial");
	}
	
	public ClassadVO adSelectOne(int ad_num) {
		System.out.println("adSelectOne : " + ad_num);
		return ss.selectOne("classad.selectone", ad_num);
	}
	
}
