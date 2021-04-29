package com.green.ffee.user.vo;

public class ProfileVo {
	private int user_img_num;
	private String user_id;
	private String filename;
	private String fileext;
	private String sfilename;
	
	public ProfileVo() {}

	public ProfileVo(int user_img_num, String user_id, String filename, String fileext, String sfilename) {
		super();
		this.user_img_num = user_img_num;
		this.user_id = user_id;
		this.filename = filename;
		this.fileext = fileext;
		this.sfilename = sfilename;
	}

	public int getUser_img_num() {
		return user_img_num;
	}

	public void setUser_img_num(int user_img_num) {
		this.user_img_num = user_img_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFileext() {
		return fileext;
	}

	public void setFileext(String fileext) {
		this.fileext = fileext;
	}

	public String getSfilename() {
		return sfilename;
	}

	public void setSfilename(String sfilename) {
		this.sfilename = sfilename;
	}

	@Override
	public String toString() {
		return "ProfileVo [user_img_num=" + user_img_num + ", user_id=" + user_id + ", filename=" + filename
				+ ", fileext=" + fileext + ", sfilename=" + sfilename + "]";
	}
	
	
	
}
