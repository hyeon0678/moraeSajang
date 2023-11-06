package kr.co.morae.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.morae.user.dto.UserDto;

public interface UserManagementDao {

	ArrayList<HashMap<String, Object>> userlist(int offset);

	String auth();

	int allnum();

	ArrayList<HashMap<String, Object>> reserch(String userId);

	HashMap<String, Object> userdetail(String userid);

}
