package kr.co.morae.mypage.dao;

import java.util.List;

import kr.co.morae.groupbuy.dto.GbStateCheckDto;
import kr.co.morae.groupbuy.dto.GroupBuyDto;

public interface MyGroupBuyDao {
	List<GroupBuyDto> getMyGbList(String userId, String listType, int offset);
	
	int getMyGbListCnt(String userId, String listType);
	
	GbStateCheckDto checkComplete(int gbNo);
	
	int setComplete(int gbNo, String userId);

	int ratin(String gbNo, String reviewerId, String ratings);
}
