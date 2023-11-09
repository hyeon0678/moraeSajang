package kr.co.morae.user.dao;

import java.util.HashMap;

import kr.co.morae.user.dto.UserDto;

public interface UserDao {

	UserDto login(String id, String pw);

	String findId(HashMap<String, String> params);

	String findPw(HashMap<String, String> params);

	void correctPw(String foundId, String newPw);

}
