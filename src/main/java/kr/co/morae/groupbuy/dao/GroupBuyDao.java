package kr.co.morae.groupbuy.dao;

import kr.co.morae.groupbuy.dto.GroupBuyDto;

public interface GroupBuyDao {
	
	int gbRegister(GroupBuyDto dto);
	//지역 저장 dao
	int gbRegionRegister(GroupBuyDto dto);
	
	//file 저장 dao
	int gbSavePhoto(String gnNo, String photoName);
	

}
