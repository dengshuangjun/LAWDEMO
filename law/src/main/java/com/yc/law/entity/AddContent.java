package com.yc.law.entity;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

/**
 * 这是一个用来添加法律内容的类
 * @author shuang
 *
 */
public class AddContent implements Serializable{
	
	private static final long serialVersionUID = -3184167770460019708L;
	private int nitid;
	private int partid;
	private String title;
	private int weight;
	private String content;
	private String author;
	private String flag;
	private int usid;
	public int getNitid() {
		return nitid;
	}
	public void setNitid(int nitid) {
		if(nitid<0){
			nitid=0;
		}
		this.nitid = nitid;
	}
	public int getPartid() {
		return partid;
	}
	public void setPartid(int partid) {
		this.partid = partid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public int getUsid() {
		return usid;
	}
	public void setUsid(int usid) {
		this.usid = usid;
	}
	@Override
	public String toString() {
		return "AddContent [nitid=" + nitid + ", partid=" + partid + ", title="
				+ title + ", weight=" + weight + ", content=" + content
				+ ", author=" + author + ", flag=" + flag + ", usid=" + usid
				+ "]";
	}
	
}
