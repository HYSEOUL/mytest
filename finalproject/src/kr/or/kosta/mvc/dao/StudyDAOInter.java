package kr.or.kosta.mvc.dao;

import java.util.List;

import dto.SearchVO;
import dto.StudyVO;

public interface StudyDAOInter {

	// 작성
	public void createStudy(StudyVO svo);
	// 신청한 스터디 목록 보기
	public StudyVO readOneStudy(int s_num);
	// 스터디 전체 목록 보기
	public List<StudyVO> readListStudy(SearchVO sevo);
	// 스터디 수정
	public void updateStudy(StudyVO svo);
	// 스터디 삭제
	public void deleteStudy(int num);

	public int getTotalCount(SearchVO sevo);
	
	public List<StudyVO> readStudySearch(SearchVO sevo);
}
