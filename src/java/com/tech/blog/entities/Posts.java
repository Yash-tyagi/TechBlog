package com.tech.blog.entities;

import java.sql.Date;

public class Posts {
	
	private int pid;
	private String pTitle;
	private String pContent;
	private String pCode = null;
	private String pPic = null;
	private java.sql.Date pDate;
	private int cid;
	private int uid;
	
	public Posts(int pid,String pTitle, String pContent, String pCode, String pPic, Date pDate,int cid, int uid) {
		super();
		this.pid =pid;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pDate = pDate;
		this.cid = cid;
		this.uid = uid;
	}
	
	public Posts(String pTitle, String pContent, String pCode, String pPic, int cid, int uid) {
		super();
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.cid = cid;
		this.uid = uid;
	}
	
	public Posts(String pTitle, String pContent, int cid, int uid) {
		super();
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.cid = cid;
		this.uid = uid;
	}

	public Posts() {
		
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getpPic() {
		return pPic;
	}

	public void setpPic(String pPic) {
		this.pPic = pPic;
	}

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}
	
	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
	
	public String toString() {
		String s = Integer.toString(pid)+" "+pTitle+" "+pContent+" "+pCode+" "+pPic+" "+pDate.toString()+" "+cid+" "+uid;
		return s;
	}
	
	
	
}
