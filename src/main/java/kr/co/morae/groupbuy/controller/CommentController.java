package kr.co.morae.groupbuy.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.morae.groupbuy.dto.CommentDto;
import kr.co.morae.groupbuy.service.CommentService;
import kr.co.morae.user.dto.UserDto;

@Controller
@RequestMapping("/groupBuy/comment")
public class CommentController {
	Logger log = org.slf4j.LoggerFactory.getLogger(getClass());
	
	@Autowired
	CommentService commService;
	
	@GetMapping("/commList.ajax")
	public HashMap<String,Object>getCommList(int gbNo, int pageNum, HttpSession session) {
		UserDto info = (UserDto)session.getAttribute("userInfo");
		HashMap<String,Object> map = new HashMap<String, Object>();
		List<CommentDto> dto = commService.getCommentList(gbNo, info.getUserId(), pageNum);
		map.put("comments", dto);
		return map;
	}
	
	//
	public HashMap<String,Object> deleteComment(int gbNo, int pageNum){
		
		return null;
	}
	
	public HashMap<String,Object> modifyComment(int gbNo, int pageNum){
		return null;
	}
	
	public String reportCommnt(){
		return null;
	}

}
