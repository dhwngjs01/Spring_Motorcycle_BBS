package com.itc.bbs.domain;

public class SearchVO {
	private String searchKey;
	private String boardCategory;
	
	private int startBoardNo;
	private int limit = 5;
	
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey.trim();
	}
	public String getBoardCategory() {
		return boardCategory;
	}
	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory.trim();
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getStartBoardNo() {
		return startBoardNo;
	}
	public void setStartBoardNo(int startBoardNo) {
		this.startBoardNo = startBoardNo;
	}
	
	
}
