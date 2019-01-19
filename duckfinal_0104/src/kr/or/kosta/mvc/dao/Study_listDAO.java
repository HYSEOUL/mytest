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
	
	/*다혜부분*/
	// 스터디 리스트 입력
	public void insertStudyList(Study_listVO slvo) {
		ss.insert("study.insertStudyList",slvo);
	}
	// 스터디 리스트 업데이트
	public void updateStudyList(Study_listVO slvo) {
		ss.update("study.updateClassList",slvo);
	}
	// 스터디 리스트 삭제
	public void deleteStudyList(int sl_num) {
		ss.delete("study.deleteStudy_list",sl_num);
	}
	
	/*다혜부분끗*/
}
