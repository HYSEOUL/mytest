package kr.or.kosta.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class myTestController {
	//git에 적용될 새로운 코드
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public String myview() {
		return "myview";
	}
}
