package kr.co.morae.groupbuy.dao;

import java.util.HashMap;

import kr.co.morae.groupbuy.dto.GroupBuyDto;

public interface GroupBuyDao {
	
	int gbRegister(GroupBuyDto dto);
	//���� ���� dao
	int gbRegionRegister(GroupBuyDto dto);
	
	//file ���� dao
	int gbSavePhoto(String gnNo, String photoName);
	

}
