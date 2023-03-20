package com.itc.bbs.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itc.bbs.domain.CommentVO;
import com.itc.bbs.service.BoardService;

@Controller
public class CommentController {
	@Autowired
	BoardService bService;
	
	@PostMapping("/board/comment")
	public @ResponseBody Object getCommentList(@RequestParam(value="boardNo", required=true) int boardNo) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("boardCommentCount", bService.getBoardCommentCount(boardNo));
		map.put("commentList",  bService.getCommentList(boardNo));
		
		return map;
	}
	
	@PostMapping("/board/comment/write")
	public @ResponseBody Object writeComment(CommentVO vo, Model model, HttpSession session) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(session.getAttribute("userNo") == null) {
			map.put("NoHaveSession", true);
			return map;
		}
		
		int userNo = (int) session.getAttribute("userNo");
		vo.setUserNo(userNo);
	
		if(bService.addComment(vo) < 1) {
			map.put("UnknownError", true);
			return map;
		}
		
		return map;
	}
	
	@PostMapping("/board/comment/modify")
	public @ResponseBody Object modifyComment(@RequestParam(value="commentNo", required=true) int commentNo, @RequestParam(value="commentContent", required=true) String commentContent, Model model, HttpSession session) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(session.getAttribute("userNo") == null) {
			map.put("NoHaveSession", true);
			return map;
		}
		
		// 로그인 한 계정이 쓴 댓글인지 유효성 검사
		int sessionUserNo = (int) session.getAttribute("userNo");
		int isCurrentUserWrite = bService.getCurrentUserWriteCommentNo(sessionUserNo, commentNo);
		
		if(isCurrentUserWrite > 0) {
			bService.modifyComment(commentNo, commentContent);
		} else {
			map.put("NotCommentOwner", true);
			return map;
		}
		
		return map;
	}
	
	@PostMapping("/board/comment/delete")
	public @ResponseBody Object deleteComment(@RequestParam(value="commentNo", required=true) int commentNo, Model model, HttpSession session) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(session.getAttribute("userNo") == null) {
			map.put("NoHaveSession", true);
			return map;
		}
		
		// 로그인 한 계정이 쓴 댓글인지 유효성 검사
		int sessionUserNo = (int) session.getAttribute("userNo");
		String sessionUserLv = (String) session.getAttribute("userLv");
		
		int isCurrentUserWrite = bService.getCurrentUserWriteCommentNo(sessionUserNo, commentNo);
		
		if(isCurrentUserWrite > 0 || sessionUserLv.equals("admin")) {
			bService.deleteComment(commentNo);
		} else {
			map.put("NotCommentOwner", true);
			return map;
		}
		
		return map;
	}	
}