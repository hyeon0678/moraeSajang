package kr.co.morae.groupbuy.controller;

import java.util.HashMap;
import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.morae.groupbuy.dto.GroupBuyDto;
import kr.co.morae.groupbuy.dto.ReportDto;
import kr.co.morae.groupbuy.dto.SearchOptionDto;
import kr.co.morae.groupbuy.service.GroupBuyService;
import kr.co.morae.user.dto.UserDto;

@Controller
@RequestMapping("/groupBuy")
public class GroupBuyController {
	@Autowired
	GroupBuyService gbService;
	
	Logger log = org.slf4j.LoggerFactory.getLogger(getClass());
	
	@GetMapping("/gbWrite")
	public String gbWriteForm(HttpSession session, RedirectAttributes rattr) {
		log.info("session + "+session.getAttribute("userInfo"));
		UserDto info = (UserDto) session.getAttribute("userInfo");
		
		if(info== null) {
			rattr.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			return "redirect:/";
		}
		
		
		log.info("userdto : " + info);
		log.info(info.toString());
		info.getStreetAddress();
		return "groupBuy/gbWrite";
	}
	
	//공구 글 작성
	@PostMapping("/gbWrite/register.ajax")
	@ResponseBody
	public HashMap<String,Object> writeGb(@RequestParam(value="images") MultipartFile[] files, 
			@ModelAttribute GroupBuyDto dto, Model model, HttpSession session) {
		log.info("files:"+files.length);
		log.info("params : "+dto.toString());
		UserDto info = (UserDto)session.getAttribute("userInfo");
		

		int success = gbService.registerGB(files, dto);
		HashMap<String, Object> result = new HashMap<String, Object>();
		if(success>0) {
			result.put("gbNo", success);
			result.put("success", "공구 등록에 성공했습니다.");
			return result;
		}
		
		result.put("fail", "공구 등록에 실패했습니다.");		
		return result;
	}
	

	
	//글 상세정보보기
	@GetMapping("/gbDetail")
	public String gbDetail(@RequestParam int gbNo, HttpSession session, RedirectAttributes rattr, Model model) {
		log.info("------------gbDetail----------------");
		log.info("parma : " + gbNo);
		UserDto info = (UserDto)session.getAttribute("userInfo");
		
		if(info== null) {
			rattr.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			return "redirect:/";
		}
		
		HashMap<String, Object> map = gbService.getGbDetail(gbNo, info.getUserId());
		
		if(map.get("GroupBuyDto") == null) {
			rattr.addFlashAttribute("fail", "공구 불러오기에 실패하였습니다.");
			return "redirect:/groupBuy/gbList";
		}
		
		log.info("공구 글 불러오기 완료");
		model.addAllAttributes(map);
		log.info("------------end----------------");
		return "groupBuy/gbDetail";
	}
	
	//공구 참여
	@PostMapping("/join.ajax")
	public HashMap<String,Object> gbJoin(@RequestParam int gbNo, @RequestParam int gbPrice, HttpSession session) {
		log.info("------------gbJoin----------------");
		log.info("params : "+"gbNo:"+gbNo+"gbPrice:"+gbPrice);
		UserDto info = (UserDto)session.getAttribute("userInfo");
		boolean isJoin = gbService.gbJoin(gbNo, info.getUserId(), gbPrice);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		if(isJoin) {
			log.info("공동구매 참여 완료");
			result.put("msg", "공구 참여 완료");
			return result;
		}
		log.info("공동구매 참여 실패");
		result.put("msg", "공동 참여 실패");
		log.info("------------end----------------");
		return result;
	}
	
	//공구 신고
	@GetMapping("/report")
	public String reportForm(@RequestParam HashMap<String, String> params, Model model) {
		log.info("----------report------------");
		log.info("params : " + params.toString());
		model.addAttribute("param", params);
		return "groupBuy/report";
	}
	
	@PostMapping("/report")
	public String report(@RequestParam HashMap<String,String>params, Model model, RedirectAttributes rattr, HttpSession session) {
		
		UserDto info = (UserDto)session.getAttribute("userInfo");
		
		if(info== null) {
			rattr.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			return "redirect:/";
		}
		
		log.info("params : " + params.toString());
		int row = gbService.report(params, info.getUserId());

		
		if(row>0) {
			rattr.addAttribute("msg", "신고가 접수되었습니다.");
		}else {
			rattr.addAttribute("msg", "신고가 접수에 실패하였습니다.");			
		}
		log.info("----------end------------");
		return "redirect:/groupBuy/gbDetail?gbNo="+params.get("gbNo");
	}
	
	//공구 리스트
	@GetMapping("/gbList.ajax")
	@ResponseBody
	public HashMap<String,Object> gbList(@ModelAttribute SearchOptionDto dto) {
		log.info("------------gbList+search----------------");
		log.info("params : "+dto.toString());
		HashMap<String, Object> result = gbService.getGbList(dto);
		log.info("------------end----------------");
		return result;
	}
	
	@GetMapping("/gbList")
	public String gbList() {
		log.info("forword gbListForm");
		return "groupBuy/gbList";
	}
	
}
