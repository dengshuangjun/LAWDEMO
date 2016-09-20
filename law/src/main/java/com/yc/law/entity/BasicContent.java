package com.yc.law.entity;

import java.io.Serializable;

/**
 * 页面进入的最基本的分页展示对象，可适当添加一些属性，不可删除属性
 * @author shuang
 *
 */
public class BasicContent implements Serializable{
	private static final long serialVersionUID = -3894438899551845963L;
	private Integer nid;
	private String title;
	private String ndate;
	public Integer getNid() {
		return nid;
	}
	public void setNid(Integer nid) {
		this.nid = nid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNdate() {
		return ndate;
	}
	public void setNdate(String ndate) {
		this.ndate = ndate.substring(0, 10);
	}
	@Override
	public String toString() {
		return "BasicContent [nid=" + nid + ", title=" + title + ", ndate="
				+ ndate + "]";
	}
	
	
}
