package kr.co.morae.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.morae.admin.dao.UserManagementDao;

@Service
public class UserManagementService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired UserManagementDao dao;
	
	
	public ArrayList<HashMap<String, Object>> userlist(String page) {
		int offset = (Integer.parseInt(page)-1)*10;
		logger.info("offset : "+offset);
		
		return dao.userlist(offset);
	}


	public String auth() {
		return dao.auth();
	}


	public int allnum() {
		
		return dao.allnum();
	}


	public ArrayList<HashMap<String, Object>> reserch(String userId) {
		return dao.reserch(userId);
	}


	public HashMap<String, Object> userdetail(String userid) {
		return dao.userdetail(userid);
	}


	
	
	
}
