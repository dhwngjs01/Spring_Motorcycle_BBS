package com.itc.bbs.service;

import java.util.List;

import com.itc.bbs.domain.BoardVO;
import com.itc.bbs.domain.CommentVO;
import com.itc.bbs.domain.SearchVO;

public interface BoardService {
	public int getBoardRowCount() throws Exception;
	public List<BoardVO> getBoardList(SearchVO svo) throws Exception;
	public List<String> getCategoryList() throws Exception;
	public int addBoard(BoardVO vo) throws Exception;
	public int modifyBoard(BoardVO vo) throws Exception;
	public BoardVO getBoard(int boardNo);
	public int getBoardNo(int userNo) throws Exception;
	public int getBoardCommentCount(int boardNo) throws Exception;
	public int getCurrentUserWriteBoardNo(int userNo, int boardNo) throws Exception;
	public int deleteBoard(int boardNo) throws Exception;
	
	// 댓글	
	public List<CommentVO> getCommentList(int boardNo) throws Exception;
	public int addComment(CommentVO vo) throws Exception;
	public int modifyComment(int commentNo, String commentContent) throws Exception;
	public int deleteComment(int commentNo) throws Exception;
	public int getCurrentUserWriteCommentNo(int userNo, int commentNo) throws Exception;
}