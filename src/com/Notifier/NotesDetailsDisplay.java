package com.Notifier;

import java.util.Date;

public class NotesDetailsDisplay {
	private String name;
	private Date sdate;
	private Date edate;
	private Date rdate;
	private String status;
	private String tag;
	private String des;
	

	public NotesDetailsDisplay(String name,Date sdate,Date edate,Date rdate,String status,String tag,String des){
		this.name=name;
		this.sdate=sdate;
		this.edate=edate;
		this.rdate=rdate;
		this.status=status;
		this.tag=tag;
		this.des=des;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	public Date getEdate() {
		return edate;
	}

	public void setEdate(Date edate) {
		this.edate = edate;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	
	
}
