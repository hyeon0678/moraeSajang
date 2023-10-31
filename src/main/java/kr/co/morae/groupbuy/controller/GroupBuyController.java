package kr.co.morae.groupbuy.controller;

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

import kr.co.morae.groupbuy.dto.GroupBuyDto;
import kr.co.morae.groupbuy.service.GroupBuyService;

@Controller
@RequestMapping("/groupBuy")
public class GroupBuyController {
	@Autowired
	GroupBuyService gbService;
	
	Logger log = org.slf4j.LoggerFactory.getLogger(getClass());
	
	@GetMapping("/gbWrite")
	public String gbWriteForm(HttpSession session) {
		return "groupBuy/gbWrite";
	}
	
	//
	@PostMapping("/gbWrite/register")
	public String writeGb(@RequestParam(value="images") MultipartFile[] files, @ModelAttribute GroupBuyDto dto, 
			Model model, HttpSession session) {
		log.info("files:"+files.length);
		log.info("params : "+dto.toString());
		boolean success = gbService.registerGB(files, dto);
		
		if(!success) {

			model.addAttribute("fail", "글 작성에 실패했습니다.");
			return "groupBuy/gbWrite";
		}
		
		return "redirect:/groupBuy/gbList";
	}
	
	@GetMapping("/gbList")
	public String gbList() {
		return "groupBuy/gbList";
	}
}
