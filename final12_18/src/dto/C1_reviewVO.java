package dto;

public class C1_reviewVO {
	int c1_num; 		// °­ÀÇ ¸®ºä ÀÎµ¦½º
	int c_num; 			// ¸®ºä¸¦ Ã£¾Æ °¥°­ÀÇ ±Û ÀÎµ¦½º
	String c1_writer; 	// ¸®ºä ÀÛ¼ºÀÚ
	String c1_reply; 		// °­ÀÇ ´ñ±Û ³»¿ë
	String c1_date; 	// ´ñ±Û »ý¼º ³¯Â¥
	int c1_stars; 		// ´ñ±Û º°Á¡
	public String getC1_reply() {
		return c1_reply;
	}
	public void setC1_reply(String c1_reply) {
		this.c1_reply = c1_reply;
	}
	public int getC1_num() {
		return c1_num;
	}
	public void setC1_num(int c1_num) {
		this.c1_num = c1_num;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getC1_writer() {
		return c1_writer;
	}
	public void setC1_writer(String c1_writer) {
		this.c1_writer = c1_writer;
	}
	
	public String getC1_date() {
		return c1_date;
	}
	public void setC1_date(String c1_date) {
		this.c1_date = c1_date;
	}
	public int getC1_stars() {
		return c1_stars;
	}
	public void setC1_stars(int c1_stars) {
		this.c1_stars = c1_stars;
	}
	
}
