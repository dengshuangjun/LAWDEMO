package com.yc.law.entity;

import java.io.Serializable;
import java.util.List;

public class BasicContentPage implements Serializable{
	
	private static final long serialVersionUID = 4753429506171945103L;
	private int total;
	private List<BasicContent> basicContents;
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<BasicContent> getBasicContents() {
		return basicContents;
	}
	public void setBasicContents(List<BasicContent> basicContents) {
		this.basicContents = basicContents;
	}
	@Override
	public String toString() {
		return "BasicContentPage [total=" + total + ", basicContents="
				+ basicContents + "]";
	}

	
}	
