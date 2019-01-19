package kr.or.kosta.mvc.aop;

import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class PushAlarmLoggerAspect {
/*
	@Autowired
	private PushAlarmInter pushAlarmInter;

	@AfterReturning("execution(* kr.or.kosta.mvc.controller.*.pushAlarm*(..))")
	public ModelAndView loginLogger(JoinPoint jp) {
		Object[] fd = jp.getArgs();

		ModelAndView rpath = null;
		String methodName = jp.getSignature().getName();
		System.out.println("methodName : " + methodName);

		if (methodName.equals("pushAlarmProcess")) {
			PushAlarmLoggerDTO vo = new PushAlarmLoggerDTO();
			if (fd[0] instanceof HttpSession && fd[1] instanceof HttpServletRequest) {
				HttpSession session = (HttpSession) fd[0];
				HttpServletRequest request = (HttpServletRequest) fd[1];
				String id = (String) session.getAttribute("id");

				if (id == null) {
					// 로그인 했지만 세션의 값이 없을 때
				} else {
					vo.setIdn(id);
					vo.setStatus("pushAlarm");
					vo.setReip(request.getRemoteAddr());
					vo.setUagent("web");
					pushAlarmInter.addPushAlarmLogging(vo);
				}
			}
		} 
		return rpath;
	}*/
}

/*
 * @AfterReturning(pointcut="execution(* kr.or.kosta.mvc.controller.*.log*(..))"
 * , returning="msg") public void afterReturnning(JoinPoint jp, Object msg) {
 * ModelAndView m = (ModelAndView)msg; Object[] list = jp.getArgs();
 * 
 * if(list[0] instanceof HttpSession) {
 * 
 * }else if(list[1] instanceof HttpServletRequest) {
 * 
 * }
 * 
 * }
 */
