package kr.or.kosta.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.kosta.vo.UserMemberVO;

@Repository
public class UserMemberDao implements UserMemberInter{

	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public UserMemberVO loginChk(UserMemberVO vo) {
		return ss.selectOne("usermember.loginChk", vo);
	}

	@Override
	public void addMem(UserMemberVO vo) {
		System.out.println("vo : " + vo);
		ss.insert("usermember.join", vo);
	}

	@Override
	public int idChk(String id) {
		System.out.println("id : " + id);
		return ss.selectOne("usermember.idChk", id);
	}
}