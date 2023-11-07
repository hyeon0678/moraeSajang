package kr.co.morae.admin.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.morae.admin.dao.AnalysisDao;
import kr.co.morae.admin.dto.CategoryAnalysisDto;
import kr.co.morae.admin.dto.RegionAnalysisDto;

@Service
public class AnalysisService {
@Autowired AnalysisDao dao;

public Map<String, Object> adminanalysisAdress(String dfirstSearchDate, String dlastSearchDate) {
    ArrayList<RegionAnalysisDto> chartAdress = dao.adminanalysisAdress(dfirstSearchDate,dlastSearchDate);
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("chartAdress", chartAdress);
    return map;
}

public Map<String, Object> drawcategory() {
	ArrayList<CategoryAnalysisDto> categorydraw = dao.categorydraw();
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("category", categorydraw);
	return map;
}
}
