package com.itc.bbs.persistence;


import java.util.List;

import com.itc.bbs.domain.FileVO;

public interface FileDAO {
	public int addFile(FileVO vo) throws Exception;
	public List<FileVO> getFileList(int boardNo) throws Exception;
	public int deleteAllFile(int boardNo) throws Exception;
	public void deleteBoardSelectionFile(List<String> removeFileList) throws Exception;
}
