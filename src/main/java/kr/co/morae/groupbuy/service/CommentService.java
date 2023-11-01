package kr.co.morae.groupbuy.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.morae.groupbuy.dao.CommentDao;
import kr.co.morae.groupbuy.dto.CommentDto;

@Service
public class CommentService {
	Logger log = org.slf4j.LoggerFactory.getLogger(getClass());
	
	@Autowired
	CommentDao commDao;
	
	public ArrayList<CommentDto> getCommentList(int gbNo, String userId, int pageNum){
		int offset = (pageNum-1)*5;
		ArrayList<CommentDto> commDto = commDao.getComment(gbNo, offset);
		commDto = setCommWriter(commDto, userId);

		log.info("commDtolength : "+commDto.size());
		log.info("commentDto : " + commDto.get(1).getComment());
		
		return commDto;
	}
	
	public ArrayList<CommentDto> setCommWriter(ArrayList<CommentDto> commdto, String userId) {
		for(CommentDto dto : commdto) {
			if(dto.getUserId().equals(userId)) {
				dto.setCommentWriter(true);
			}
		}
		return commdto;
	}
	
	
	

}
