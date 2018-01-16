package com.amc.service.domain.onetime;

public class MovieOnScheule {	
	private int id;
	private String name;
	private String startdate;
	private String enddate;
	private String starttime;
	private String endtime;
	private String url;	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	@Override
	public String toString() {
		return "Month [id=" + id + ", name=" + name + ", startdate=" + startdate + ", enddate=" + enddate
				+ ", starttime=" + starttime + ", endtime=" + endtime + ", url=" + url + ", getId()=" + getId()
				+ ", getName()=" + getName() + ", getStartdate()=" + getStartdate() + ", getEnddate()=" + getEnddate()
				+ ", getStarttime()=" + getStarttime() + ", getEndtime()=" + getEndtime() + ", getUrl()=" + getUrl()
				+ "]";
	}
	
}