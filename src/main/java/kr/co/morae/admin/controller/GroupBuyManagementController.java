package kr.co.morae.admin.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.morae.admin.service.GroupBuyManagementService;

@Controller
public class GroupBuyManagementController {
@Autowired GroupBuyManagementService service;
Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping(value="/admin/groupBuy")
	public String adminBoard() {
		return "admin/adminBoard";
	}

	@RequestMapping(value="/admin/groupBuy/list")
	@ResponseBody
	public Map<String, Object>adminGroupBuyList(
			@RequestParam String page,@RequestParam String searchblock
			){
		logger.info(page);
		logger.info(searchblock);
		return service.adminGroupBuyList(page,searchblock);
	}
	@RequestMapping(value="/admin/groupBuy/ser/user/list")
	@ResponseBody
	public Map<String, Object>adminGroupBuySerUserList(
			@RequestParam String page, @RequestParam String searchblock, @RequestParam String seruser){
		logger.info("확인:"+service.adminGroupBuySerUserList(page,searchblock,seruser));
		return service.adminGroupBuySerUserList(page,searchblock,seruser);
	}
	
	@RequestMapping(value="/admin/groupBuy/int/list")
	@ResponseBody
	public Map<String, Object>adminGroupBuyIntList(
			@RequestParam String page, @RequestParam String searchblock,@RequestParam String firstSearchDateValue, @RequestParam String lastSearchDateValue
			){
		return service.adminGroupBuyIntList(page,searchblock,firstSearchDateValue, lastSearchDateValue);
	}
	@RequestMapping(value="/admin/groupBuy/ser/user/int/list")
	@ResponseBody
	public Map<String, Object>adminGroupBuySerUserIntList(
			@RequestParam String page, @RequestParam String searchblock,@RequestParam String seruser,
			@RequestParam String firstSearchDateValue, @RequestParam String lastSearchDateValue
			){
		return service.adminGroupBuySerUserIntList(page,searchblock,seruser,firstSearchDateValue, lastSearchDateValue);
	}

	
}
