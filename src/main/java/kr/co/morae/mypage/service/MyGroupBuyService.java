package kr.co.morae.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.morae.common.Paging;
import kr.co.morae.emuns.GbStateEnum;
import kr.co.morae.emuns.pointReasonEnum;
import kr.co.morae.groupbuy.dao.GroupBuyDao;
import kr.co.morae.groupbuy.dto.GbStateCheckDto;
import kr.co.morae.groupbuy.dto.GroupBuyDto;
import kr.co.morae.mypage.dao.MyGroupBuyDao;

@Service
public class MyGroupBuyService {
	Logger log = org.slf4j.LoggerFactory.getLogger(getClass());
	Paging paging = new Paging();

	private MyGroupBuyDao myGbDao;
	private GroupBuyDao gbDao;
	
	public MyGroupBuyService(MyGroupBuyDao myGbDao, GroupBuyDao gbDao) {
		this.myGbDao = myGbDao;
		this.gbDao = gbDao;
	}
	
	public HashMap<String, Object> getMyGbList(String userId, String listType, int page) {
		HashMap<String, Object> result = new HashMap<>();
		int offset = (page-1)*10;
		log.info(Integer.toString(offset));
		
		ArrayList<GroupBuyDto> myGbList = (ArrayList<GroupBuyDto>) myGbDao.getMyGbList(userId, listType, offset);
		log.info(Integer.toString(myGbList.size()));
		
		int totalCnt = myGbDao.getMyGbListCnt(userId, listType);
		int totalPage = paging.getTotalPage(totalCnt, 10);
		log.info(myGbList.toString());
		
		result.put("myGbList", myGbList);
		result.put("listType", listType);
		result.put("totalPage", totalPage);
		result.put("currPage", page);
		
		return result;
		
	}
	
	public boolean gbComplete(String userId, int gbNo) {
		
		int row = myGbDao.setComplete(gbNo, userId);
		log.info("success complete");
		if(row>0) {
			stateCheck(gbNo);
			return true;
		}
		return false;
	}
	
	public void stateCheck(int gbNo) {
		GbStateCheckDto checkDto = myGbDao.checkComplete(gbNo);
		log.info("success stateCheck");
		
		if(checkDto.getRecruitPeople() == checkDto.getJoinNum()) {
			gbDao.modifyGbState(gbNo, GbStateEnum.COMPLETE.getState());
			gbDao.insertGbStateHistory(gbNo, GbStateEnum.COMPLETE.getState());
			int totalPrice = checkDto.getJoinNum()*checkDto.getJoinPrice();
			gbDao.insertPoint(gbNo, checkDto.getUserId(), totalPrice, pointReasonEnum.CALCULATE.getState());
			log.info("success modifyState");
		}
	}
	

}
