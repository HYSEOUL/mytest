package kr.or.kosta.mvc.dao;

import kr.or.kosta.vo.UserMemberVO;

public interface UserMemberInter {
	public void addMem(UserMemberVO vo);
	public int idChk(String id);
	public UserMemberVO loginChk(UserMemberVO vo);
}
