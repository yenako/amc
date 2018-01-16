package com.amc.service.domain.onetime;

import java.util.List;

import com.amc.service.domain.MovieAPI;

public class MovieJson {
	
	private int total;
	private int records;
	private List<MovieList> rows;

	private int page;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getRecords() {
		return records;
	}
	public void setRecords(int records) {
		this.records = records;
	}
	public List<MovieList> getRows() {
		return rows;
	}
	public void setRows(List<MovieList> list) {
		this.rows = list;
	}
	
	
	@Override
	public String toString() {
		return "MovieJson [page=" + page + ", total=" + total + ", records=" + records + ", rows=" + rows + "]";
	}
	
}
