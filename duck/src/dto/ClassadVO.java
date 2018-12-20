package dto;

import org.springframework.web.multipart.MultipartFile;

public class ClassadVO {
	private int ad_num;
	private String ad_title, ad_date1, ad_date2, ad_loc1, ad_img;
	private MultipartFile mf_img;

	public int getAd_num() {
		return ad_num;
	}

	public void setAd_num(int ad_num) {
		System.out.println("세팅중인 숫자 : "+ad_num);
		this.ad_num = ad_num;
	}

	public String getAd_title() {
		return ad_title;
	}

	public void setAd_title(String ad_title) {
		this.ad_title = ad_title;
	}

	public String getAd_date1() {
		return ad_date1;
	}

	public void setAd_date1(String ad_date1) {
		this.ad_date1 = ad_date1;
	}

	public String getAd_date2() {
		return ad_date2;
	}

	public void setAd_date2(String ad_date2) {
		this.ad_date2 = ad_date2;
	}

	public String getAd_loc1() {
		return ad_loc1;
	}

	public void setAd_loc1(String ad_loc1) {
		this.ad_loc1 = ad_loc1;
	}

	public String getAd_img() {
		return ad_img;
	}

	public void setAd_img(String ad_img) {
		this.ad_img = ad_img;
	}

	public MultipartFile getMf_img() {
		return mf_img;
	}

	public void setMf_img(MultipartFile mf_img) {
		this.mf_img = mf_img;
	}

}
