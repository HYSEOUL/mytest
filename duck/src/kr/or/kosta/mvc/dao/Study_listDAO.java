package kr.or.kosta.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Study_ListDTO;
import dto.Study_listVO;

@Repository
public class Study_listDAO {

	@Autowired
	private SqlSessionTemplate ss;
	
	public List<Study_ListDTO> study_list_1(String ms_id){
		List<Study_ListDTO> list = ss.selectList("study_listMapper.study_list_1", ms_id);
		System.out.println("dao test");
		return list;		
	}
	
	/*�����κ�*/
	// ���͵� ����Ʈ �Է�
	public void insertStudyList(Study_listVO slvo) {
		ss.insert("study.insertStudyList",slvo);
	}
	// ���͵� ����Ʈ ������Ʈ
	public void updateStudyList(Study_listVO slvo) {
		ss.update("study.updateClassList",slvo);
	}
	// ���͵� ����Ʈ ����
	public void deleteStudyList(int sl_num) {
		ss.delete("study.deleteStudy_list",sl_num);
	}
	
	/*�����κв�*/
}
