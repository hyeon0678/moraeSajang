package kr.co.morae.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = {"/", "/main"})
	public String index() {
		return "main/main";
	}
	
	@RequestMapping(value = {"/loginForm"})
	public String login() {
		return "main/login";
	}
	
	@RequestMapping(value = {"/findIdForm"})
	public String findId() {
		return "main/findId";
	}
	
	@RequestMapping(value = {"/findPwForm"})
	public String findPw() {
		return "main/findPw";
	}
}
