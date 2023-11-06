package kr.co.morae.mypage.dao;

import java.util.ArrayList;
import java.util.Map;

import kr.co.morae.mypage.dto.MypageDto;

public interface MypageDao {

	ArrayList<MypageDto> myInfo(String userId);

	Map<String, Object> review(String userId);

	int totalPoint(String userId);

	int alarmSet(int alarmSetNo, String userId);

}
