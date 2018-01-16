package com.amc.common;

public class Search {

	/// Field
	private int currentPage;
	private String searchCondition;
	private String searchKeyword;
	private String searchKeyword2;
	private String searchKeyword3;
	private String searchProdType;
	String orderCondition; //
	String orderOption; //
	private int pageSize;
	int pageUnit;
	// ==> ����Ʈȭ�� currentPage�� �ش��ϴ� ȸ�������� ROWNUM ��� SELECT ���� �߰��� Field
	// ==> UserMapper.xml ��
	// ==> <select id="getUserList" parameterType="search"
	// resultMap="userSelectMap">
	// ==> ����
	private int endRowNum;
	private int startRowNum;
	boolean stockView;

	/// Constructor
	public Search() {
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	/// Method
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	public String getSearchProdType() {
		return searchProdType;
	}


	public void setSearchProdType(String searchProdType) {
		this.searchProdType = searchProdType;
	}


	public String getOrderCondition() {
		return orderCondition;
	}


	public void setOrderCondition(String orderCondition) {
		this.orderCondition = orderCondition;
	}


	public String getOrderOption() {
		return orderOption;
	}


	public void setOrderOption(String orderOption) {
		this.orderOption = orderOption;
	}


	public String getSearchKeyword3() {
		return searchKeyword3;
	}

	public void setSearchKeyword3(String searchKeyword3) {
		this.searchKeyword3 = searchKeyword3;
	}

	// ==> Select Query �� ROWNUM ������ ��
	public int getEndRowNum() {
		return getCurrentPage() * getPageSize();
	}

	// ==> Select Query �� ROWNUM ���� ��
	public int getStartRowNum() {
		
		//�ظ� ��� ��ü ��� �ҷ����� ���� �߰�
		if (startRowNum == 2) {
			return 1;
		} else {
			return (getCurrentPage() - 1) * getPageSize() + 1;
		}
	}

	public String getSearchKeyword2() {
		return searchKeyword2;
	}

	public void setSearchKeyword2(String searchKeyword2) {
		this.searchKeyword2 = searchKeyword2;
	}

	public boolean isStockView() {
		return stockView;
	}

	public void setStockView(boolean stockView) {
		this.stockView = stockView;
	}

	@Override
	public String toString() {
		return "Search [currentPage=" + currentPage + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + ", searchKeyword2=" + searchKeyword2 + ", searchKeyword3=" + searchKeyword3
				+ ", searchProdType=" + searchProdType  + ", orderCondition="
				+ orderCondition + ", orderOption=" + orderOption + ", pageSize=" + pageSize + ", pageUnit=" + pageUnit
				+ ", endRowNum=" + endRowNum + ", startRowNum=" + startRowNum + ", stockView=" + stockView + "]";
	}

	
}