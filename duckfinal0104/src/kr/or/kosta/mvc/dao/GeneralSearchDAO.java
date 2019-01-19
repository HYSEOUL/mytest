package kr.or.kosta.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.ClassVO;
import dto.SearchVO;
import dto.StudyVO;

@Repository
public class GeneralSearchDAO {

	@Autowired
	private SqlSessionTemplate ss;
	
	public int getTotalCount(SearchVO sevo) {
		return ss.selectOne("generalSearch.count",sevo);
	}
	
	//2018.12.23 정호연 스터디 추가
	public int getTotalCount_study(SearchVO sevo) {
		return ss.selectOne("generalSearch.count_study",sevo);
	}
	
	public List<ClassVO> generalListSearch(SearchVO sevo){
		System.out.println("generalListSearch(SearchVO sevo)");
		return ss.selectList("generalSearch.field", sevo);
	}
	
	//2018.12.23 정호연 스터디 추가
	public List<StudyVO> selectGeneralSearch_study(SearchVO sevo) {
		System.out.println("generalListSearch(SearchVO sevo)");
		return ss.selectList("generalSearch.contact", sevo);
	}
	
	//2018.12.16 박준호 통합검색 추가
	public int getClassSearchCount(SearchVO sevo) {
		return ss.selectOne("generalSearch.classsearchcount",sevo);
	}
	
	//2018.12.16 박준호 통합검색 추가
	public int getStudySearchCount(SearchVO sevo) {
		return ss.selectOne("generalSearch.studysearchcount",sevo);
	}
	
	public List<ClassVO> classListSearch(SearchVO sevo){
		return ss.selectList("generalSearch.classfield", sevo);
	}
	
	public List<StudyVO> studyListSearch(SearchVO sevo){
		return ss.selectList("generalSearch.studyfield", sevo);
	}
	
	
	//2018.12.16 박준호 통합검색 추가
	/*public List<ClassVO> se*/
}
