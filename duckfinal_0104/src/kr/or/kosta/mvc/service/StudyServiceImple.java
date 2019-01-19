package kr.or.kosta.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.kosta.mvc.dao.S1_reviewDAO;
import kr.or.kosta.mvc.dao.StudyDAO;

@Transactional(propagation=Propagation.REQUIRED,
rollbackFor=Exception.class,readOnly = true)

@Service
public class StudyServiceImple implements StudyServiceInter{
	@Autowired
	private StudyDAO studydao;
	
	@Autowired
	private S1_reviewDAO s1dao;

	@Override
	public void deleteStudy(int num) throws Exception {
		// 1. 받은 넘버값에 대한 모든 댓글 삭제 기능
		// 2. 받은 넘버값에 대한 글 삭제 기능
		s1dao.dels1withstudy(num); 	// 스터디 댓글 삭제
		studydao.deleteStudy(num); 	// 스터디 게시물 삭제
	}
}
