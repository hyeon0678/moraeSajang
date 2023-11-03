package kr.co.morae.groupbuy.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.morae.groupbuy.dao.CommentDao;
import kr.co.morae.groupbuy.dto.CommentDto;
import kr.co.morae.groupbuy.service.CommentService;
import kr.co.morae.user.dto.UserDto;

@Controller
@RequestMapping("/groupBuy/comment")
public class CommentController {
	Logger log = org.slf4j.LoggerFactory.getLogger(getClass());
	
	@Autowired
	CommentService commService;//
	@Autowired
	CommentDao commDao;
	
	@GetMapping("/commList.ajax")
	@ResponseBody
	public HashMap<String,Object>getCommList(@RequestParam int gbNo,@RequestParam int pageNum, HttpSession session) {
		log.info("----------- comment list --------------");
		
		log.info("params > gbNo:"+gbNo+" pageNum:"+pageNum);
		UserDto info = (UserDto)session.getAttribute("userInfo");
		HashMap<String,Object> map = new HashMap<String, Object>();
		map = commService.getCommentList(gbNo, info.getUserId(), pageNum);
		
		log.info("----------- end --------------");
		return map;
	}
	
	//댓글 삭제
	@GetMapping("/delete.ajax")
	@ResponseBody
	public HashMap<String,Object> deleteComment(@RequestParam HashMap<String, String> params){
		log.info("----------- comment delete --------------");
		
		log.info("commentDelete data : "+params.toString());
		int row = commDao.deleteComment(params);
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		if(row>0) {
			result.put("msg", "success");
			return result;
		}
		
		result.put("msg", "fail");
		
		log.info("----------- end --------------");
		return result;
	}
	
	//댓글 수정
	@PostMapping("/modify.ajax")
	@ResponseBody
	public HashMap<String,Object> modifyComment(@RequestParam HashMap<String, String> params){
		log.info("----------- comment modify --------------");
		
		log.info("commentModify data : "+params.toString());
		String resultMsg = commService.modyfyComment(params);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("msg", resultMsg);
		
		log.info("----------- end --------------");
		return result;
	}
	
	
	//댓글 작성
	@PostMapping("/register.ajax")
	@ResponseBody
	public HashMap<String,Object> writeComment(@RequestParam HashMap<String, String> map, HttpSession session, RedirectAttributes rattr) {
		UserDto info = (UserDto)session.getAttribute("userInfo");
		log.info("----------- comment write --------------");
		
		log.info("write comment"+map.toString());
		boolean success = commService.writeComment(map, info.getUserId());
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		String page = map.get("gbNo");
		log.info("totalPage : "+page);
		if(success) {
			long lastPageNum = commService.getTotalPage(Integer.parseInt(page));
			result.put("pageNum", lastPageNum);
			result.put("msg", "success");
			return result;
		}
		
		result.put("msg", "fail");
		
		log.info("----------- end --------------");
		return result;
	}

}
