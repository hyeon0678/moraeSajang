package kr.co.morae.groupbuy.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import kr.co.morae.groupbuy.dto.CommentDto;
import kr.co.morae.groupbuy.dto.GroupBuyDto;

public interface GroupBuyDao {
	
	int gbRegister(GroupBuyDto dto);
	//지역 저장 dao
	int gbRegionRegister(GroupBuyDto dto);
	
	//file 저장 dao
	int gbSavePhoto(String gnNo, String photoName);
	
	GroupBuyDto getGbDetail(int gbNo);
	
	ArrayList<String> getPhotoNames(int gbNo);
	

}
