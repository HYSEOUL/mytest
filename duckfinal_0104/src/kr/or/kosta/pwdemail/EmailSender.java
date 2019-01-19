package kr.or.kosta.pwdemail;

import java.io.PrintWriter;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

public class EmailSender {

	@Autowired
	protected JavaMailSenderImpl mailSender;

	private HttpServletResponse response;
	
	public void sendEmail(Email email) throws Exception {

		MimeMessage msg = mailSender.createMimeMessage();
		//MimeMessageHelper messageHelper  = new MimeMessageHelper(msg, true, "UTF-8");

		try {
			msg.setSubject(email.getSubject());
			msg.setText(email.getContent(), "UTF-8", "html");
			msg.setRecipients(
					MimeMessage.RecipientType.TO, 
					InternetAddress.parse(email.getReceiver()));
			System.out.println(email.getSubject());
			System.out.println(email.getContent());
			System.out.println(email.getReceiver());

/*			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용
*/
		} catch (MessagingException e) {
			System.out.println("MessagingException");
			e.printStackTrace();
		}

		try {
			System.out.println(mailSender.getUsername());
			System.out.println(mailSender.getPassword());
			mailSender.send(msg);
			System.out.println("send success!!");
		} catch (MailException e) {
			System.out.println("MailException");
			e.printStackTrace();
		}
		
	}
}
