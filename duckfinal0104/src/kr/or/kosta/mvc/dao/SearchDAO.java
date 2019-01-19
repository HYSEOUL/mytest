package kr.or.kosta.mvc.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.ClassVO;
import dto.StudyVO;



@Repository
public class SearchDAO implements SearchDaoInter{

	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public List<ClassVO> readClassSearch(Map<String, String> map) {
		return ss.selectList("search.searchClass", map);
	}

	@Override
	public List<ClassVO> readTeacherSearch(Map<String, String> map) {
		System.out.println("readTeacherSearch()");
		return ss.selectList("search.searchTeacher", map);
	}

	@Override
	public List<StudyVO> readStudySearch(Map<String, String> map) {
		System.out.println("readStudySearch()");
		return ss.selectList("search.searchStudy", map);
	}
	
}
