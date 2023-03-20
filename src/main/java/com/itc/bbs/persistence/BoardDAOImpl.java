package com.itc.bbs.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itc.bbs.domain.BoardVO;
import com.itc.bbs.domain.CommentVO;
import com.itc.bbs.domain.SearchVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private SqlSession sql;
	
	private static String namespace = "bbs.mapper.boardMapper";

	@Override
	public int getBoardRowCount() throws Exception {
		return sql.selectOne(namespace+".getBoardRowCount");
	}
	
	@Override
	public List<BoardVO> getBoardList(SearchVO svo) throws Exception {
		return sql.selectList(namespace+".getBoardList", svo);
	}
	
	@Override
	public List<String> getCategoryList() throws Exception {
		return sql.selectList(namespace+".getCategoryList");
	}
	
	@Override
	public int addBoard(BoardVO vo) throws Exception {
		return sql.insert(namespace+".addBoard", vo);
	}
	
	@Override
	public int modifyBoard(BoardVO vo) throws Exception {
		return sql.update(namespace+".modifyBoard", vo);		
	}
	
	@Override
	public BoardVO getBoard(int boardNo) {		
		return sql.selectOne(namespace+".getBoard", boardNo);
	}

	@Override
	public int getBoardNo(int userNo) throws Exception {
		return sql.selectOne(namespace+".getBoardNo", userNo);
	}
	
	@Override
	public int getBoardCommentCount(int boardNo) throws Exception {
		return sql.selectOne(namespace+".getBoardCommentCount", boardNo);
	}
	
	@Override
	public int getCurrentUserWriteBoardNo(int userNo, int boardNo) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("userNo", userNo);
		map.put("boardNo", boardNo);
		
		return sql.selectOne(namespace+".getCurrentUserWriteBoardNo", map);
	}

	@Override
	public int deleteBoard(int boardNo) throws Exception {
		return sql.delete(namespace+".deleteBoard", boardNo);
	}
	
	@Override
	public List<CommentVO> getCommentList(int boardNo) throws Exception {
		return sql.selectList(namespace+".getCommentList", boardNo);
	}
	
	@Override
	public int addComment(CommentVO vo) throws Exception {
		return sql.insert(namespace+".addComment", vo);
	}
	
	@Override
	public int modifyComment(int commentNo, String commentContent) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("commentNo", commentNo);
		map.put("commentContent", commentContent);
		
		return sql.update(namespace+".modifyComment", map);
	}
	
	@Override
	public int deleteComment(int commentNo) throws Exception {
		return sql.delete(namespace + ".deleteComment", commentNo);
	}
	
	@Override
	public int getCurrentUserWriteCommentNo(int userNo, int commentNo) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("userNo", userNo);
		map.put("commentNo", commentNo);
		
		return sql.selectOne(namespace+".getCurrentUserWriteCommentNo", map);
	}
}