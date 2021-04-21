package com.green.ffee.nboard.vo;

import oracle.sql.DATE;

public class NFileVo {

	private int file_no;
	private int nno;
	private String org_file_name;
	private String stored_file_name;
	private int file_size;
	private DATE regdate;
	
	public NFileVo() {}
	public NFileVo(int file_no, int nno, String org_file_name, String stored_file_name, int file_size, DATE regdate) {
		super();
		this.file_no = file_no;
		this.nno = nno;
		this.org_file_name = org_file_name;
		this.stored_file_name = stored_file_name;
		this.file_size = file_size;
		this.regdate = regdate;
	}
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
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
	public DATE getRegdate() {
		return regdate;
	}
	public void setRegdate(DATE regdate) {
		this.regdate = regdate;
	}
	
	
	@Override
	public String toString() {
		return "NFileVo [file_no=" + file_no + ", nno=" + nno + ", org_file_name=" + org_file_name
				+ ", stored_file_name=" + stored_file_name + ", file_size=" + file_size + ", regdate=" + regdate + "]";
	}
	
	
	
	
}
