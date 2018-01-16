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
		System.out.println("communityDAOImpl의 getNoticeList 시작...");

		List<FreeBoard> noticeList = sqlSession.selectList("FreeBoardMapper.getNoticeList");
		System.out.println("1. list의 값 ==> " + noticeList);
		System.out.println("communityDAOImpl의 getNoticeList 끝...");

		return noticeList;
	}

	@Override
	public List<FreeBoard> getFreeBoardList(Search search) {
		System.out.println("communityDAOImpl의 getFreeBoardList 시작...");
		System.out.println("1. search값 ==> " + search);
		List<FreeBoard> list = sqlSession.selectList("FreeBoardMapper.getFreeBoardList", search);
		System.out.println("2. list의 값 ==> " + list);
		System.out.println("communityDAOImpl의 getFreeBoardList 끝...");
		return list;
	}

	@Override
	public FreeBoard getFreeBoard(int freeBoardNo) {
		System.out.println("communityDAOImpl의 getFreeBoard 시작...");
		System.out.println("1. freeBoardNo값 ==> " + freeBoardNo);
		FreeBoard freeBoard = sqlSession.selectOne("FreeBoardMapper.getFreeBoard", freeBoardNo);
		sqlSession.update("FreeBoardMapper.updateFreeBoardViews", freeBoard);
		freeBoard = sqlSession.selectOne("FreeBoardMapper.getFreeBoard", freeBoardNo);
		System.out.println("2. freeBoard의 값 ==> " + freeBoard);
		System.out.println("communityDAOImpl의 getFreeBoard 끝...");
		return freeBoard;
	}

	@Override
	public void deleteFreeBoard(int freeBoardNo) {
		System.out.println("communityDAOImpl의 deleteFreeBoard 시작...");
		System.out.println("1. freeBoardNo값 ==> " + freeBoardNo);
		int deleteFreeComment = sqlSession.delete("CommentMapper.deleteFreeBoardCommentAll",freeBoardNo);
		System.out.println("2. deleteFreeComment의 값 ==> " + deleteFreeComment);
		int deleteFreeBoard = sqlSession.delete("FreeBoardMapper.deleteFreeBoard", freeBoardNo);
		System.out.println("3. deleteFreeBoard의 값 ==> " + deleteFreeBoard);
		System.out.println("communityDAOImpl의 deleteFreeBoard 끝...");

	}

	@Override
	public void addFreeBoard(FreeBoard freeBoard) {
		System.out.println("communityDAOImpl의 addFreeBoard 시작...");
		System.out.println("1. freeboard값 ==> " + freeBoard);
		int addFreeBoard = sqlSession.insert("FreeBoardMapper.addFreeBoard", freeBoard);
		System.out.println("2. addFreeBoard의 값 ==> " + addFreeBoard);
		System.out.println("communityDAOImpl의 addFreeBoard 끝...");
	}

	@Override
	public void updateFreeBoard(FreeBoard freeBoard) {
		System.out.println("communityDAOImpl의 addFreeBoard 시작...");
		System.out.println("1. freeboard값 ==> " + freeBoard);
		int addFreeBoard = sqlSession.update("FreeBoardMapper.updateFreeBoard", freeBoard);
		System.out.println("2. addFreeBoard의 값 ==> " + addFreeBoard);
		System.out.println("communityDAOImpl의 addFreeBoard 끝...");
	}

	@Override
	public int getTotalCount(Search search) throws Exception {

		System.out.println("communityDAOImpl의 getTotalCount 시작...");
		System.out.println("1. search값 ==> " + search);
		int getTotalCount = sqlSession.selectOne("FreeBoardMapper.getTotalCount", search);
		System.out.println("2. getTotalCount의 값 ==> " + getTotalCount);
		System.out.println("communityDAOImpl의 getTotalCount 끝...");

		return getTotalCount;
	}

	@Override
	public int getNoticeListCount(int freeBoardNo) throws Exception {

		System.out.println("communityDAOImpl의 getNoticeListCount 시작...");

		int getNoticeListCount = sqlSession.selectOne("FreeBoardMapper.getNoticeListCount", freeBoardNo);
		System.out.println("2. getTotalCount의 값 ==> " + getNoticeListCount);
		
		//System.out.println("으어어어어엉어 " + sqlSession.selectOne("FreeBoardMapper.getNoticeListCount", freeBoardNo));
		System.out.println("communityDAOImpl의 getNoticeListCount 끝...");

		return getNoticeListCount;
	}

	@Override
	public int addComment(Comment comment) {
		// TODO Auto-generated method stub
		System.out.println("communityDAOImpl의 addComment 시작...");
		System.out.println("1. comment값 ==> " + comment);
		int addComment = sqlSession.insert("CommentMapper.addFreeBoardComment", comment);
		System.out.println("2. addComment의 값 ==> " + addComment);
		System.out.println("communityDAOImpl의 addComment 끝...");
		return addComment;
	}

	@Override
	public List<Comment> getCommentList(Search search, int freeBoardNo) {
		System.out.println("communityDAOImpl의 getCommentList 시작...");
		System.out.println("1. search값 ==> " + search);
		System.out.println("2. freeBoardNo값 ==> " + freeBoardNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("freeBoardNo", freeBoardNo);
		System.out.println("3. map값 ==> " + map);
		List<Comment> list = sqlSession.selectList("CommentMapper.getFreeBoardCommentList", map);
		System.out.println("4. list의 값 ==> " + list);
		System.out.println("communityDAOImpl의 getCommentList 끝...");
		return list;
	}

	@Override
	public List<Comment> getReplyList(Search search, int parentCommentNo) {
		// TODO Auto-generated method stub
		System.out.println("communityDAOImpl의 getReplyList 시작...");
		System.out.println("1. search값 ==> " + search);

		System.out.println("3. parentCommentNo값 ==> " + parentCommentNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);

		map.put("parentCommentNo", parentCommentNo);
		System.out.println("3. map값 ==> " + map);
		List<Comment> list = sqlSession.selectList("CommentMapper.getFreeBoardReplyCommentList", map);
		System.out.println("4. list의 값 ==> " + list);
		System.out.println("communityDAOImpl의 getReplyList 끝...");

		return list;

	}

	@Override
	public int deleteComment(int commentNo) {
		System.out.println("communityDAOImpl의 deleteComment 시작...");
		System.out.println("1. commentNo값 ==> " + commentNo);
		int deleteComment = sqlSession.delete("CommentMapper.deleteFreeBoardComment", commentNo);
		System.out.println("2. deleteFreeBoard의 값 ==> " + deleteComment);
		System.out.println("communityDAOImpl의 deleteComment 끝...");
		return deleteComment;
	}

	@Override
	public int updateComment(Comment comment) {
		System.out.println("communityDAOImpl의 updateComment 시작...");
		System.out.println("1. comment값 ==> " + comment);
		int updateComment = sqlSession.update("CommentMapper.updateFreeBoardComment", comment);
		System.out.println("2. addFreeBoard의 값 ==> " + updateComment);
		System.out.println("communityDAOImpl의 updateComment 끝...");
		return updateComment;
	}

	@Override
	public int getFreeBoardTotalCount(int freeBoardNo) {
		System.out.println("communityDAOImpl의 getFreeBoardTotalCount 시작...");
		System.out.println("1. freeBoardNo값 ==> " + freeBoardNo);
		int getFreeBoardTotalCount = sqlSession.selectOne("CommentMapper.getFreeBoardTotalCount", freeBoardNo);
		System.out.println("2. addFreeBoard의 값 ==> " + getFreeBoardTotalCount);
		System.out.println("communityDAOImpl의 updateComment 끝...");
		return getFreeBoardTotalCount;
	}

}
