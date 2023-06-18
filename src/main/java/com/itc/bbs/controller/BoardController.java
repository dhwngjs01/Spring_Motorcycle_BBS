package com.itc.bbs.controller;

import java.io.File;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itc.bbs.domain.BoardVO;
import com.itc.bbs.domain.FileVO;
import com.itc.bbs.service.BoardService;
import com.itc.bbs.service.FileService;

@Controller
public class BoardController {
	private static String PATH = "C:/Users/user/Documents/Server Programming Workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Spring_Motorcycle_BBS/resources/";

	@Autowired
	BoardService bService;
	
	@Autowired
	FileService fService;
	
	
	
	// boardNo 파라미터가 있어야 아래 메소드를 인지함
	@GetMapping("/board/view")
	public String readBoard(@RequestParam(value="boardNo", required=true) int boardNo, Model model) throws Exception {
		model.addAttribute("categoryList", bService.getCategoryList());
		model.addAttribute("board", bService.getBoard(boardNo));
		model.addAttribute("fileList", fService.getFileList(boardNo));
		model.addAttribute("boardCommentCount", bService.getBoardCommentCount(boardNo));
		model.addAttribute("commentList", bService.getCommentList(boardNo));
		
		return "board/view";
	}
	
	@GetMapping("/board/write")
	public String writeBoard(Model model, HttpSession session, RedirectAttributes redirect) throws Exception {
		// 로그인 상태 검증
		if(session.getAttribute("userNo") == null) {
			redirect.addFlashAttribute("NoHaveSession", true);
			return "redirect:/";
		}

		model.addAttribute("categoryList", bService.getCategoryList());
		
		return "board/write";
	}
	
	@ResponseBody
	@PostMapping("/board/write")
	public Object postWriteBoard(BoardVO bvo, FileVO fvo, MultipartHttpServletRequest files, HttpSession session, RedirectAttributes redirect) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();

		// 로그인 상태 검증
		if(session.getAttribute("userNo") == null) {
			map.put("NoHaveSession", true);
			return map;
		}
		
		// 현재 로그인 된 회원 번호 설정
		bvo.setUserNo((Integer) session.getAttribute("userNo"));
		
		// board 테이블 레코드 등록
		bService.addBoard(bvo);
		
		
		// 이미지 업로드 부분
		// boolean hasNext(), Object next(), void remove()
		Iterator<String> itr = files.getFileNames();
		
		// 파일이 선택한 상태로 글 작성 완료시
		if(itr.hasNext()) {
			List<MultipartFile> file = files.getFiles(itr.next());
			
			// 파일 확장자 화이트 리스트
			String[] allowedFileExt = { "image/jpeg", "image/png", "image/bmp" };
			
			// 현재 시간을 날짜로 만들어서 파일 이름을 수정
			Calendar calendar = Calendar.getInstance();
			Date now = calendar.getTime();
			String savedFileName = (new SimpleDateFormat("yyyyMMddHHmmss").format(now));
			
			for(int i = 0; i < file.size(); i++) {
				// 파일 MIME TYPE
				String fileMimeType = file.get(i).getContentType();
				
				// 파일이 유효한 확장자일 때
				if(Arrays.asList(allowedFileExt).contains(fileMimeType)) {	
					// 업로드 당시 파일 이름
					String originalFileName = file.get(i).getOriginalFilename();
					
					// 파일 용량
					long fileSize = (long) file.get(i).getSize();
					
					// 파일 확장자
					String fileExt = originalFileName.substring(originalFileName.lastIndexOf("."), originalFileName.length());
					
					// 수정된 파일 이름
					String savedFileFullName = savedFileName + "_" + i + fileExt;
					
					// 서버에 저장되는 이름 ex) 20190926234720_1 ~ N.png
					File image = new File(PATH + savedFileFullName);
					
					// 날짜 형식으로 이름을 변경하여 파일 저장
					file.get(i).transferTo(image);
					
					
					// 파일 테이블과 연결할 게시글 번호
					// 글쓰기 할 때 로그인 한 유저의 마지막 글이 지금 작성한 글이므로 현재 회원의 번호를 같이 넘긴다
					int boardNo = bService.getBoardNo((Integer) session.getAttribute("userNo"));
					fvo.setBoardNo(boardNo);
					fvo.setFileName(savedFileFullName);
					fvo.setFileRealName(originalFileName);
					fvo.setFileSize(fileSize);
					
					// file 테이블 레코드 등록
					fService.addFile(fvo);
				}
			}
			
			// 파일이 정상적으로 업로드 완료시
			map.put("WriteSuccess", true);
		} else {
			// 파일이 없는 상태로 글 작성 완료시
			map.put("NoHaveFiles", true);
		}
		
