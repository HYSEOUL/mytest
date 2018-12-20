package dto;

import org.springframework.web.multipart.MultipartFile;

// 스터디 개설
public class StudyVO {
	
	// 스터디 번호 - PK
	private int s_num;
	// 개설 학생아이디 - PK/FK
	private String ms_id;
	// 스터디 제목
	private String s_title;
	// 스터디 분류
	private String s_category;
	// 스터디 도/시 단위 주소
	private String s_loc1;
	// 스터디 상세 주소
	private String s_loc2;
	// 스터디 시작 날짜
	private String s_date1;
	// 스터디 종료 날짜
	private String s_date2;
	// 스터디 횟수
	private int s_count;
	// 스터디 인원
	private int s_pnum;
	// 스터디 소개
	private String s_comment;
	// 금액
	private int s_price;
	// 과금분기
	private int s_point;
	// 첨부 파일
	private String s_img;
	private MultipartFile mf_img;
	private String path;
	
	public int getS_point() {
		return s_point;
	}
	public void setS_point(int s_point) {
		this.s_point = s_point;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public String getMs_id() {
		return ms_id;
	}
	public void setMs_id(String ms_id) {
		this.ms_id = ms_id;
	}
	public String getS_title() {
		return s_title;
	}
	public void setS_title(String s_title) {
		this.s_title = s_title;
	}
	public String getS_category() {
		return s_category;
	}
	public void setS_category(String s_category) {
		this.s_category = s_category;
	}
	public String getS_loc1() {
		return s_loc1;
	}
	public void setS_loc1(String s_loc1) {
		this.s_loc1 = s_loc1;
	}
	public String getS_loc2() {
		return s_loc2;
	}
	public void setS_loc2(String s_loc2) {
		this.s_loc2 = s_loc2;
	}
	public String getS_date1() {
		return s_date1;
	}
	public void setS_date1(String s_date1) {
		this.s_date1 = s_date1;
	}
	public String getS_date2() {
		return s_date2;
	}
	public void setS_date2(String s_date2) {
		this.s_date2 = s_date2;
	}
	public int getS_count() {
		return s_count;
	}
	public void setS_count(int s_count) {
		this.s_count = s_count;
	}
	public int getS_pnum() {
		return s_pnum;
	}
	public void setS_pnum(int s_pnum) {
		this.s_pnum = s_pnum;
	}
	public String getS_comment() {
		return s_comment;
	}
	public void setS_comment(String s_comment) {
		this.s_comment = s_comment;
	}
	public int getS_price() {
		return s_price;
	}
	public void setS_price(int s_price) {
		this.s_price = s_price;
	}
	public String getS_img() {
		return s_img;
	}
	public void setS_img(String s_img) {
		this.s_img = s_img;
	}
	public MultipartFile getMf_img() {
		return mf_img;
	}
	public void setMf_img(MultipartFile mf_img) {
		this.mf_img = mf_img;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	


}
