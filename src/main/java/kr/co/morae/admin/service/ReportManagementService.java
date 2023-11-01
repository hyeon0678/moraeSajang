package kr.co.morae.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.morae.admin.dao.ReportManagementDao;
import kr.co.morae.admin.dto.ReportManagementDto;




@Service
public class ReportManagementService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ReportManagementDao dao;
	
	
	public ArrayList<ReportManagementDto> listall(String page) {
		int offset = (Integer.parseInt(page)-1)*10;
		return dao.listall(offset);
	}


	public int allnum() {
		return dao.allnum();
	}



	public ArrayList<ReportManagementDto> liststate(String pageState, String page) {
		int p = Integer.parseInt(page);	
		int offset = (p-1)*10;		
		return dao.liststate(pageState,offset);
	}


	public int statenum(String pageState) {
		return dao.statenum(pageState);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
