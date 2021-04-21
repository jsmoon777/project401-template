package com.green.ffee.sns.vo;

public class LiketoVO {
	private int likeno;
	private int bno;
	private int like_check;
	private String user_id;
	
	public LiketoVO() {
		
	}
	
	public LiketoVO(int likeno, int bno, int like_check, String user_id) {
		super();
		this.likeno = likeno;
		this.bno = bno;
		this.like_check = like_check;
		this.user_id = user_id;
	}

	public int getLikeno() {
		return likeno;
	}

	public void setLikeno(int likeno) {
		this.likeno = likeno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getLike_check() {
		return like_check;
	}

	public void setLike_check(int like_check) {
		this.like_check = like_check;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "LiketoVO [likeno=" + likeno + ", bno=" + bno + ", like_check=" + like_check + ", user_id=" + user_id
				+ "]";
	}
	
	
	
	
	
}
