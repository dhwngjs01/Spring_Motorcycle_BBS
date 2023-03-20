package com.itc.bbs.domain;

import java.util.List;

public class FileVO {
	private int fileNo;
	private int boardNo;
	private String fileName;
	private String fileRealName;
	private long fileSize;
	
	private List<String> removeFileList;
	
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileRealName() {
		return fileRealName;
	}
	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}	
	public List<String> getRemoveFileList() {
		return removeFileList;
	}
	public void setRemoveFileList(List<String> removeFileList) {
		this.removeFileList = removeFileList;
	}
	
}
