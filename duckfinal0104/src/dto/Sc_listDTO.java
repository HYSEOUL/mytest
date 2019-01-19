package dto;

public class Sc_listDTO {
	// -- 2018.12.13 추가내용
	// 가져오려는 데이터 객체 입력
	private int c_num, c_price;
	private String ms_id, c_title, c_name, c_date1, c_date2, c_category;

	public String getMs_id() {
		return ms_id;
	}

	public void setMs_id(String ms_id) {
		this.ms_id = ms_id;
	}

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}

	public int getC_price() {
		return c_price;
	}

	public void setC_price(int c_price) {
		this.c_price = c_price;
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

	public String getC_category() {
		return c_category;
	}

	public void setC_category(String c_category) {
		this.c_category = c_category;
	}

}