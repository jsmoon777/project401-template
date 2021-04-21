package com.green.ffee.event.vo;

import java.sql.Date;

public class EventFileVO {
	private int file_no;
	private int eno;
	private String org_file_name;
	private String stored_file_name;
	private int file_size;
	private Date regdate;
	private String del_gb;
	
	
	//boaard 게시판 객체 
	private String title;
	private String eventday;
	
	//랭킹1위.
	private int cnt;
	
	public EventFileVO() {	
	}

	public EventFileVO(int file_no, int eno, String org_file_name, String stored_file_name, int file_size, Date regdate,
			String del_gb, String title, String eventday, int cnt) {
		super();
		this.file_no = file_no;
		this.eno = eno;
		this.org_file_name = org_file_name;
		this.stored_file_name = stored_file_name;
		this.file_size = file_size;
		this.regdate = regdate;
		this.del_gb = del_gb;
		this.title = title;
		this.eventday = eventday;
		this.cnt = cnt;
	}


	public int getFile_no() {
		return file_no;
	}



	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}



	public int getEno() {
		return eno;
	}



	public void setEno(int eno) {
		this.eno = eno;
	}



	public String getOrg_file_name() {
		return org_file_name;
	}



	public void setOrg_file_name(String org_file_name) {
		this.org_file_name = org_file_name;
	}



	public String getStored_file_name() {
		return stored_file_name;
	}



	public void setStored_file_name(String stored_file_name) {
		this.stored_file_name = stored_file_name;
	}



	public int getFile_size() {
		return file_size;
	}



	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}



	public Date getRegdate() {
		return regdate;
	}



	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}



	public String getDel_gb() {
		return del_gb;
	}



	public void setDel_gb(String del_gb) {
		this.del_gb = del_gb;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getEventday() {
		return eventday;
	}



	public void setEventday(String eventday) {
		this.eventday = eventday;
	}



	public int getCnt() {
		return cnt;
	}



	public void setCnt(int cnt) {
		this.cnt = cnt;
	}



	@Override
	public String toString() {
		return "EventFileVO [file_no=" + file_no + ", eno=" + eno + ", org_file_name=" + org_file_name
				+ ", stored_file_name=" + stored_file_name + ", file_size=" + file_size + ", regdate=" + regdate
				+ ", del_gb=" + del_gb + ", title=" + title + ", eventday=" + eventday + ", cnt=" + cnt + "]";
	}

	
	
	

}
