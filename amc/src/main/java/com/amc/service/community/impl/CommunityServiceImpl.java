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
		System.out.println("communityServiceImpl�� getFreeBoardList ����...");
		System.out.println("1. search�� ==> " + search);
		List<FreeBoard> list = communityDAO.getFreeBoardList(search);
		System.out.println("2. list�� �� ==> " + list);
		System.out.println("communityDAOImpl�� getFreeBoardList ��...");
		return list;
	}

	@Override
	public List<FreeBoard> getNoticeList() {
		System.out.println("communityServiceImpl�� getNoticeList ����...");
		List<FreeBoard> noticeList = communityDAO.getNoticeList();
		System.out.println("2. list�� �� ==> " + noticeList);
		System.out.println("communityDAOImpl�� getNoticeList ��...");
		return noticeList;
	}

	@Override
	public FreeBoard getFreeBoard(int freeBoardNo) {
		System.out.println("communityServiceImpl�� getFreeBoard ����...");
		System.out.println("1. freeBoardNo�� ==> " + freeBoardNo);
		FreeBoard freeBoard = communityDAO.getFreeBoard(freeBoardNo);
		System.out.println("2. freeBoard�� �� ==> " + freeBoard);
		System.out.println("communityServiceImpl�� getFreeBoard ��...");
		return freeBoard;
	}

	@Override
	public void deleteFreeBoard(int freeBoardNo) {
		System.out.println("communityServiceImpl�� deleteFreeBoard ����...");
		System.out.println("1. freeBoardNo�� ==> " + freeBoardNo);
		communityDAO.deleteFreeBoard(freeBoardNo);

		System.out.println("communityServiceImpl�� deleteFreeBoard ��...");

	}

	@Override
	public void addFreeBoard(FreeBoard freeBoard) {
		System.out.println("communityServiceImpl�� addFreeBoard ����...");
		System.out.println("1. freeboard�� ==> " + freeBoard);
		communityDAO.addFreeBoard(freeBoard);

		System.out.println("communityServiceImpl�� addFreeBoard ��...");
	}

	@Override
	public void updateFreeBoard(FreeBoard freeBoard) {
		System.out.println("communityServiceImpl�� addFreeBoard ����...");
		System.out.println("1. freeboard�� ==> " + freeBoard);
		communityDAO.updateFreeBoard(freeBoard);
		System.out.println("communityServiceImpl�� addFreeBoard ��...");
	}

	@Override
	public int getTotalCount(Search search) throws Exception {

		System.out.println("communityServiceImpl�� getTotalCount ����...");
		System.out.println("1. search�� ==> " + search);
		int getTotalCount = communityDAO.getTotalCount(search);
		System.out.println("2. getTotalCount�� �� ==> " + getTotalCount);
		System.out.println("communityServiceImpl�� getTotalCount ��...");

		return getTotalCount;
	}

	@Override
	public int getNoticeListCount(int freeBoardNo) throws Exception {

		System.out.println("communityServiceImpl�� getNoticeListCount ����...");

		int getNoticeListCount = communityDAO.getNoticeListCount(freeBoardNo);
		System.out.println("2. getNoticeListCount�� �� ==> " + getNoticeListCount);
		System.out.println("communityServiceImpl�� getNoticeListCount ��...");

		return getNoticeListCount;
	}

	@Override
	public int getFreeBoardTotalCount(int freeBoardNo) throws Exception {

		System.out.println("communityServiceImpl�� getFreeBoardTotalCount ����...");
		System.out.println("1. search�� ==> " + freeBoardNo);
		int getFreeBoardTotalCount = communityDAO.getFreeBoardTotalCount(freeBoardNo);
		System.out.println("2. getTotalCount�� �� ==> " + getFreeBoardTotalCount);
		System.out.println("communityServiceImpl�� getFreeBoardTotalCount ��...");

		return getFreeBoardTotalCount;
	}

	@Override
	public int addComment(Comment comment) {
		System.out.println("communityServiceImpl�� addComment ����...");
		System.out.println("1. comment�� ==> " + comment);

		System.out.println("communityServiceImpl�� addComment ��...");

		return communityDAO.addComment(comment);

	}

	@Override
	public List<Comment> getCommentList(Search search, int freeBoardNo) {
		System.out.println("getCommentList�� getFreeBoardList ����...");
		System.out.println("1. search�� ==> " + search);
		System.out.println("2. freeBoardNo�� ==> " + freeBoardNo);
		List<Comment> list = communityDAO.getCommentList(search, freeBoardNo);
		System.out.println("3. list�� �� ==> " + list);
		System.out.println("communityDAOImpl�� getCommentList ��...");
		return list;
	}

	@Override
	public List<Comment> getReplyList(Search search, int parentCommentNo) {
		System.out.println("communityServiceImpl�� getReplyList ����...");
		System.out.println("1. search�� ==> " + search);
		;
		System.out.println("3. parentCommentNo�� ==> " + parentCommentNo);
		List<Comment> list = communityDAO.getReplyList(search, parentCommentNo);
		System.out.println("4. list�� �� ==> " + list);
		System.out.println("communityDAOImpl�� getReplyList ��...");
		return list;
	}

	@Override
	public int deleteComment(int commentNo) {
		System.out.println("communityServiceImpl�� deleteComment ����...");
		System.out.println("1. commentNo�� ==> " + commentNo);

		System.out.println("communityServiceImpl�� deleteComment ��...");

		return communityDAO.deleteComment(commentNo);

	}

	@Override
	public int updateComment(Comment comment) {
		System.out.println("communityServiceImpl�� updateComment ����...");
		System.out.println("1. comment�� ==> " + comment);

		System.out.println("communityServiceImpl�� updateComment ��...");

		return communityDAO.updateComment(comment);
	}

}
