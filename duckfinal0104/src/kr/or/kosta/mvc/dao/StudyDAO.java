package kr.or.kosta.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.SearchVO;
import dto.StudyVO;

// StudyVO�� DAO
@Repository
public class StudyDAO implements StudyDAOInter {

	@Autowired
	private SqlSessionTemplate ss;

	// �ۼ�
	@Override
	public void createStudy(StudyVO svo) {
		System.out.println("svo ����: " + svo);
		ss.insert("study.createStudy", svo);
	}

	// ��û�� ���͵� ��� ����
	@Override
	public StudyVO readOneStudy(int s_num) {
		System.out.println("�б�" + s_num);
		return ss.selectOne("study.selectOne", s_num);
	}

	// ���͵� ��� ����
	@Override
	public List<StudyVO> readListStudy(SearchVO sevo) {
		System.out.println("list : ���");
		return ss.selectList("study.selectList", sevo);
	}

	// ���͵� ����
	@Override
	public void updateStudy(StudyVO svo) {
		System.out.println("svo : ����" + svo);
		System.out.println("���͵� ���� dao�Լ�");
		ss.update("study.updateStudy", svo);
	}

	// ���͵� ����
	@Override
	public void deleteStudy(int s_num) {
		System.out.println("num : ����" + s_num);
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
	
	// ���͵� ���� �ҷ��� �� ����̶� ���� �ҷ����� dao
	public List<StudyVO> readoneStudyS1(int num) {
		return ss.selectList("study.studys1list", num);
	}
	
}
