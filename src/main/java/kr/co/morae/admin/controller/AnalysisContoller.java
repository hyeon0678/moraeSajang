package kr.co.morae.admin.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.morae.admin.service.AnalysisService;

@Controller
public class AnalysisContoller {
	@Autowired AnalysisService service;
	Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping(value="/admin/analysis")
	public String adminMain() {
		return"admin/adminMain";
	}
	
	// 도넛 차트 	
	@RequestMapping(value="/admin/analysis/Adress.ajax")
	@ResponseBody
	public Map<String, Object>adminanalysisAdress(@RequestParam String dfirstSearchDate,@RequestParam String dlastSearchDate){
		return service.adminanalysisAdress(dfirstSearchDate,dlastSearchDate);
	}
	
	// 카테고리 목록 그리기
	@RequestMapping(value="/admin/analysis/drawcategory.ajax")
	@ResponseBody
	public Map<String, Object>drawcategory(){
		return service.drawcategory();
	}
}
