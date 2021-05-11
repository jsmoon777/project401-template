package com.green.ffee.reg.vo;

public class CallFileVo {
	private String title;
	private String sfilename;
	
	public CallFileVo() {}
	public CallFileVo(String title, String sfilename) {
		super();
		this.title = title;
		this.sfilename = sfilename;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSfilename() {
		return sfilename;
	}
	public void setSfilename(String sfilename) {
		this.sfilename = sfilename;
	}
	@Override
	public String toString() {
		return "CallFileVo [title=" + title + ", sfilename=" + sfilename + "]";
	}
	
	
	
}
