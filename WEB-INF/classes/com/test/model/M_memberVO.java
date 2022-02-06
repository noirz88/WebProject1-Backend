package com.test.model;

import java.util.Date;

public class M_memberVO {
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String zipcode;
	private String addr1;
	private String addr2;
	private Date regdate;
	
	public String getId() { return id; }
	public void setID(String id) { this.id = id; }
	
	public String getpw() { return pw; }
	public void setPw(String pw) { this.pw = pw; }
	
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	
	public String getPhone() { return phone; }
	public void setPhone(String phone) { this.phone= phone; }
	
	public String getZipcode() { return zipcode; }
	public void setZipcode(String zipcode) { this.zipcode = zipcode; }
	
	public String getAddr1() { return addr1; }
	public void setAddr1(String addr1) { this.addr1 = addr1; }
	
	public String getAddr2() { return addr2; }
	public void setAddr2(String addr2) { this.addr2 = addr2; }
	
	public Date getRegdate() { return regdate; }
	public void setRegdate(Date regdate) { this.regdate= regdate; }
	
}