		return map;
	}
	
	
	@GetMapping("/board/modify")
	public String updateBoard(@RequestParam(value="boardNo", required=true) int boardNo, Model model, HttpSession session, RedirectAttributes redirect) throws Exception {
		// 로그인 상태 검증
		if(session.getAttribute("userNo") == null) {
			redirect.addFlashAttribute("NoHaveSession", true);
			return "redirect:/";
		}
		
		model.addAttribute("categoryList", bService.getCategoryList());
		model.addAttribute("board", bService.getBoard(boardNo));
		model.addAttribute("fileList", fService.getFileList(boardNo));
		
		return "board/modify";
	}
	
	@ResponseBody
	@PostMapping("/board/modify") 
	public Object postUpdateBoard(BoardVO bvo, FileVO fvo, MultipartHttpServletRequest files, Model model, HttpSession session, RedirectAttributes redirect) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 로그인 상태 검증
		if(session.getAttribute("userNo") == null){
			map.put("NoHaveSession", true);
			return map;
		}
		
		
		int userNo = (Integer) session.getAttribute("userNo"); // 세션 사용자 번호
		int boardNo = bvo.getBoardNo(); // 수정하려는 글 번호
		
		// 현재 계정이 작성한 글인지 검증
		int isCurrentUserWrite = bService.getCurrentUserWriteBoardNo(userNo, boardNo);
		
		// 현재 계정이 작성한 글이 맞을 때
		if(isCurrentUserWrite > 0) {
			// 이미지 업로드 부분
			// boolean hasNext(), Object next(), void remove()
			Iterator<String> itr = files.getFileNames();
			
			// 파일이 선택한 상태로 글 작성 완료시
			if(itr.hasNext()) {
				List<MultipartFile> file = files.getFiles(itr.next());
				
				// 파일 확장자 화이트 리스트
				String[] allowedFileExt = { "image/jpeg", "image/png", "image/bmp" };
				
				// 현재 시간을 날짜로 만들어서 파일 이름을 수정
				Calendar calendar = Calendar.getInstance();
				Date now = calendar.getTime();
				String savedFileName = (new SimpleDateFormat("yyyyMMddHHmmss").format(now));
				
				for(int i = 0; i < file.size(); i++) {
					// 파일 MIME TYPE
					String fileMimeType = file.get(i).getContentType();
					
					// 파일이 유효한 확장자일 때
					if(Arrays.asList(allowedFileExt).contains(fileMimeType)) {
						// 업로드 당시 파일 이름
						String originalFileName = file.get(i).getOriginalFilename();
						
						// 파일 용량
						long fileSize = (long) file.get(i).getSize();
						
						// 파일 확장자
						String fileExt = originalFileName.substring(originalFileName.lastIndexOf("."), originalFileName.length());
						
						// 수정된 파일 이름
						String savedFileFullName = savedFileName + "_" + i + fileExt;
						
						// 서버에 저장되는 이름 ex) 20190926234720_1 ~ N.png
						File image = new File(PATH + savedFileFullName);
						
						// 날짜 형식으로 이름을 변경하여 파일 저장
						file.get(i).transferTo(image);
						
						
						// 파일 테이블과 연결할 게시글 번호
						fvo.setBoardNo(boardNo);
						fvo.setFileName(savedFileFullName);
						fvo.setFileRealName(originalFileName);
						fvo.setFileSize(fileSize);
						
						// file 테이블 레코드 등록
						fService.addFile(fvo);
					}
				}
				
			}
			
			
			if(fvo.getRemoveFileList() != null) {
				fService.deleteBoardSelectionFile(fvo.getRemoveFileList());
			}
			
			// 글 내용 수정
			bService.modifyBoard(bvo);
			
			// 글 수정 완료 시
			map.put("ModifySuccess", true);
			return map;
		} else {
			// 글 작성자가 아닐 시
			map.put("NotBoardOwner", true);
			return map;
		}
	}
	
	@PostMapping("/board/delete")
	public @ResponseBody Object postDeleteBoard(@RequestParam(value="boardNo", required=false) int boardNo, HttpSession session) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 로그인 상태 검증
		if(session.getAttribute("userNo") == null) {
			map.put("NoHaveSession", true);
			return map;
		}
		
		// 로그인 한 계정이 쓴 글인지 유효성 검사
		int sessionUserNo = (Integer) session.getAttribute("userNo");
		String sessionUserLv = (String) session.getAttribute("userLv");
		
		int isCurrentUserWrite = bService.getCurrentUserWriteBoardNo(sessionUserNo, boardNo);
		
		if(isCurrentUserWrite > 0 || sessionUserLv.equals("admin")) {
			bService.deleteBoard(boardNo);
			fService.deleteAllFile(boardNo);
		} else {
			map.put("NotBoardOwner", true);
			return map;
		}
		
		return map;
	}
}
