package com.hybrid.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;

public class MyDate {
	int id;
	String name;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	Date current = new Date();
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getCurrent() {
		return current;
	}
	public void setCurrent(Date current) {
		this.current = current;
	}
	
}
