package dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ClassadVO {

	private int c_num; // 강의 생성 인덱스
	private String c_title; // 생성 강의 이름
	private String c_name; // 강의 생성자 이름
	private String c_date1; // 강의 시작 시간
	private String c_date2; // 강의 종료 시간
	private int c_pnum; // 강의 인원 수
	private String c_loc1; // 강의 시 단위 주소
	private String c_loc2; // 강의 도 단위 주소
	private String c_img; // 강의 이미지
	private String c_comment; // 강의 상세 설명
	private String c_category; // 강의 분야
	private int c_price; // 강의 참가비
	private int c_count; // 주 강의 횟수

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}

	public String getC_title() {
		return c_title;
	}

	public void setC_title(String c_title) {
		this.c_title = c_title;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_date1() {
		return c_date1;
	}

	public void setC_date1(String c_date1) {
		this.c_date1 = c_date1;
	}

	public String getC_date2() {
		return c_date2;
	}

	public void setC_date2(String c_date2) {
		this.c_date2 = c_date2;
	}

	public int getC_pnum() {
		return c_pnum;
	}

	public void setC_pnum(int c_pnum) {
		this.c_pnum = c_pnum;
	}

	public String getC_loc1() {
		return c_loc1;
	}

	public void setC_loc1(String c_loc1) {
		this.c_loc1 = c_loc1;
	}

	public String getC_loc2() {
		return c_loc2;
	}

	public void setC_loc2(String c_loc2) {
		this.c_loc2 = c_loc2;
	}

	public String getC_img() {
		return c_img;
	}

	public void setC_img(String c_img) {
		this.c_img = c_img;
	}

	public String getC_comment() {
		return c_comment;
	}

	public void setC_comment(String c_comment) {
		this.c_comment = c_comment;
	}

	public String getC_category() {
		return c_category;
	}

	public void setC_category(String c_category) {
		this.c_category = c_category;
	}

	public int getC_price() {
		return c_price;
	}

	public void setC_price(int c_price) {
		this.c_price = c_price;
	}

	public int getC_count() {
		return c_count;
	}

	public void setC_count(int c_count) {
		this.c_count = c_count;
	}

}
