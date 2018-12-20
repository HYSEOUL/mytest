package dto;

public class Teacher_natureVO {

	private int tn_num;
	private String mt_id, tn_my, tn_you, tn_category;
	public String getTn_category() {
		return tn_category;
	}
	public void setTn_category(String tn_category) {
		this.tn_category = tn_category;
	}
	public int getTn_num() {
		return tn_num;
	}
	public void setTn_num(int tn_num) {
		this.tn_num = tn_num;
	}
	public String getMt_id() {
		return mt_id;
	}
	public void setMt_id(String mt_id) {
		this.mt_id = mt_id;
	}
	public String getTn_my() {
		return tn_my;
	}
	public void setTn_my(String tn_my) {
		this.tn_my = tn_my;
	}
	public String getTn_you() {
		return tn_you;
	}
	public void setTn_you(String tn_you) {
		this.tn_you = tn_you;
	}	
}
