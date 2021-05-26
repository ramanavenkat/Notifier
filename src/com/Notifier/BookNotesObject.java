package com.Notifier;

import java.util.Date;

public class BookNotesObject {
	private int id;
	private String name;
	private Date sDate;
	private String status;
	private String des;
	private Date eDate;
	private Date rDate;
	private String tag;

	public BookNotesObject(int id,String name,Date sDate,Date eDate,Date rDate,String status,String tag,String des){
		this.id=id;
		this.name=name;
		this.sDate=sDate;
		this.eDate=eDate;
		this.rDate=rDate;
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

	public Date getsDate() {
		return sDate;
	}

	public void setsDate(Date sDate) {
		this.sDate = sDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date geteDate() {
		return eDate;
	}

	public void seteDate(Date eDate) {
		this.eDate = eDate;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}
	
	
}
