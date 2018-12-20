package kr.or.kosta.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.ClassVO;
import dto.SearchVO;

@Repository
public class GeneralSearchDAO {

	@Autowired
	private SqlSessionTemplate ss;
	
	public int getTotalCount(SearchVO sevo) {
		return ss.selectOne("generalSearch.count",sevo);
	}
	
	public List<ClassVO> generalListSearch(SearchVO sevo){
		System.out.println("generalListSearch(SearchVO sevo)");
		return ss.selectList("generalSearch.field", sevo);
	}
}
