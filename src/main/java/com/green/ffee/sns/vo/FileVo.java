package com.green.ffee.sns.vo;

import java.sql.Date;

public class FileVo {
	private int file_no;
	private int bno;
	private String org_file_name;
	private String stored_file_name; 
	private int file_size;
	private Date regdate;
	private String del_gb;
	private int cnt;
	
	public FileVo() {
		
	}

	public FileVo(int file_no, int bno, String org_file_name, String stored_file_name, int file_size, Date regdate,
			String del_gb, int cnt) {
		super();
		this.file_no = file_no;
		this.bno = bno;
		this.org_file_name = org_file_name;
		this.stored_file_name = stored_file_name;
		this.file_size = file_size;
		this.regdate = regdate;
		this.del_gb = del_gb;
		this.cnt = cnt;
	}

	public int getFile_no() {
		return file_no;
	}

	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
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

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "FileVo [file_no=" + file_no + ", bno=" + bno + ", org_file_name=" + org_file_name
				+ ", stored_file_name=" + stored_file_name + ", file_size=" + file_size + ", regdate=" + regdate
				+ ", del_gb=" + del_gb + ", cnt=" + cnt + "]";
	}
	
	
	
	
}
