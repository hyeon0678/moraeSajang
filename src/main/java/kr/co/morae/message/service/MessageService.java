package kr.co.morae.message.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.morae.message.dao.MessageDao;
import kr.co.morae.message.dto.MessageDto;

@Service
public class MessageService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MessageDao dao;

	public int nameCheck(String nickName, String userId) {
		int check = 0;
		String identification = dao.nameCheck(nickName);
		if(userId.equals(identification)) {
			check = 1;
		}else if(identification == null) {
			check = 2;
		}else{
			check = 3;
		}
		return check;
	}

	public int msgSend(String content, String userId, String nickName) {
		int row = 0;
		String rcvId = dao.nickNameId(nickName);
		logger.info("받는 아이디 : "+rcvId+" / 보내는 아이디 : "+userId);
		if(!rcvId.equals(userId)) {
			row = dao.msgSend(content, userId, rcvId);
		}
		return row;
	}

	public HashMap<String, Object> list(String userId, String page) {
		int p = Integer.parseInt(page);
		int offset = p*5;
		ArrayList<MessageDto> list = dao.list(userId, offset);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int pages = dao.totalPage();
		logger.info("만들 수 있는 총 페이지 수 : "+pages);
		map.put("pages", pages);
		map.put("list", list);
		return map;
	}
}
