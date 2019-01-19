/**
 * 
 */
package kr.or.kosta.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * <pre>
 * 공통 기능 클래스로서 모든 멤버는 객체생성없이 사용하기 위한 static 메서드로 구성된다.
 * </pre>
 * @author 함정윤
 * @version ver.1.0
 * @since jdk1.8
 * @see kr.or.kosta.mvc.controller.AdminController
 *
 */
public class Utility {
	/** 날짜 기본 형식 : (예시) 2018년 12월 27일 */
	public static final String DATE_PATTERN = "yyyy년 MM월 dd일";
	
	/**
	 * <pre>
	 * 현재날짜를 날짜 기본형식의 문자열로 반환하는 메서드
	 * </pre>
	 * @return 현재날짜 기본형식 문자열(예시: 2018년 12월 27일)
	 */
	public static String getCurrentDate() {
		//return new SimpleDateFormat(DATE_PATTERN).format(new Date());
		return getCurrentDate(DATE_PATTERN, Locale.KOREA);
	}
	
	/**
	 * <pre>
	 * 현재날짜를 날짜 전달받은 형식의 문자열로 반환하는 메서드
	 * </pre>
	 * @param pattern 날짜형식
	 * @return 전달받은 날짜형식의 현재날짜 문자열
	 */
	public static String getCurrentDate(String pattern) {
		//return new SimpleDateFormat(pattern).format(new Date());
		return getCurrentDate(pattern, Locale.KOREA);
	}

	/**
	 * <pre>
	 * 현재날짜를 전달받은 형식, 전달받은 로케일 형식의 문자열로 반환하는 메서드
	 * </pre>
	 * @param pattern 날짜형식
	 * @param locale 로케일
	 * @return 전달받은 로케일 및 날짜형식의 현재날짜 문자열
	 */
	public static String getCurrentDate(String pattern, Locale locale) {
		return new SimpleDateFormat(pattern, locale).format(new Date());
	}
	
}
