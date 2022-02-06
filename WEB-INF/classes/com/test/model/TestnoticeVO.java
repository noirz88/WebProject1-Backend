package com.test.model;

import java.util.Date;

public class TestnoticeVO {
	private int seq;
	private String nname;
	private String ntit;
	private String ncon;
	private Date nregdate;
	private int nvisited;
	
	public int getSeq() { return seq; }
	public void setSeq(int seq) { this.seq = seq; }
	
	public String getNname() { return nname; }
	public void setNname(String nname) { this.nname = nname; }
	
	public String getNtit() { return ntit; }
	public void setNtit(String ntit) { this.ntit = ntit; }
	
	public String getNcon() { return ncon; }
	public void setNcon(String ncon) { this.ncon = ncon; }
	
	public Date getNregdate() { return nregdate; }
	public void setNregdate(Date nregdate) { this.nregdate = nregdate; }
	
	public int getNvisited() { return nvisited; }
	public void setNvisited(int nvisited) { this.nvisited = nvisited; }
		
}
