package kr.co.morae.groupbuy.dao;

import java.util.ArrayList;

import kr.co.morae.groupbuy.dto.CommentDto;

public interface CommentDao {
	ArrayList<CommentDto> getComment(int gbNo, int offset);

}
