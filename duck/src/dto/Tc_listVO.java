package dto;

import java.util.List;

public class Tc_listVO {
	private int tc_num;
	private String c_title,mt_id;
	private List<ClassVO> cvo;
	
	public List<ClassVO> getCvo() {
		return cvo;
	}
	public void setCvo(List<ClassVO> cvo) {
		this.cvo = cvo;
	}
	public int getTc_num() {
		return tc_num;
	}
	public void setTc_num(int tc_num) {
		this.tc_num = tc_num;
	}
	public String getC_title() {
		return c_title;
	}
	public void setC_title(String c_title) {
		this.c_title = c_title;
	}
	public String getMt_id() {
		return mt_id;
	}
	public void setMt_id(String mt_id) {
		this.mt_id = mt_id;
	}
	
}
