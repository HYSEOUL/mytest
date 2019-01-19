package kr.or.kosta.pwdemail;

import javax.servlet.http.HttpServletResponse;

public class RandomPassword {
	
	public String randomPassword(int length) {
		int index = 0;
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a',
				'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
				'w', 'x', 'y', 'z' };

		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			index = (int) (charSet.length * Math.random());
			sb.append(charSet[index]);
		}
		System.out.println(sb.toString());
		return sb.toString();
	}

	public String makeContent(String ms_name,String ms_id,String ms_pwd){
    	String content = 
    			ms_name + "님께서 문의하신" + ms_id +
    			"계정의 임시 비밀번호입니다.\r\n"
    					+ "현재 "+ ms_id +
    					"계정은 임시 비밀번호 " + ms_pwd +
    					"로 설정되어 있으니 로그인하셔서\r\n"
    					+ "마이페이지에서 비밀번호를 변경하여 주시기 바랍니다."
    					+ "감사합니다.";
    	return content;
    }
	
	/*public String makeConfirmEmail(String ms_pwd) {
		String content = "고객님께서 문의하신 이메일 인증 번호입니다.\r\n" + 
									"인증 번호는" + ms_pwd + "입니다. 유효기간은 3분입니다.";
		return content;
	}*/
}