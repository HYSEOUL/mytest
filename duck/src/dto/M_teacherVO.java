package dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class M_teacherVO {
	private int mt_num,mt_birth,mt_boolean;
	private String mt_id,mt_pwd,mt_name,mt_gender,mt_email,mt_phone,mt_regdate, mt_img;
	private MultipartFile mf_img;
	private List<Tc_listVO> tcvo;
	
	public List<Tc_listVO> getTcvo() {
		return tcvo;
	}
	public void setTcvo(List<Tc_listVO> tcvo) {
		this.tcvo = tcvo;
	}
	public String getMt_img() {
		return mt_img;
	}
	public void setMt_img(String mt_img) {
		this.mt_img = mt_img;
	}
	public MultipartFile getMf_img() {
		return mf_img;
	}
	public void setMf_img(MultipartFile mf_img) {
		this.mf_img = mf_img;
	}
	public int getMt_num() {
		return mt_num;
	}
	public void setMt_num(int mt_num) {
		this.mt_num = mt_num;
	}
	public int getMt_birth() {
		return mt_birth;
	}
	public void setMt_birth(int mt_birth) {
		this.mt_birth = mt_birth;
	}
	public int getMt_boolean() {
		return mt_boolean;
	}
	public void setMt_boolean(int mt_boolean) {
		this.mt_boolean = mt_boolean;
	}
	public String getMt_id() {
		return mt_id;
	}
	public void setMt_id(String mt_id) {
		this.mt_id = mt_id;
	}
	public String getMt_pwd() {
		return mt_pwd;
	}
	public void setMt_pwd(String mt_pwd) {
		this.mt_pwd = mt_pwd;
	}
	public String getMt_name() {
		return mt_name;
	}
	public void setMt_name(String mt_name) {
		this.mt_name = mt_name;
	}
	public String getMt_gender() {
		return mt_gender;
	}
	public void setMt_gender(String mt_gender) {
		this.mt_gender = mt_gender;
	}
	public String getMt_email() {
		return mt_email;
	}
	public void setMt_email(String mt_email) {
		this.mt_email = mt_email;
	}
	public String getMt_phone() {
		return mt_phone;
	}
	public void setMt_phone(String mt_phone) {
		this.mt_phone = mt_phone;
	}
	public String getMt_regdate() {
		return mt_regdate;
	}
	public void setMt_regdate(String mt_regdate) {
		this.mt_regdate = mt_regdate;
	}	
}
