package dto;

//학생 성향 테이블
public class Student_natureVO {

	// 학생 성향 번호 - PK
	private int sn_num;
	// 아이디 - PK/FK
	private String ms_id;
	// 나의 성향
	private String sn_my;
	// 상대방(내가 원하는) 성향
	private String sn_you;
	// 관심 분야
	private String sn_category;

	public int getSn_num() {
		return sn_num;
	}

	public void setSn_num(int sn_num) {
		this.sn_num = sn_num;
	}

	public String getMs_id() {
		return ms_id;
	}

	public void setMs_id(String ms_id) {
		this.ms_id = ms_id;
	}

	public String getSn_my() {
		return sn_my;
	}

	public void setSn_my(String sn_my) {
		this.sn_my = sn_my;
	}

	public String getSn_you() {
		return sn_you;
	}

	public void setSn_you(String sn_you) {
		this.sn_you = sn_you;
	}

	public String getSn_category() {
		return sn_category;
	}

	public void setSn_category(String sn_category) {
		this.sn_category = sn_category;
	}

}