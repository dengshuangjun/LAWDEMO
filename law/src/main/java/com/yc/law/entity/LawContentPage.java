package com.yc.law.entity;

import java.io.Serializable;
import java.util.List;

public class LawContentPage implements Serializable{
	private static final long serialVersionUID = 9200329963755355929L;
	private int page;
	private int rows;
	private int total;
	private List<Integer> partid;
	private List<LawContent> lawContents;
	private Integer nitid;
	private String time1;
	private String time2;
	private String title;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<Integer> getPartid() {
		return partid;
	}
	public void setPartid(List<Integer> partid) {
		this.partid = partid;
	}
	public List<LawContent> getLawContents() {
		return lawContents;
	}
	public void setLawContents(List<LawContent> lawContents) {
		this.lawContents = lawContents;
	}
	public Integer getNitid() {
		return nitid;
	}
	public void setNitid(Integer nitid) {
		if(nitid==-1){
			this.nitid =null;
		}else{
			this.nitid = nitid;

		}
	}
	public String getTime1() {
		return time1;
	}
	public void setTime1(String time1) {
		if(time1==""){
			this.time1=null;
		}else{
			this.time1 = time1;
		}
		
	}
	public String getTime2() {
		return time2;
	}
	public void setTime2(String time2) {
		if(time2==""){
			this.time2=null;
		}else{
			this.time2 = time2;
		}
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		if(title==""){
			this.title=null;
		}else{
			this.title = title;
		}
	}
	@Override
	public String toString() {
		return "LawContentPage [page=" + page + ", rows=" + rows + ", total="
				+ total + ", partid=" + partid + ", lawContents=" + lawContents
				+ ", nitid=" + nitid + ", time1=" + time1 + ", time2=" + time2
				+ ", title=" + title + "]";
	}
	
	
}
