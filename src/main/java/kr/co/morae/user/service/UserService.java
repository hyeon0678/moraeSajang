package kr.co.morae.user.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.morae.user.dao.UserDao;
import kr.co.morae.user.dto.UserDto;

@Service
public class UserService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired UserDao dao;

	public UserDto login(String id, String pw) {
		return dao.login(id, pw);
	}

	public String findId(HashMap<String, String> params) {
		return dao.findId(params);
	}
	
	
}
