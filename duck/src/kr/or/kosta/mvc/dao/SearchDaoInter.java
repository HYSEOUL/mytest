package kr.or.kosta.mvc.dao;

import java.util.List;
import java.util.Map;

import dto.ClassVO;
import dto.StudyVO;


public interface SearchDaoInter {
	public List<ClassVO> readClassSearch(Map<String, String> map);
	public List<ClassVO> readTeacherSearch(Map<String, String> map);
	public List<StudyVO> readStudySearch(Map<String, String> map);
}
