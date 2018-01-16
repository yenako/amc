package com.amc.service.community.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.amc.common.Search;
import com.amc.service.community.CommunityDAO;
import com.amc.service.domain.Comment;
import com.amc.service.domain.FreeBoard;

@Repository("communityDAOImpl")
public class CommunityDAOImpl implements CommunityDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<FreeBoard> getNoticeList() {
		System.out.println("communityDAOImpl�� getNoticeList ����...");

		List<FreeBoard> noticeList = sqlSession.selectList("FreeBoardMapper.getNoticeList");
		System.out.println("1. list�� �� ==> " + noticeList);
		System.out.println("communityDAOImpl�� getNoticeList ��...");

		return noticeList;
	}

	@Override
	public List<FreeBoard> getFreeBoardList(Search search) {
		System.out.println("communityDAOImpl�� getFreeBoardList ����...");
		System.out.println("1. search�� ==> " + search);
		List<FreeBoard> list = sqlSession.selectList("FreeBoardMapper.getFreeBoardList", search);
		System.out.println("2. list�� �� ==> " + list);
		System.out.println("communityDAOImpl�� getFreeBoardList ��...");
		return list;
	}

	@Override
	public FreeBoard getFreeBoard(int freeBoardNo) {
		System.out.println("communityDAOImpl�� getFreeBoard ����...");
		System.out.println("1. freeBoardNo�� ==> " + freeBoardNo);
		FreeBoard freeBoard = sqlSession.selectOne("FreeBoardMapper.getFreeBoard", freeBoardNo);
		sqlSession.update("FreeBoardMapper.updateFreeBoardViews", freeBoard);
		freeBoard = sqlSession.selectOne("FreeBoardMapper.getFreeBoard", freeBoardNo);
		System.out.println("2. freeBoard�� �� ==> " + freeBoard);
		System.out.println("communityDAOImpl�� getFreeBoard ��...");
		return freeBoard;
	}

	@Override
	public void deleteFreeBoard(int freeBoardNo) {
		System.out.println("communityDAOImpl�� deleteFreeBoard ����...");
		System.out.println("1. freeBoardNo�� ==> " + freeBoardNo);
		int deleteFreeComment = sqlSession.delete("CommentMapper.deleteFreeBoardCommentAll",freeBoardNo);
		System.out.println("2. deleteFreeComment�� �� ==> " + deleteFreeComment);
		int deleteFreeBoard = sqlSession.delete("FreeBoardMapper.deleteFreeBoard", freeBoardNo);
		System.out.println("3. deleteFreeBoard�� �� ==> " + deleteFreeBoard);
		System.out.println("communityDAOImpl�� deleteFreeBoard ��...");

	}

	@Override
	public void addFreeBoard(FreeBoard freeBoard) {
		System.out.println("communityDAOImpl�� addFreeBoard ����...");
		System.out.println("1. freeboard�� ==> " + freeBoard);
		int addFreeBoard = sqlSession.insert("FreeBoardMapper.addFreeBoard", freeBoard);
		System.out.println("2. addFreeBoard�� �� ==> " + addFreeBoard);
		System.out.println("communityDAOImpl�� addFreeBoard ��...");
	}

	@Override
	public void updateFreeBoard(FreeBoard freeBoard) {
		System.out.println("communityDAOImpl�� addFreeBoard ����...");
		System.out.println("1. freeboard�� ==> " + freeBoard);
		int addFreeBoard = sqlSession.update("FreeBoardMapper.updateFreeBoard", freeBoard);
		System.out.println("2. addFreeBoard�� �� ==> " + addFreeBoard);
		System.out.println("communityDAOImpl�� addFreeBoard ��...");
	}

	@Override
	public int getTotalCount(Search search) throws Exception {

		System.out.println("communityDAOImpl�� getTotalCount ����...");
		System.out.println("1. search�� ==> " + search);
		int getTotalCount = sqlSession.selectOne("FreeBoardMapper.getTotalCount", search);
		System.out.println("2. getTotalCount�� �� ==> " + getTotalCount);
		System.out.println("communityDAOImpl�� getTotalCount ��...");

		return getTotalCount;
	}

	@Override
	public int getNoticeListCount(int freeBoardNo) throws Exception {

		System.out.println("communityDAOImpl�� getNoticeListCount ����...");

		int getNoticeListCount = sqlSession.selectOne("FreeBoardMapper.getNoticeListCount", freeBoardNo);
		System.out.println("2. getTotalCount�� �� ==> " + getNoticeListCount);
		
		//System.out.println("���������� " + sqlSession.selectOne("FreeBoardMapper.getNoticeListCount", freeBoardNo));
		System.out.println("communityDAOImpl�� getNoticeListCount ��...");

		return getNoticeListCount;
	}

	@Override
	public int addComment(Comment comment) {
		// TODO Auto-generated method stub
		System.out.println("communityDAOImpl�� addComment ����...");
		System.out.println("1. comment�� ==> " + comment);
		int addComment = sqlSession.insert("CommentMapper.addFreeBoardComment", comment);
		System.out.println("2. addComment�� �� ==> " + addComment);
		System.out.println("communityDAOImpl�� addComment ��...");
		return addComment;
	}

	@Override
	public List<Comment> getCommentList(Search search, int freeBoardNo) {
		System.out.println("communityDAOImpl�� getCommentList ����...");
		System.out.println("1. search�� ==> " + search);
		System.out.println("2. freeBoardNo�� ==> " + freeBoardNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("freeBoardNo", freeBoardNo);
		System.out.println("3. map�� ==> " + map);
		List<Comment> list = sqlSession.selectList("CommentMapper.getFreeBoardCommentList", map);
		System.out.println("4. list�� �� ==> " + list);
		System.out.println("communityDAOImpl�� getCommentList ��...");
		return list;
	}

	@Override
	public List<Comment> getReplyList(Search search, int parentCommentNo) {
		// TODO Auto-generated method stub
		System.out.println("communityDAOImpl�� getReplyList ����...");
		System.out.println("1. search�� ==> " + search);

		System.out.println("3. parentCommentNo�� ==> " + parentCommentNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);

		map.put("parentCommentNo", parentCommentNo);
		System.out.println("3. map�� ==> " + map);
		List<Comment> list = sqlSession.selectList("CommentMapper.getFreeBoardReplyCommentList", map);
		System.out.println("4. list�� �� ==> " + list);
		System.out.println("communityDAOImpl�� getReplyList ��...");

		return list;

	}

	@Override
	public int deleteComment(int commentNo) {
		System.out.println("communityDAOImpl�� deleteComment ����...");
		System.out.println("1. commentNo�� ==> " + commentNo);
		int deleteComment = sqlSession.delete("CommentMapper.deleteFreeBoardComment", commentNo);
		System.out.println("2. deleteFreeBoard�� �� ==> " + deleteComment);
		System.out.println("communityDAOImpl�� deleteComment ��...");
		return deleteComment;
	}

	@Override
	public int updateComment(Comment comment) {
		System.out.println("communityDAOImpl�� updateComment ����...");
		System.out.println("1. comment�� ==> " + comment);
		int updateComment = sqlSession.update("CommentMapper.updateFreeBoardComment", comment);
		System.out.println("2. addFreeBoard�� �� ==> " + updateComment);
		System.out.println("communityDAOImpl�� updateComment ��...");
		return updateComment;
	}

	@Override
	public int getFreeBoardTotalCount(int freeBoardNo) {
		System.out.println("communityDAOImpl�� getFreeBoardTotalCount ����...");
		System.out.println("1. freeBoardNo�� ==> " + freeBoardNo);
		int getFreeBoardTotalCount = sqlSession.selectOne("CommentMapper.getFreeBoardTotalCount", freeBoardNo);
		System.out.println("2. addFreeBoard�� �� ==> " + getFreeBoardTotalCount);
		System.out.println("communityDAOImpl�� updateComment ��...");
		return getFreeBoardTotalCount;
	}

}
