package kr.co.morae.user.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.morae.user.dto.UserDto;
import kr.co.morae.user.service.UserService;

@Controller
public class UserController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired UserService service;
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
		public String login(@RequestParam String id, @RequestParam String pw, HttpSession session, Model model) {
			String page = "main/login";
			logger.info("id : "+id+" / pw : "+pw);
			UserDto dto =  service.login(id,pw);
			if(dto != null) { // 로그인 성공
				session.setAttribute("userInfo", dto);
				logger.info("해당 아이디 권한 : "+dto.getAuthType());
				page = "redirect:/main/gbList";
				if(dto.getAuthNo() == 1 || dto.getAuthNo() == 4) { // 관리자일 경우
					page = "redirect:/admin/adminUser";
				}else if(dto.getAuthNo() == 2) { // 차단된 사용자일 경우
					session.removeAttribute("userInfo");
					model.addAttribute("msg","차단된 사용자입니다. 고객센터에 문의해주세요.");
					page = "main/login";
				}
			}else { // 로그인 실패
				model.addAttribute("msg","아이디 또는 비밀번호를 확인해주세요.");
			}
			return page;
		}
	
	@RequestMapping(value = "/myPage/logout")
		public String logout(HttpSession session) {
		session.removeAttribute("userInfo");
		return "redirect:/main/main";
	}
	
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> findId(@RequestParam HashMap<String, String> params) {
		logger.info("params : "+params);
		HashMap<String, Object> result = new HashMap<String, Object>();
		String foundId = service.findId(params);
		logger.info(foundId);
		result.put("foundId", foundId);
		return result;
	}
	
	
}
