package kr.co.morae.mypage.dao;

public interface PointDao {

	int checkUser(String userId, String name);

	int chargeGo(String userId, String name, String chargePrice);

	int myPoint(String userId);
}
