/**
 * 
 */
package kr.or.kosta.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * <pre>
 * ���� ��� Ŭ�����μ� ��� ����� ��ü�������� ����ϱ� ���� static �޼���� �����ȴ�.
 * </pre>
 * @author ������
 * @version ver.1.0
 * @since jdk1.8
 * @see kr.or.kosta.mvc.controller.AdminController
 *
 */
public class Utility {
	/** ��¥ �⺻ ���� : (����) 2018�� 12�� 27�� */
	public static final String DATE_PATTERN = "yyyy�� MM�� dd��";
	
	/**
	 * <pre>
	 * ���糯¥�� ��¥ �⺻������ ���ڿ��� ��ȯ�ϴ� �޼���
	 * </pre>
	 * @return ���糯¥ �⺻���� ���ڿ�(����: 2018�� 12�� 27��)
	 */
	public static String getCurrentDate() {
		//return new SimpleDateFormat(DATE_PATTERN).format(new Date());
		return getCurrentDate(DATE_PATTERN, Locale.KOREA);
	}
	
	/**
	 * <pre>
	 * ���糯¥�� ��¥ ���޹��� ������ ���ڿ��� ��ȯ�ϴ� �޼���
	 * </pre>
	 * @param pattern ��¥����
	 * @return ���޹��� ��¥������ ���糯¥ ���ڿ�
	 */
	public static String getCurrentDate(String pattern) {
		//return new SimpleDateFormat(pattern).format(new Date());
		return getCurrentDate(pattern, Locale.KOREA);
	}

	/**
	 * <pre>
	 * ���糯¥�� ���޹��� ����, ���޹��� ������ ������ ���ڿ��� ��ȯ�ϴ� �޼���
	 * </pre>
	 * @param pattern ��¥����
	 * @param locale ������
	 * @return ���޹��� ������ �� ��¥������ ���糯¥ ���ڿ�
	 */
	public static String getCurrentDate(String pattern, Locale locale) {
		return new SimpleDateFormat(pattern, locale).format(new Date());
	}
	
}
