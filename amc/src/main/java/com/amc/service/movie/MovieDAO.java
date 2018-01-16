package com.amc.service.movie;

import java.util.List;
import java.util.Map;

import com.amc.common.Search;
import com.amc.service.domain.Movie;
import com.amc.service.domain.MovieComment;
import com.amc.service.domain.User;
import com.amc.service.domain.WishList;
import com.amc.service.domain.onetime.MovieList;
import com.amc.service.domain.onetime.MovieOnScheule;

public interface MovieDAO {

	
	
	// ��ü ��ȭ ��� �ҷ����� (�����ڿ�)
	public List<Movie> getMoiveAdminList(Search search);

	// ���� �� ��ȭ ��� �ҷ�����
	public List<Movie> getMovieList(Search search);
	
	
	// �� ���� ��ȭ ��� �ҷ�����
	public List<Movie> getMoviePreviewList(Search search);

	// �û�ȸ ��ȭ ��� �ҷ�����
	public List<Movie> getCommingSoonList(Search search);
	
	public List<MovieOnScheule> getScreenCalendar(Search search) throws Exception;
		
	// ��ȭ ��� �� �˻� �� 
	public int getTotalCount(Search search) throws Exception;
	
	
	
	// ��ȭ ��������
	public Movie getMovie(int movieNo) throws Exception;
	

	// ��ȭ ����
	public int updateMovie(Movie movie) throws Exception;

	// ��ȭ ����
	public int deleteMovie(int movieNo) throws Exception;
	

	// �������������� ���ø���Ʈ �ҷ�����
	public List<WishList> getWishList(Search search, String userId);
	
	// ���� �󿵿�ȭ�� �󿵿��� ��ȭ��Ͽ���  ���ø���Ʈ �ҷ�����
	// public List<WishList> getWishListMovie(Search search, User user);

	// RESTCONTROLLER Ÿ�� �κ�

	// ����� ���� �� �ܺ� ��ȭ API ��� �ҷ�����
	public List<MovieList> getAPIMoiveList() throws Exception; 
		

	// submit�� ������ �ܺ� ��ȭ API �� + ���̹� ��ȭ ������ API�� ������ �� DB���
	public int addMovie(Movie movie);
	
	// ������Ͽ��� Ŭ���Ѱ��� ����ȭ������, ��ȭ��Ͽ��� Ŭ���Ѱ��� ������ȭ������

	// ��ȭ�� ���� ������ �Է�
	public int addMoiveComment(MovieComment movieComment);

	// �������� ������ ����ε� ó�� ����
	public int blindMoiveComment(MovieComment movieComment);

	// ������ ����
	public int updateMovieComment(MovieComment movieComment);

	// ������ ����
	public int deleteMovieComment(int movieCommentNo);

	// ������ ����
	public List<MovieComment> getMovieCommentList(Search search, int movieNo);

	// ȸ���� ��Ʈ�� �������� ���ø���Ʈ�� ���� �ϴ��� ���ϴ��� Ȯ��(Count��)
	public int existWish(int moiveNo, String userId);


	// ��� ��ȭ ��������(���հ˻�, ����1�ܰ�)
	public List<Movie>	uniMovieList(Search search);

	public int getTotalCount(int movieNo) throws Exception;
	
		
	public int dupMovieChk(Search search) throws Exception;

	public MovieComment getMovieComment(int movieCommentNo);
	
	public String checkWishList(WishList wishList);
	
	public int addWishList(WishList wishList);
	
	public int deleteWishList(WishList wishList);

	public Map<String, Object> getWishList(Map<String,Object> map);

	public List<Movie> screenMovieList(Search search);
}
