package kr.or.kosta.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.S1_reviewDTO;
import dto.S1_reviewVO;

@Repository
public class S1_reviewDAO {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	public void s1_reviewInsert(S1_reviewVO vo) {
		ss.insert("s1_reviewMapper.s1_reviewInsert", vo);
	}
	
	public List<S1_reviewDTO> s1_reviewRead(){
		List<S1_reviewDTO> list = ss.selectList("s1_reviewMapper.reviewListRead");
		return list;
	}
	
	public void s1_reviewDelete(int s1_num) {
		ss.delete("s1_reviewMapper.reviewDelete",s1_num);
	}

}
