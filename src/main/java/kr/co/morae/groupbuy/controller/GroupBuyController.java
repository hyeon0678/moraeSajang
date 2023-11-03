package kr.co.morae.groupbuy.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.morae.groupbuy.dto.GroupBuyDto;
import kr.co.morae.groupbuy.service.GroupBuyService;
import kr.co.morae.user.dto.UserDto;

@Controller
@RequestMapping("/groupBuy")
public class GroupBuyController {
	@Autowired
	GroupBuyService gbService;
	
	Logger log = org.slf4j.LoggerFactory.getLogger(getClass());
	
	@GetMapping("/gbWrite")
	public String gbWriteForm(HttpSession session) {
		log.info("session + "+session.getAttribute("userInfo"));
		UserDto dto = (UserDto) session.getAttribute("userInfo");
		log.info("userdto : " + dto);
		log.info(dto.toString());
		dto.getStreetAddress();
		return "groupBuy/gbWrite";
	}
	
	//
	@PostMapping("/gbWrite/register")
	public String writeGb(@RequestParam(value="images") MultipartFile[] files, 
			@ModelAttribute GroupBuyDto dto, Model model, HttpSession session, RedirectAttributes rattr) {
		log.info("files:"+files.length);
		log.info("params : "+dto.toString());
		boolean success = gbService.registerGB(files, dto);
		
		if(!success) {

			model.addAttribute("fail", "글 작성에 실패했습니다.");
			return "groupBuy/gbWrite";
		}
		
		rattr.addAttribute("success","공구가 등록되었습니다!");
		return "redirect:/groupBuy/gbList";
	}
	
	@GetMapping("/gbList")

	public String gbList(Model model) {

		return "groupBuy/gbList";
	}
	
	//글 상세정보보기
	@GetMapping("/gbDetail")
	public String gbDetail(@RequestParam int gbNo, HttpSession session, RedirectAttributes rattr, Model model) {
		log.info("parma : " + gbNo);
		UserDto info = (UserDto)session.getAttribute("userInfo");
		HashMap<String, Object> map = gbService.getGbDetail(gbNo, info.getUserId());
		
		if(map.get("GroupBuyDto") == null) {
			rattr.addFlashAttribute("fail", "공구 불러오기에 실패하였습니다.");
			return "redirect:/groupBuy/gbList";
		}
		
		model.addAllAttributes(map);
		return "groupBuy/gbDetail";
	}
	
	//공구 참여
	
	//공구 신고
}
