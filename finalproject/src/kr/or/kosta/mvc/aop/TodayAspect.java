package kr.or.kosta.mvc.aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import dto.ClassVO;
import dto.S_mileageVO;
import dto.StudyVO;
import dto.T_mileageVO;
import kr.or.kosta.mvc.dao.ClassDao;
import kr.or.kosta.mvc.dao.Ms_mileageDAO;
import kr.or.kosta.mvc.dao.Mt_mileageDAO;

@Component
@Aspect
public class TodayAspect {
	
	@Autowired
	private Mt_mileageDAO mtdao;
	
	@Autowired
	private Ms_mileageDAO msdao;
	
	@After("execution(* kr.or.kosta.mvc.controller.*.*OpenAop(..))")
	public void afterPoint(JoinPoint jp) {
		Object[] obj = jp.getArgs();
		
		  for(int i=0; i<obj.length;i++) {
			  if(obj[i] instanceof ClassVO) {
				  if(obj[i+1] instanceof HttpSession) {
					  HttpSession session = (HttpSession) obj[i+1];
						String userId = (String) session.getAttribute("mt_id");	
						System.out.println("aop에서 출력한 강사id값"+userId);
						T_mileageVO tmvo = new T_mileageVO();
						tmvo.setMt_id(userId);
						tmvo.setTmNumber(1);
						mtdao.t_mileageupdate(tmvo);
						break;
				  }
			  }else if(obj[i] instanceof StudyVO) {
				  if(obj[i+1] instanceof HttpSession) {
					  HttpSession session = (HttpSession) obj[i+1];
						String userId = (String) session.getAttribute("ms_id");	
						System.out.println("aop에서 출력한 학생id값"+userId);
						S_mileageVO smvo = new S_mileageVO();
						smvo.setMs_id(userId);
						smvo.setSmNumber(1);
						msdao.updateS_mileage(smvo);
						break;
						}
			  }else {
				  System.out.println("아무런 마일리지 변동이 없습니다...");
			  }
		}
	}
	

	   @After("execution(* kr.or.kosta.mvc.controller.*.*CreateNature(..))")
	      public void createNature(JoinPoint jp) {
	         Object[] obj = jp.getArgs();
	         
	         System.out.println("AOP 접근");
	         
	           for(int i=0; i<obj.length; i++) {
	              if(obj[i] instanceof HttpSession) {
	                 HttpSession session = (HttpSession) obj[i];
	                 
	                 if(session.getAttribute("mt_id") != null){
	                    String mt_id = (String) session.getAttribute("mt_id");
	                    System.out.println("강사 아이디는 ==> "+ mt_id);
	                    T_mileageVO tmvo = new T_mileageVO();
	                    tmvo.setMt_id(mt_id);
	                    tmvo.setTm_point(3000);
	                    mtdao.t_mileageCreate(tmvo);
	                    System.out.println("강사 성향입력 포인트 제공완료");
	                 }else if(session.getAttribute("ms_id") != null){
	                    String ms_id = (String) session.getAttribute("ms_id");
	                    System.out.println("회원 아이디는 ==> "+ ms_id);
	                    S_mileageVO smvo = new S_mileageVO();
	                    smvo.setMs_id(ms_id);
	                    smvo.setSm_point(3000);
	                    msdao.createS_mileage(smvo);
	                    System.out.println("학생 성향입력 포인트 제공완료");
	                 }
	              }
	           }
	      }
	
}
