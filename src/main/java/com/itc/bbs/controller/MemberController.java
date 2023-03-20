package com.itc.bbs.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itc.bbs.domain.LoginVO;
import com.itc.bbs.domain.JoinVO;
import com.itc.bbs.service.LoginService;
import com.itc.bbs.service.BoardService;
import com.itc.bbs.service.JoinService;

@Controller
public class MemberController {
	@Autowired
	LoginService lService;

	@Autowired
	JoinService jService;
	
	@Autowired
	BoardService bService;

	@ResponseBody
	@PostMapping("/login")
	public Object login(LoginVO vo, HttpSession session) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		LoginVO lVo = lService.loginValidCheck(vo);

		if (lVo.getRowCount() > 0) {
			session.setAttribute("userNo", lVo.getUserNo());
			session.setAttribute("userId", lVo.getUserId());
			session.setAttribute("userName", lVo.getUserName());
			session.setAttribute("userLv", lVo.getUserLv());
		} else {
			map.put("loginValidCheck", false);
		}
		
		return map;
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		
		return "redirect:/";
	}

	@GetMapping("/join")
	public String join(Model model) throws Exception {
		model.addAttribute("categoryList", bService.getCategoryList());
		
		return "member/join";
	}

	@ResponseBody
	@PostMapping("/join")
	public Object postJoin(JoinVO vo) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// member 테이블에서 ID 중복 체크
		int overlapIdCheck = jService.overlapIdCheck(vo.getUserId());
		if (overlapIdCheck > 0) {
			map.put("overlapIdCheck", true);
			return map;
		}

		if (!vo.getUserPw().equals(vo.getUserPw2())) {
			map.put("validPwCheck", true);
			return map;
		}

		// member 테이블에 회원 정보 INSERT
		jService.addMember(vo);
		
		return true;
	}
}
