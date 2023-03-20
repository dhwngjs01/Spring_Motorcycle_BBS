package com.itc.bbs.domain;

import java.util.Date;

public class CommentVO {	
	private int commentNo;
	private int boardNo;
	private int userNo;
	private String commentContent;
	private Date commentWdate;
	private int rowCount;
	
	private String userName;
	
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	
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
	
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	
	public Date getCommentWdate() {
		return commentWdate;
	}
	public void setCommentWdate(Date commentWdate) {
		this.commentWdate = commentWdate;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getRowCount() {
		return rowCount;
	}
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}
	
	
	
}
