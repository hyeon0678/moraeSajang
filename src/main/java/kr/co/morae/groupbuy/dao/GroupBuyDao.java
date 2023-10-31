package kr.co.morae.groupbuy.dao;

import java.util.HashMap;

import kr.co.morae.groupbuy.dto.GroupBuyDto;

public interface GroupBuyDao {
	
	int gbRegister(GroupBuyDto dto);
	//지역 저장 dao
	int gbRegionRegister(GroupBuyDto dto);
	
	//file 저장
	int gbSavePhoto(String gnNo, String photoName);
	

}
