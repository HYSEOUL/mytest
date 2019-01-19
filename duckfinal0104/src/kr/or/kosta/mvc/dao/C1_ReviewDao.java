package kr.or.kosta.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.C1_reviewVO;

@Repository
public class C1_ReviewDao {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	public List<C1_reviewVO> readC1_Review(int num) {
		return ss.selectList("c1_review.selectreviewlist", num);
	}
	
	public void createreview(C1_reviewVO c1vo) {
		ss.insert("c1_review.createview",c1vo);
	}
	
	public void updateview(C1_reviewVO c1vo) {
		ss.update("c1_review.updateview",c1vo);
	}
	
	public void deletereview(int num) {
		ss.delete("c1_review.deleteview",num);
	}
	
	public void delc1withclass(int num) {
		ss.delete("c1_review.deletewithclass",num);
	}
	
}
