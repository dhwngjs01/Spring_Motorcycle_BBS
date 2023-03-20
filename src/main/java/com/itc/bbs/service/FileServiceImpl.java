package com.itc.bbs.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itc.bbs.domain.FileVO;
import com.itc.bbs.persistence.FileDAO;


@Service
public class FileServiceImpl implements FileService {
	
	@Autowired
	FileDAO dao;
	
	@Override
	public int addFile(FileVO vo) throws Exception {
		return dao.addFile(vo);
	}
	
	@Override
	public List<FileVO> getFileList(int boardNo) throws Exception {
		return dao.getFileList(boardNo);
	}

	@Override
	public int deleteAllFile(int boardNo) throws Exception {
		return dao.deleteAllFile(boardNo);
	}
	
	@Override
	public void deleteBoardSelectionFile(List<String> removeFileList) throws Exception {
		dao.deleteBoardSelectionFile(removeFileList);
	}

}
