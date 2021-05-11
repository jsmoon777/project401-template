package com.green.ffee.reg.vo;

public class RBoardFileVo4 {
	private int idx;
	private String title;
	private String sfilename;
	private String cont;
	private int readcount;
	private int fileidx;
	private String menu_id;
	
	public RBoardFileVo4() {}

	public RBoardFileVo4(int idx, String title, String sfilename, String cont, int readcount, int fileidx,
			String menu_id) {
		super();
		this.idx = idx;
		this.title = title;
		this.sfilename = sfilename;
		this.cont = cont;
		this.readcount = readcount;
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

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
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
		return "RBoardFileVo2 [idx=" + idx + ", title=" + title + ", sfilename=" + sfilename + ", cont=" + cont
				+ ", readcount=" + readcount + ", fileidx=" + fileidx + ", menu_id=" + menu_id + "]";
	}
	
	
}
