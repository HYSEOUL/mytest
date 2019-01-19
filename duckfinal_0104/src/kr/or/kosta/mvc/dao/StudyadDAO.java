package kr.or.kosta.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.StudyadVO;

@Repository
public class StudyadDAO {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	public List<StudyadVO> adStudyVO() {
		return ss.selectList("class_study_ad.studyList");
	}

	public StudyadVO adStudySelectOne(int s_num) {
		return ss.selectOne("class_study_ad.selectOneStudy", s_num);
	}
}
