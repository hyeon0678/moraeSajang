package kr.co.morae.message.dao;

import java.util.ArrayList;

import kr.co.morae.message.dto.MessageDto;

public interface MessageDao {

	String nameCheck(String nickName);

	String nickNameId(String nickName);

	int msgSend(String content, String userId, String rcvId);

	ArrayList<MessageDto> rcvList(String userId, int offset);

	int rcvPages(String userId);

	ArrayList<MessageDto> sendList(String userId, int offset);

	int sendPages(String userId);

	MessageDto msgDetail(String messagesNo);

	void msgRead(String messagesNo);
}
