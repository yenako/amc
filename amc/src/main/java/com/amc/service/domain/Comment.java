package com.amc.service.domain;

import java.util.List;

public class Comment {
	
	private int commentNo;
	private FreeBoard freeBoard;
	private User user;
	private String commentContent;
	private int parentCommentNo;
	private List<Comment> replyList;
	private String commentRegDate;


	public Comment(){
		super();
	}
	
	public String getCommentRegDate() {
		return commentRegDate;
	}

	public void setCommentRegDate(String commentRegDate) {
		this.commentRegDate = commentRegDate;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public FreeBoard getFreeBoard() {
		return freeBoard;
	}

	public void setFreeBoard(FreeBoard freeBoard) {
		this.freeBoard = freeBoard;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public int getParentCommentNo() {
		return parentCommentNo;
	}

	public void setParentCommentNo(int parentCommentNo) {
		this.parentCommentNo = parentCommentNo;
	}

	
	public List<Comment> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<Comment> replyList) {
		this.replyList = replyList;
	}

	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", freeBoard=" + freeBoard + ", user=" + user + ", commentContent="
				+ commentContent + ", parentCommentNo=" + parentCommentNo + ", replyList=" + replyList
				+ ", commentRegDate=" + commentRegDate + "]";
	}


	
	
}
