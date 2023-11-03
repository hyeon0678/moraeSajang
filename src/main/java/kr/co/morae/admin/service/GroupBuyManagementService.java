package kr.co.morae.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.morae.admin.dao.GroupBuyManagementDao;
import kr.co.morae.groupbuy.dto.GroupBuyDto;


@Service
public class GroupBuyManagementService {
@Autowired GroupBuyManagementDao dao;

public Map<String, Object> adminGroupBuyList(String page, String searchblock) {
	int offset = (Integer.parseInt(page)-1)*8;
	Map<String, Object> map = new HashMap<String, Object>();
	if(searchblock.equals("all")) {
		ArrayList<GroupBuyDto> adminGroupBuyList = dao.adminGroupBuyList(8,offset);		
		int pages = dao.adminGroupBuyListtotalPage(8);
		map.put("showPage",page);
		map.put("pages", pages);
		map.put("list", adminGroupBuyList);
	}else {
		ArrayList<GroupBuyDto> adminGroupBuyList = dao.adminGroupBuycheckList(searchblock,8,offset);		
		int pages = dao.adminGroupBucheckListtotalPage(8,searchblock);
		map.put("showPage",page);
		map.put("pages", pages);
		map.put("list", adminGroupBuyList);
	}
	
	
	
	return map;
}

public Map<String, Object> adminGroupBuySerUserList(String page, String searchblock, String seruser) {
	int offset = (Integer.parseInt(page)-1)*8;
	Map<String, Object> map = new HashMap<String, Object>();
	if(searchblock.equals("all")) {
		ArrayList<GroupBuyDto> adminGroupBuySerUserList = dao.adminGroupBuySerUserList(seruser,8,offset);		
		int pages = dao.adminGroupBuyListSerUsertotalPage(8,seruser);
		map.put("showPage",page);
		map.put("pages", pages);
		map.put("list", adminGroupBuySerUserList);
	}else {
		ArrayList<GroupBuyDto> adminGroupBuySerUserCheckList = dao.adminGroupBuySerUserCheckList(searchblock,seruser,8,offset);		
		int pages = dao.adminGroupBuySerUserCheckListtotalPage(8,searchblock,seruser);
		map.put("showPage",page);
		map.put("pages", pages);
		map.put("list", adminGroupBuySerUserCheckList);
	}
	return map;
}

public Map<String, Object> adminGroupBuyIntList(String page, String searchblock, String firstSearchDateValue,
		String lastSearchDateValue) {
	int offset = (Integer.parseInt(page)-1)*8;
	Map<String, Object> map = new HashMap<String, Object>();
	if(searchblock.equals("all")) {
		ArrayList<GroupBuyDto> adminGroupBuyIntList = dao.adminGroupBuyIntList(firstSearchDateValue,lastSearchDateValue,8,offset);		
		int pages = dao.adminGroupBuyListInttotalPage(8,firstSearchDateValue,lastSearchDateValue);
		map.put("showPage",page);
		map.put("pages", pages);
		map.put("list", adminGroupBuyIntList);
	}else {
		ArrayList<GroupBuyDto> adminGroupBuyIntList = dao.adminGroupBuycheckIntList(searchblock,firstSearchDateValue,lastSearchDateValue,8,offset);		
		int pages = dao.adminGroupBucheckIntListtotalPage(8,searchblock,firstSearchDateValue,lastSearchDateValue);
		map.put("showPage",page);
		map.put("pages", pages);
		map.put("list", adminGroupBuyIntList);
	}
	return map;

}

public Map<String, Object> adminGroupBuySerUserIntList(String page, String searchblock, String seruser,
		String firstSearchDateValue, String lastSearchDateValue) {
	int offset = (Integer.parseInt(page)-1)*8;
	Map<String, Object> map = new HashMap<String, Object>();
	if(searchblock.equals("all")) {
		ArrayList<GroupBuyDto> adminGroupBuySerUserIntList = dao.adminGroupBuySerUserIntList(seruser,firstSearchDateValue,lastSearchDateValue,8,offset);		
		int pages = dao.adminGroupBuyIntListSerUsertotalPage(8,seruser,firstSearchDateValue,lastSearchDateValue);
		map.put("showPage",page);
		map.put("pages", pages);
		map.put("list", adminGroupBuySerUserIntList);
	}else {
		ArrayList<GroupBuyDto> adminGroupBuySerUserCheckIntList = dao.adminGroupBuySerUserCheckIntList(searchblock,seruser,firstSearchDateValue,lastSearchDateValue,8,offset);		
		int pages = dao.adminGroupBuySerUserCheckIntListtotalPage(8,searchblock,seruser,firstSearchDateValue,lastSearchDateValue);
		map.put("showPage",page);
		map.put("pages", pages);
		map.put("list", adminGroupBuySerUserCheckIntList);
	}
	return map;
}
}
