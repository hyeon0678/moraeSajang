package kr.co.morae.common;

import kr.co.morae.groupbuy.dto.SearchOptionDto;

public class Paging {

	public int getTotalPage(int totalCnt, int showPagingNum) {
		int total = 0;
		if(totalCnt%showPagingNum==0) {
			return total = totalCnt/showPagingNum;
		}else {
			return total = (totalCnt/showPagingNum)+1;
		}
		 
	}
	
}
