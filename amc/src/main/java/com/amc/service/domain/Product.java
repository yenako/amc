package com.amc.service.domain;

import java.sql.Date;

public class Product {
	
	private int prodNo;
	private int prodPrice;
	private int totalStock;
	private int salesStock;
	private int stock;
	private int expiryDate;
	private String prodImage;
	private String prodName;
	private String prodDetail;
	private String prodSetInfo;
	private String proTranCode;
	private String prodType;
	private Date salesOpenDate;
	private Date salesEndDate;
	private Date prodRegDate;

	public Product() {		
	}
	
	public String getProTranCode() {
		return proTranCode;
	}

	public void setProTranCode(String proTranCode) {
		this.proTranCode = proTranCode;
	}
	
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public int getProdPrice() {
		return prodPrice;
	}
	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}
	public int getTotalStock() {
		return totalStock;
	}
	public void setTotalStock(int totalStock) {
		this.totalStock = totalStock;
	}
	public int getSalesStock() {
		return salesStock;
	}
	public void setSalesStock(int salesStock) {
		this.salesStock = salesStock;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(int expiryDate) {
		this.expiryDate = expiryDate;
	}
	public String getProdImage() {
		return prodImage;
	}
	public void setProdImage(String prodImage) {
		this.prodImage = prodImage;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public String getProdDetail() {
		return prodDetail;
	}
	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail;
	}
	public String getProdSetInfo() {
		return prodSetInfo;
	}
	public void setProdSetInfo(String prodSetInfo) {
		this.prodSetInfo = prodSetInfo;
	}
	public Date getSalesOpenDate() {
		return salesOpenDate;
	}
	public void setSalesOpenDate(Date salesOpenDate) {
		this.salesOpenDate = salesOpenDate;
	}
	public Date getSalesEndDate() {
		return salesEndDate;
	}
	public void setSalesEndDate(Date salesEndDate) {
		this.salesEndDate = salesEndDate;
	}
	public Date getProdRegDate() {
		return prodRegDate;
	}
	public void setProdRegDate(Date prodRegDate) {
		this.prodRegDate = prodRegDate;
	}
	public String getProdType() {
		return prodType;
	}
	public void setProdType(String prodType) {
		this.prodType = prodType;
	}

	@Override
	public String toString() {
		return "Product [prodNo=" + prodNo + ", prodPrice=" + prodPrice + ", totalStock=" + totalStock + ", salesStock="
				+ salesStock + ", stock=" + stock + ", expiryDate=" + expiryDate + ", prodImage=" + prodImage
				+ ", prodName=" + prodName + ", prodDetail=" + prodDetail + ", prodSetInfo=" + prodSetInfo
				+ ", proTranCode=" + proTranCode + ", prodType=" + prodType + ", salesOpenDate=" + salesOpenDate
				+ ", salesEndDate=" + salesEndDate + ", prodRegDate=" + prodRegDate + "]";
	}

	
}
