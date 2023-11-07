package kr.co.morae.mypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.morae.mypage.service.MypageService;
import kr.co.morae.user.dto.UserDto;
@Controller
public class MypageController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MypageService service;
	
	@RequestMapping(value="/mypage")
	public String mypage() {
		logger.info("마이 페이지 이동 요청");
		return "mypage/myPage";
	}

	@RequestMapping(value="/my/page/myInfo.ajax")
	@ResponseBody
	public HashMap<String, Object> myInfo(Model model, HttpSession session){
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		String userId = userInfo.getUserId();
		HashMap<String, Object> map = service.myInfo(userId);
		return map;
	}
	
	@RequestMapping(value="/my/alarmSet.ajax")
	@ResponseBody
	public int alarmSet(Model model, HttpSession session, @RequestParam int alarmSetNo) {
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		String userId = userInfo.getUserId();
		return service.alarmSet(alarmSetNo,userId);
	}
	
	@RequestMapping(value="/my/alarmToggle.ajax")
	@ResponseBody
	public int alarmToggle(Model model, HttpSession session) {
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		String userId = userInfo.getUserId();
		return service.alarmToggle(userId);
	}
	
	
}	
