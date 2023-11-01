package kr.co.morae.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.morae.admin.dto.ReportManagementDto;
import kr.co.morae.admin.service.ReportManagementService;





@Controller
public class ReportManagementController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ReportManagementService service;
	
	@RequestMapping(value = "/")
	public String adminReport(Model model) {
		
		return "/admin/adminReport";
	}
	
	 
	@RequestMapping(value = "/reportMgmt.ajax/list")
	@ResponseBody
	public HashMap<String,Object> reportMgmt(Model model,@RequestParam String pageState,@RequestParam String page) {
		logger.info("회원 리스트 호출");
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		logger.info("page상태 : "+pageState);
		logger.info("page넘버 : "+page);
		// logger.info("page넘버 : "+pages);
		
		if (pageState.equals("전체")) {
			logger.info("회원 리스트 호출/all");
			ArrayList<ReportManagementDto> list = service.listall(page);
			logger.info("num"+list.toString());
			int allnum = service.allnum()+1;
			result.put("currpage",page);
			result.put("pages",allnum);
			result.put("list", list);
			result.put("size", list.size());
			logger.info("result : " +result);			
			
		}else {
			logger.info("회원 리스트 호출liststate");
			
			ArrayList<ReportManagementDto> list = service.liststate(pageState,page);
			int statenum = service.statenum(pageState)+1;
			logger.info("statenum : "+statenum);
			result.put("currpage",page);
			result.put("pages",statenum);
			result.put("list", list);
			result.put("size", list.size());
			logger.info("result : " +result);
		}
		
		
		
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
