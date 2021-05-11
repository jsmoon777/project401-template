package com.green.ffee.reg.vo;

public class RBoardFileVo3 {
	private int idx;
	private String title;
	private String sfilename;
	private String cont;
	private String regdate;
	private int fileidx;
	private String menu_id;
	
	public RBoardFileVo3() {}
	public RBoardFileVo3(int idx, String title, String sfilename, String cont, String regdate, int fileidx,
			String menu_id) {
		super();
		this.idx = idx;
		this.title = title;
		this.sfilename = sfilename;
		this.cont = cont;
		this.regdate = regdate;
		this.fileidx = fileidx;
		this.menu_id = menu_id;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
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
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getFileidx() {
		return fileidx;
	}
	public void setFileidx(int fileidx) {
		this.fileidx = fileidx;
	}
	public String getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}
	@Override
	public String toString() {
		return "RBoardFileVo [idx=" + idx + ", title=" + title + ", sfilename=" + sfilename + ", cont=" + cont
				+ ", regdate=" + regdate + ", fileidx=" + fileidx + ", menu_id=" + menu_id + "]";
	}
	
	
}
