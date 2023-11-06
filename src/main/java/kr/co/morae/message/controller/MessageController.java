package kr.co.morae.message.controller;

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

import kr.co.morae.message.dto.MessageDto;
import kr.co.morae.message.service.MessageService;
import kr.co.morae.user.dto.UserDto;

@Controller
public class MessageController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MessageService service;
	
	@RequestMapping(value = "/msgWrite")
	public String messageWrite(HttpSession session, Model model) {
		String page = "msg/msgWrite";
	      if(session.getAttribute("userInfo") == null) {
	         model.addAttribute("msg","비정상적인 접근입니다.");
	         page = "main/main";
	      }
	      return page;
	}
	
	@RequestMapping(value = "/msgRcvList")
	public String msgRcvList() {
		return "msg/msgRcvList";
	}
	
	@RequestMapping(value = "/msgSendList")
	public String msgSendList() {
		return "msg/msgSendList";
	}
	
	@RequestMapping(value = "/nameCheck.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> nameCheck(@RequestParam String nickName, HttpSession session){
		logger.info("nickName : "+nickName);
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		String userId = userInfo.getUserId();
		int check = service.nameCheck(nickName, userId);
		logger.info("check : "+check);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("check", check);
		return result;
	}
	
	@RequestMapping(value = "/msgSend", method = RequestMethod.POST)
	public String msgSend(@RequestParam String nickName, @RequestParam String content, HttpSession session, Model model) {
		String page = "msg/msgWrite";
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		String userId = userInfo.getUserId();
		int row = service.msgSend(content, userId, nickName);
		if(row == 1) {
			model.addAttribute("msg", nickName+"님께 쪽지를 전달하였습니다.");
		}else {
			model.addAttribute("msg", "자신에게 쪽지를 전달할 수 없습니다.");
		}
		return page;
	}
	
	@RequestMapping(value = "/msgRcvListCall.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> msgRcvListCall(@RequestParam String page, HttpSession session){
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		String userId = userInfo.getUserId();
		return service.rcvList(userId, page);
	}
	
	@RequestMapping(value = "/msgSendListCall.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> msgSendListCall(@RequestParam String page, HttpSession session){
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		String userId = userInfo.getUserId();
		return service.sendList(userId, page);
	}
	
	@RequestMapping(value = "/msgRcvDetail", method = RequestMethod.GET)
	public String msgRcvDetail(@RequestParam String messagesNo, HttpSession session, Model model) {
		MessageDto msgInfo = service.msgDetail(messagesNo);
		service.msgRead(messagesNo);
		model.addAttribute("item",msgInfo);
		return "msg/msgRcvDetail";
	}
	
	@RequestMapping(value = "/msgSendDetail", method = RequestMethod.GET)
	public String msgSendDetail(@RequestParam String messagesNo, HttpSession session, Model model) {
		MessageDto msgInfo = service.msgDetail(messagesNo);
		model.addAttribute("item",msgInfo);
		return "msg/msgSendDetail";
	}
	
	@RequestMapping(value = "/reply")
	public String reply(@RequestParam String senerNickName, Model model) {
		model.addAttribute("senerNickName",senerNickName);
		return "msg/msgWrite";
	}
	
}
