package kr.co.morae.groupbuy.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.morae.groupbuy.dao.CommentDao;
import kr.co.morae.groupbuy.dto.CommentDto;

@Service
public class CommentService {
	Logger log = org.slf4j.LoggerFactory.getLogger(getClass());
	
	@Autowired
	CommentDao commDao;
	
	@Transactional
	public HashMap<String, Object> getCommentList(int gbNo, String userId, int pageNum){
		int offset = (pageNum-1)*5;
		ArrayList<CommentDto> commDto = commDao.getComment(gbNo, offset);
		commDto = setCommWriter(commDto, userId);
		log.info("commDtolength : "+commDto.size());
		int totalPage = getTotalPage(gbNo);
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("totalPage", Integer.toString(totalPage));
		map.put("comments", commDto);
		map.put("currPage", Integer.toString(pageNum));
		map.put("gbNo", Integer.toString(gbNo));
		return map;
	}
	
	public int getTotalPage(int gbNo) {
		int totalCommentCnt = commDao.getTotalComment(gbNo);
		log.info("totalCommentCnt : "+totalCommentCnt);
		int total = 0;
		if(totalCommentCnt%5==0) {
			return total = totalCommentCnt/5;
		}else {
			return total = (totalCommentCnt/5)+1;
		}
		 
	}
	
	public ArrayList<CommentDto> setCommWriter(ArrayList<CommentDto> commdto, String userId) {
		for(CommentDto dto : commdto) {
			if(dto.getUserId().equals(userId)) {
				dto.setCommentWriter(true);
			}
		}
		return commdto;
	}

	public String modyfyComment(HashMap<String, String> params) {
		if(commDao.modifyComment(params)>0) {
			return "댓글 수정을 수정하였습니다.";
		}else{
			return "댓글 수정에 실패했습니다.";
		}
	}

	public boolean writeComment(HashMap<String, String> map, String userId) {
		map.put("userId", userId);
		log.info("write comment"+map.toString());
		
		int row = commDao.writeComment(map);
		if(row>0) {
			return true;
		}
		
		return false;
	}
	
	
	

}
