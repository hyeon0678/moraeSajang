package kr.co.morae.admin.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.co.morae.admin.service.PointManagementService;

@Controller
public class PointManagementController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired PointManagementService service;
	
	@RequestMapping(value="/admin/point/charge/desc")
	@ResponseBody
	public Map<String, Object> adminPointChargeDesc(@RequestParam String page) {
		return service.adminPointChargeDesc(page);
	}
	
	@RequestMapping(value="/admin/point/charge/asc")
	@ResponseBody
	public Map<String, Object>adminPointChargeAsc(@RequestParam String page){
		return service.adminPointChargeAsc(page);
	}
	
	 @RequestMapping(value = "/admin/point/charge/search/desc")
	 @ResponseBody
	 public Map<String, Object> adminPointChargeSearchDesc(
	            @RequestParam String page,
	            @RequestParam String firstSearchDateValue,
	            @RequestParam String lastSearchDateValue) {
	        logger.info("Received adminSearchChargePoint request. Page: " + page);
	        logger.info("First Search Date Value: " + firstSearchDateValue);
	        logger.info("Last Search Date Value: " + lastSearchDateValue);

	        return service.adminPointChargeSearchDesc(page, firstSearchDateValue, lastSearchDateValue);
	    }
	 	@RequestMapping(value = "/admin/point/charge/search/asc")
	    @ResponseBody
	    public Map<String, Object> adminPointChargeSearchAsc(
	            @RequestParam String page,
	            @RequestParam String firstSearchDateValue,
	            @RequestParam String lastSearchDateValue) {
	        logger.info("Received adminSearchChargePoint request. Page: " + page);
	        logger.info("First Search Date Value: " + firstSearchDateValue);
	        logger.info("Last Search Date Value: " + lastSearchDateValue);

	        return service.adminPointChargeSearchAsc(page, firstSearchDateValue, lastSearchDateValue);
	 	}

	 @RequestMapping(value = "/admin/point/History/desc")
	 @ResponseBody
	 public Map<String, Object> adminPointHistoryDesc(@RequestParam String page){
		 logger.info(page);
		 return service.adminPointHistoryDesc(page);
	 }
	 	
}
