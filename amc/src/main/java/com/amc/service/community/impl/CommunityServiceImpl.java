package com.amc.service.community.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.amc.common.Search;
import com.amc.service.community.CommunityDAO;
import com.amc.service.community.CommunityService;
import com.amc.service.domain.Comment;
import com.amc.service.domain.FreeBoard;

@Repository("communityServiceImpl")
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	@Qualifier("communityDAOImpl")
	private CommunityDAO communityDAO;

	public void setCommunityDAO(CommunityDAO communityDAO) {
		this.communityDAO = communityDAO;
	}

	public CommunityServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public List<FreeBoard> getFreeBoardList(Search search) {
		System.out.println("communityServiceImpl의 getFreeBoardList 시작...");
		System.out.println("1. search값 ==> " + search);
		List<FreeBoard> list = communityDAO.getFreeBoardList(search);
		System.out.println("2. list의 값 ==> " + list);
		System.out.println("communityDAOImpl의 getFreeBoardList 끝...");
		return list;
	}

	@Override
	public List<FreeBoard> getNoticeList() {
		System.out.println("communityServiceImpl의 getNoticeList 시작...");
		List<FreeBoard> noticeList = communityDAO.getNoticeList();
		System.out.println("2. list의 값 ==> " + noticeList);
		System.out.println("communityDAOImpl의 getNoticeList 끝...");
		return noticeList;
	}

	@Override
	public FreeBoard getFreeBoard(int freeBoardNo) {
		System.out.println("communityServiceImpl의 getFreeBoard 시작...");
		System.out.println("1. freeBoardNo값 ==> " + freeBoardNo);
		FreeBoard freeBoard = communityDAO.getFreeBoard(freeBoardNo);
		System.out.println("2. freeBoard의 값 ==> " + freeBoard);
		System.out.println("communityServiceImpl의 getFreeBoard 끝...");
		return freeBoard;
	}

	@Override
	public void deleteFreeBoard(int freeBoardNo) {
		System.out.println("communityServiceImpl의 deleteFreeBoard 시작...");
		System.out.println("1. freeBoardNo값 ==> " + freeBoardNo);
		communityDAO.deleteFreeBoard(freeBoardNo);

		System.out.println("communityServiceImpl의 deleteFreeBoard 끝...");

	}

	@Override
	public void addFreeBoard(FreeBoard freeBoard) {
		System.out.println("communityServiceImpl의 addFreeBoard 시작...");
		System.out.println("1. freeboard값 ==> " + freeBoard);
		communityDAO.addFreeBoard(freeBoard);

		System.out.println("communityServiceImpl의 addFreeBoard 끝...");
	}

	@Override
	public void updateFreeBoard(FreeBoard freeBoard) {
		System.out.println("communityServiceImpl의 addFreeBoard 시작...");
		System.out.println("1. freeboard값 ==> " + freeBoard);
		communityDAO.updateFreeBoard(freeBoard);
		System.out.println("communityServiceImpl의 addFreeBoard 끝...");
	}

	@Override
	public int getTotalCount(Search search) throws Exception {

		System.out.println("communityServiceImpl의 getTotalCount 시작...");
		System.out.println("1. search값 ==> " + search);
		int getTotalCount = communityDAO.getTotalCount(search);
		System.out.println("2. getTotalCount의 값 ==> " + getTotalCount);
		System.out.println("communityServiceImpl의 getTotalCount 끝...");

		return getTotalCount;
	}

	@Override
	public int getNoticeListCount(int freeBoardNo) throws Exception {

		System.out.println("communityServiceImpl의 getNoticeListCount 시작...");

		int getNoticeListCount = communityDAO.getNoticeListCount(freeBoardNo);
		System.out.println("2. getNoticeListCount의 값 ==> " + getNoticeListCount);
		System.out.println("communityServiceImpl의 getNoticeListCount 끝...");

		return getNoticeListCount;
	}

	@Override
	public int getFreeBoardTotalCount(int freeBoardNo) throws Exception {

		System.out.println("communityServiceImpl의 getFreeBoardTotalCount 시작...");
		System.out.println("1. search값 ==> " + freeBoardNo);
		int getFreeBoardTotalCount = communityDAO.getFreeBoardTotalCount(freeBoardNo);
		System.out.println("2. getTotalCount의 값 ==> " + getFreeBoardTotalCount);
		System.out.println("communityServiceImpl의 getFreeBoardTotalCount 끝...");

		return getFreeBoardTotalCount;
	}

	@Override
	public int addComment(Comment comment) {
		System.out.println("communityServiceImpl의 addComment 시작...");
		System.out.println("1. comment값 ==> " + comment);

		System.out.println("communityServiceImpl의 addComment 끝...");

		return communityDAO.addComment(comment);

	}

	@Override
	public List<Comment> getCommentList(Search search, int freeBoardNo) {
		System.out.println("getCommentList의 getFreeBoardList 시작...");
		System.out.println("1. search값 ==> " + search);
		System.out.println("2. freeBoardNo값 ==> " + freeBoardNo);
		List<Comment> list = communityDAO.getCommentList(search, freeBoardNo);
		System.out.println("3. list의 값 ==> " + list);
		System.out.println("communityDAOImpl의 getCommentList 끝...");
		return list;
	}

	@Override
	public List<Comment> getReplyList(Search search, int parentCommentNo) {
		System.out.println("communityServiceImpl의 getReplyList 시작...");
		System.out.println("1. search값 ==> " + search);
		;
		System.out.println("3. parentCommentNo값 ==> " + parentCommentNo);
		List<Comment> list = communityDAO.getReplyList(search, parentCommentNo);
		System.out.println("4. list의 값 ==> " + list);
		System.out.println("communityDAOImpl의 getReplyList 끝...");
		return list;
	}

	@Override
	public int deleteComment(int commentNo) {
		System.out.println("communityServiceImpl의 deleteComment 시작...");
		System.out.println("1. commentNo값 ==> " + commentNo);

		System.out.println("communityServiceImpl의 deleteComment 끝...");

		return communityDAO.deleteComment(commentNo);

	}

	@Override
	public int updateComment(Comment comment) {
		System.out.println("communityServiceImpl의 updateComment 시작...");
		System.out.println("1. comment값 ==> " + comment);

		System.out.println("communityServiceImpl의 updateComment 끝...");

		return communityDAO.updateComment(comment);
	}

}
