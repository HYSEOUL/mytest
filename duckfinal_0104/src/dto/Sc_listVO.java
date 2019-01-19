package dto;

import java.util.List;

public class Sc_listVO {
	private int sc_num,sc_buy;
	private String c_title,ms_id;
	
	private List<ClassVO> cvo;
	
	private List<M_studentVO> msvo;
	
	public List<M_studentVO> getMsvo() {
		return msvo;
	}
	public void setMsvo(List<M_studentVO> msvo) {
		this.msvo = msvo;
	}
	public List<ClassVO> getCvo() {
		return cvo;
	}
	public void setCvo(List<ClassVO> cvo) {
		this.cvo = cvo;
	}
	public int getSc_num() {
		return sc_num;
	}
	public void setSc_num(int sc_num) {
		this.sc_num = sc_num;
	}
	public String getC_title() {
		return c_title;
	}
	public void setC_title(String c_title) {
		this.c_title = c_title;
	}
	public String getMs_id() {
		return ms_id;
	}
	public void setMs_id(String ms_id) {
		this.ms_id = ms_id;
	}
	public int getSc_buy() {
		return sc_buy;
	}
	public void setSc_buy(int sc_buy) {
		this.sc_buy = sc_buy;
	}
	
	
}
