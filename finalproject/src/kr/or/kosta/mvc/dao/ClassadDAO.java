package kr.or.kosta.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.ClassVO;
import dto.ClassadVO;

@Repository
public class ClassadDAO {

	@Autowired
	private SqlSessionTemplate ss;

	public List<ClassadVO> adClassVO() {
		return ss.selectList("class_study_ad.classList");
	}

	public ClassadVO adClassSelectOne(int c_num) {
		System.out.println("adSelectOne : " + c_num);
		return ss.selectOne("class_study_ad.selectOneClass", c_num);
	}

}
