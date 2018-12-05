package kr.or.kosta.mvc.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.kosta.dto.MyMemVO;
import kr.or.kosta.dto.mlogVO;

@Repository
public class MemberDao implements MemberDaoInter{
	
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public void addMem(MyMemVO vo) {
		ss.insert("mymember.join", vo);
	}

	@Override
	public int idChk(String id) {
		return ss.selectOne("mymember.idChk", id);
	}
	
	@Override
	public HashMap<String, String> idChk2(MyMemVO vo) {
		return ss.selectOne("mymember.idChk2", vo);
	}
	
	@Override
	public void addLog(mlogVO vo) {
		ss.insert("mymember2.addmlog", vo);
	}
}