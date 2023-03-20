package com.itc.bbs.domain;

import java.util.Date;

public class BoardVO {
	private int boardNo;
	private int userNo;
	private String boardCategory;
	private String boardTitle;
	private String boardContent;
	private String boardPrice;
	private String boardSellStatus;
	private Date boardWdate;
	
	private String userId;
	private String userName;
	private String userEmail;
	private String userLv;
	
	private String fileName;
	private String fileRealName;
	
	private int boardCommentCount;
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getBoardCategory() {
		return boardCategory;
	}
	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardPrice() {
		return boardPrice;
	}
	public void setBoardPrice(String boardPrice) {
		this.boardPrice = boardPrice;
	}
	public String getBoardSellStatus() {
		return boardSellStatus;
	}
	public void setBoardSellStatus(String boardSellStatus) {
		this.boardSellStatus = boardSellStatus;
	}
	public Date getBoardWdate() {
		return boardWdate;
	}
	public void setBoardWdate(Date boardWdate) {
		this.boardWdate = boardWdate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserLv() {
		return userLv;
	}
	public void setUserLv(String userLv) {
		this.userLv = userLv;
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
	public int getBoardCommentCount() {
		return boardCommentCount;
	}
	public void setBoardCommentCount(int boardCommentCount) {
		this.boardCommentCount = boardCommentCount;
	}
	
}
