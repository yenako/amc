package com.amc.service.domain;

public class FreeBoard {

	private int freeBoardNo;
	private User user;
	// private String userId;
	private String freeBoardTitle;
	private String freeBoardRegDate;
	private String freeBoardContent;
	private int freeBoardViews;
	private String freeBoardImage;
	private String noticeFlag;
	private Comment comment;

	public FreeBoard() {
		super();
	}

	public int getFreeBoardNo() {
		return freeBoardNo;
	}

	public void setFreeBoardNo(int freeBoardNo) {
		this.freeBoardNo = freeBoardNo;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getFreeBoardTitle() {
		return freeBoardTitle;
	}

	public void setFreeBoardTitle(String freeBoardTitle) {
		this.freeBoardTitle = freeBoardTitle;
	}

	public String getFreeBoardRegDate() {
		return freeBoardRegDate;
	}

	public void setFreeBoardRegDate(String freeBoardRegDate) {
		this.freeBoardRegDate = freeBoardRegDate;
	}

	public String getFreeBoardContent() {
		return freeBoardContent;
	}

	public void setFreeBoardContent(String freeBoardContent) {
		this.freeBoardContent = freeBoardContent;
	}

	public int getFreeBoardViews() {
		return freeBoardViews;
	}

	public void setFreeBoardViews(int freeBoardViews) {
		this.freeBoardViews = freeBoardViews;
	}

	public String getFreeBoardImage() {
		return freeBoardImage;
	}

	public void setFreeBoardImage(String freeBoardImage) {
		this.freeBoardImage = freeBoardImage;
	}

	public String getNoticeFlag() {
		return noticeFlag;
	}

	public void setNoticeFlag(String noticeFlag) {
		this.noticeFlag = noticeFlag;
	}
	
	

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "FreeBoard [freeBoardNo=" + freeBoardNo + ", user=" + user + ", freeBoardTitle=" + freeBoardTitle
				+ ", freeBoardRegDate=" + freeBoardRegDate + ", freeBoardContent=" + freeBoardContent
				+ ", freeBoardViews=" + freeBoardViews + ", freeBoardImage=" + freeBoardImage + ", noticeFlag="
				+ noticeFlag + ", comment=" + comment + "]";
	}



}
