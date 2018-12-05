package kr.or.kosta.mvc.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import kr.or.kosta.dto.mlogVO;
import kr.or.kosta.mvc.dao.MemberDaoInter;

@Component
@Aspect
public class LogAdvice {
	
	@Autowired
	private MemberDaoInter memberDaoInter;
	
	   @Around("execution(* kr.or.kosta.mvc.controller.*.*Process(..))")
	    public ModelAndView afterReturningTargetMethod(ProceedingJoinPoint jp) throws Throwable {
		   Object[] o = jp.getArgs();
		   Object o2 = null;
	    	if (o[0] instanceof HttpServletRequest) {
	    		HttpServletRequest m = (HttpServletRequest)o[0];
	    		HttpSession s = m.getSession();
	    		
	    		if(s.getAttribute("id")!=null) {	// 로그아웃
	    			mlogVO v = new mlogVO();
    				v.setIdn((String)s.getAttribute("id"));
    				v.setReip(m.getRemoteAddr());
    				v.setUagent("web");
    				v.setStat("logout");
    				memberDaoInter.addLog(v);
    				 o2 = jp.proceed();
	    		}else {		// 로그인
	    			o2 = jp.proceed();
	    			ModelAndView str = (ModelAndView)o2;
	    			System.out.println("result" + (String)s.getAttribute("id"));
	    			if(!(str.getViewName()).equals("error")) {
	    				mlogVO v = new mlogVO();
	    				v.setIdn((String)s.getAttribute("id"));
	    				v.setReip(m.getRemoteAddr());
	    				v.setUagent("web");
	    				v.setStat("login");
	    				memberDaoInter.addLog(v);
	    			}
	    		}
	    	}
	    	ModelAndView result = (ModelAndView)o2;
	    	return result;
	   }
}