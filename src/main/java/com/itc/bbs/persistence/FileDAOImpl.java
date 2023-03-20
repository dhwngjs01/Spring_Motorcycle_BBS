package com.itc.bbs.persistence;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itc.bbs.domain.FileVO;

@Repository
public class FileDAOImpl implements FileDAO {
	@Autowired
	private SqlSession sql;
	
	private static String namespace = "bbs.mapper.fileMapper";
	
	@Override
	public int addFile(FileVO vo) throws Exception {
		return sql.insert(namespace+".addFile", vo);
	}
	
	@Override
	public List<FileVO> getFileList(int boardNo) {
		return sql.selectList(namespace+".getFileList", boardNo);
	}
	
	@Override
	public int deleteAllFile(int boardNo) {
		return sql.delete(namespace+".deleteAllFile", boardNo);
	}
	
	@Override
	public void deleteBoardSelectionFile(List<String> removeFileList) throws Exception {
		for(String fileNo : removeFileList) {
			sql.delete(namespace+".deleteBoardSelectionFile", fileNo);
		}
	}
}
