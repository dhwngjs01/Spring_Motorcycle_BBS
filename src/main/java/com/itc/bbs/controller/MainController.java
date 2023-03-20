package com.itc.bbs.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itc.bbs.domain.SearchVO;
import com.itc.bbs.service.BoardService;

@Controller
public class MainController {
	
	@Autowired
	BoardService bService;
	
	@GetMapping("/")
	public String main(SearchVO svo, Model model) throws Exception {
		model.addAttribute("categoryList", bService.getCategoryList());
		model.addAttribute("boardList", bService.getBoardList(svo));
		model.addAttribute("boardRowCount", bService.getBoardRowCount());
		model.addAttribute("search", svo);
		
		return "main";
	}
	
	@ResponseBody
	@PostMapping("/getBoardList")
	public Object mainBoardList(SearchVO svo) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("boardList", bService.getBoardList(svo));
		
		return map;
	}
}