package com.green.ffee.event.vo;

import java.sql.Date;

public class EventVO {
	private int eno;
	private String title;
	private Date eventday;
	private Date eventday2;
	private String content;
	private String writer;
	private Date regdate;

	
	//슬라이드 이미지 컬럼 추가 (타이틀 / 해시태그)
	private String hashtag;
	private String slide_title;
	
	public EventVO() {
		
	}

	public EventVO(int eno, String title, Date eventday, Date eventday2, String content, String writer, Date regdate,
			String hashtag, String slide_title) {

		this.eno = eno;
		this.title = title;
		this.eventday = eventday;
		this.eventday2 = eventday2;
		this.content = content;
		this.writer = writer;
		this.regdate = regdate;
		this.hashtag = hashtag;
		this.slide_title = slide_title;
	}

	public int getEno() {
		return eno;
	}

	public void setEno(int eno) {
		this.eno = eno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getEventday() {
		return eventday;
	}

	public void setEventday(Date eventday) {
		this.eventday = eventday;
	}

	public Date getEventday2() {
		return eventday2;
	}

	public void setEventday2(Date eventday2) {
		this.eventday2 = eventday2;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public String getSlide_title() {
		return slide_title;
	}

	public void setSlide_title(String slide_title) {
		this.slide_title = slide_title;
	}

	@Override
	public String toString() {
		return "EventVO [eno=" + eno + ", title=" + title + ", eventday=" + eventday + ", eventday2=" + eventday2
				+ ", content=" + content + ", writer=" + writer + ", regdate=" + regdate + ", hashtag=" + hashtag
				+ ", slide_title=" + slide_title + "]";
	}
	
	
}
