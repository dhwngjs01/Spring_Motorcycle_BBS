package com.itc.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itc.bbs.domain.BoardVO;
import com.itc.bbs.domain.CommentVO;
import com.itc.bbs.domain.SearchVO;
import com.itc.bbs.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDAO dao;

	@Override
	public int getBoardRowCount() throws Exception {
		return dao.getBoardRowCount();
	}
	
	@Override
	public List<BoardVO> getBoardList(SearchVO svo) throws Exception {
		return dao.getBoardList(svo);
	}
	
	@Override
	public List<String> getCategoryList() throws Exception {
		return dao.getCategoryList();
	}
	
	@Override
	public int addBoard(BoardVO vo) throws Exception {
		return dao.addBoard(vo);
	}
	
	@Override
	public int modifyBoard(BoardVO vo) throws Exception {
		return dao.modifyBoard(vo);
	}
	
	@Override
	public BoardVO getBoard(int boardNo) {
		// TODO Auto-generated method stub
		return dao.getBoard(boardNo);
	}
	
	@Override
	public int getBoardNo(int userNo) throws Exception {
		return dao.getBoardNo(userNo);
	}

	@Override
	public int getBoardCommentCount(int boardNo) throws Exception {
		return dao.getBoardCommentCount(boardNo);
	}
	
	@Override
	public int getCurrentUserWriteBoardNo(int userNo, int boardNo) throws Exception {
		return dao.getCurrentUserWriteBoardNo(userNo, boardNo);
	}
	
	@Override
	public int deleteBoard(int boardNo) throws Exception{
		return dao.deleteBoard(boardNo);
	}
	
	@Override
	public List<CommentVO> getCommentList(int boardNo) throws Exception{
		return dao.getCommentList(boardNo);
	}
	
	@Override
	public int addComment(CommentVO vo) throws Exception {
		return dao.addComment(vo);
	}
	
	@Override
	public int modifyComment(int commentNo, String commentContent) throws Exception {
		return dao.modifyComment(commentNo, commentContent);
	}
	
	@Override
	public int deleteComment(int commentNo) throws Exception {
		return dao.deleteComment(commentNo);
	}
	
	@Override
	public int getCurrentUserWriteCommentNo(int userNo, int commentNo) throws Exception {
		return dao.getCurrentUserWriteCommentNo(userNo, commentNo);
	}
}