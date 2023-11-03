package kr.co.morae.mypage.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.morae.mypage.dao.PointDao;

@Service
public class PointService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired PointDao dao;

	public int chargeGo(String userId, String name, String chargePrice) {
		int row = 0;
		int checkNum = dao.checkUser(userId, name);
		if(checkNum>0) {
			row = dao.chargeGo(userId, name, chargePrice);
		}
		return row;
	}

	public int myPoint(String userId) {
		return dao.myPoint(userId);
	}


	
}
