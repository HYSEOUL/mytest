package kr.or.kosta.mvc.dao;

import java.util.List;

import dto.SearchVO;
import dto.StudyVO;

public interface StudyDAOInter {

	// �ۼ�
	public void createStudy(StudyVO svo);
	// ��û�� ���͵� ��� ����
	public StudyVO readOneStudy(int s_num);
	// ���͵� ��ü ��� ����
	public List<StudyVO> readListStudy(SearchVO sevo);
	// ���͵� ����
	public void updateStudy(StudyVO svo);
	// ���͵� ����
	public void deleteStudy(int num);

	public int getTotalCount(SearchVO sevo);
	
	public List<StudyVO> readStudySearch(SearchVO sevo);
}
