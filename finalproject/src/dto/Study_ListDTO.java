package dto;

public class Study_ListDTO {
	//2018.12.14
	// 가져오려는 데이터 객체 입력
	private int s_num, s_price;
	private String s_title, s_date1, s_date, s_category;
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public int getS_price() {
		return s_price;
	}
	public void setS_price(int s_price) {
		this.s_price = s_price;
	}
	public String getS_title() {
		return s_title;
	}
	public void setS_title(String s_title) {
		this.s_title = s_title;
	}
	public String getS_date1() {
		return s_date1;
	}
	public void setS_date1(String s_date1) {
		this.s_date1 = s_date1;
	}
	public String getS_date() {
		return s_date;
	}
	public void setS_date(String s_date) {
		this.s_date = s_date;
	}
	public String getS_category() {
		return s_category;
	}
	public void setS_category(String s_category) {
		this.s_category = s_category;
	}
}
