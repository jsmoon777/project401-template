package com.green.ffee.event.vo;

import java.sql.Date;

public class EventVO {
	private int eno;
	private String title;
	private String eventday;
	private String content;
	private String writer;
	private Date regdate;

	public EventVO() {
		
	}

	public EventVO(int eno, String title, String eventday, String content, String writer, Date regdate) {
		super();
		this.eno = eno;
		this.title = title;
		this.eventday = eventday;
		this.content = content;
		this.writer = writer;
		this.regdate = regdate;
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

	public String getEventday() {
		return eventday;
	}

	public void setEventday(String eventday) {
		this.eventday = eventday;
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

	@Override
	public String toString() {
		return "EventVO [eno=" + eno + ", title=" + title + ", eventday=" + eventday + ", content=" + content
				+ ", writer=" + writer + ", regdate=" + regdate + "]";
	}
	
	
}
