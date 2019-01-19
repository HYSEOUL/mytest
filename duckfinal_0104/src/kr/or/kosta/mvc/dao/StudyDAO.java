package kr.or.kosta.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.SearchVO;
import dto.StudyVO;

// StudyVO의 DAO
@Repository
public class StudyDAO implements StudyDAOInter {

	@Autowired
	private SqlSessionTemplate ss;

	// 작성
	@Override
	public void createStudy(StudyVO svo) {
		System.out.println("svo 생성: " + svo);
		ss.insert("study.createStudy", svo);
	}

	// 신청한 스터디 목록 보기
	@Override
	public StudyVO readOneStudy(int s_num) {
		System.out.println("읽기" + s_num);
		return ss.selectOne("study.selectOne", s_num);
	}

	// 스터디 목록 보기
	@Override
	public List<StudyVO> readListStudy(SearchVO sevo) {
		System.out.println("list : 목록");
		return ss.selectList("study.selectList", sevo);
	}

	// 스터디 수정
	@Override
	public void updateStudy(StudyVO svo) {
		System.out.println("svo : 수정" + svo);
		System.out.println("스터디 수정 dao입성");
		ss.update("study.updateStudy", svo);
	}

	// 스터디 삭제
	@Override
	public void deleteStudy(int s_num) {
		System.out.println("num : 삭제" + s_num);
		ss.delete("study.deleteStudy", s_num);
	}

	@Override
	public int getTotalCount(SearchVO sevo) {
		return ss.selectOne("study.count", sevo);
	}

	@Override
	public List<StudyVO> readStudySearch(SearchVO sevo) {
		System.out.println("searchType" + sevo.getSearchType());
		System.out.println("searchValue" + sevo.getSearchValue());
		return ss.selectList("study.listsearch", sevo);
	}
	
	// 스터디 정보 불러올 때 댓글이랑 같이 불러오는 dao
	public List<StudyVO> readoneStudyS1(int num) {
		return ss.selectList("study.studys1list", num);
	}
	
}
