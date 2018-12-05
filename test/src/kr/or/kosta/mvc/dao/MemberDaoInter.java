package kr.or.kosta.mvc.dao;

import java.util.HashMap;

import kr.or.kosta.dto.MyMemVO;
import kr.or.kosta.dto.mlogVO;

public interface MemberDaoInter {
	public void addMem(MyMemVO vo);
	public int idChk(String id);
	public HashMap<String, String> idChk2(MyMemVO vo);
	public void addLog(mlogVO vo);
}