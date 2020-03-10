package com.zz.entity;

import java.util.Date;

public class Log {

	private int logId;
	private String logName;
	private String logIntro;
	private String content;
	private String dateTime;
	private int userId;
	
	public int getLogId() {
		return logId;
	}
	public void setLogId(int logId) {
		this.logId = logId;
	}
	public String getLogName() {
		return logName;
	}
	public void setLogName(String logName) {
		this.logName = logName;
	}
	public String getLogIntro() {
		return logIntro;
	}
	public void setLogIntro(String logIntro) {
		this.logIntro = logIntro;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
}
