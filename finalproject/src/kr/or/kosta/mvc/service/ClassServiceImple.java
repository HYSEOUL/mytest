package kr.or.kosta.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.kosta.mvc.dao.C1_ReviewDao;
import kr.or.kosta.mvc.dao.ClassDao;

@Transactional(propagation=Propagation.REQUIRED,
rollbackFor=Exception.class,readOnly = true)

@Service
public class ClassServiceImple implements ClassServiceInter{
	@Autowired
	private ClassDao classdao;
	
	@Autowired
	private C1_ReviewDao c1dao;

	@Override
	public void deleteClass(int num) throws Exception {
		// 1. ���� �ѹ����� ���� ��� ��� ���� ���
		// 2. ���� �ѹ����� ���� �� ���� ���
		c1dao.delc1withclass(num); 	// ���� ��� ����
		classdao.deleteClass(num); 	// ���� �Խù� ����
	}
}
