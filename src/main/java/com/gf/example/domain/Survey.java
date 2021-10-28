package com.gf.example.domain;

import java.util.List;

public class Survey {
	private int sNo;
	private String sTitle;
	private int sMaster;
	private String sDatetime;
	
	List<Item> itemlist;
	List<Question> questionlist;
	List<Example> examplelist;
	
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public String getsTitle() {
		return sTitle;
	}
	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}
	public int getsMaster() {
		return sMaster;
	}
	public void setsMaster(int sMaster) {
		this.sMaster = sMaster;
	}
	public String getsDatetime() {
		return sDatetime;
	}
	public void setsDatetime(String sDatetime) {
		this.sDatetime = sDatetime;
	}
	public List<Item> getItemlist() {
		return itemlist;
	}
	public void setItemlist(List<Item> itemlist) {
		this.itemlist = itemlist;
	}
	public List<Question> getQuestionlist() {
		return questionlist;
	}
	public void setQuestionlist(List<Question> questionlist) {
		this.questionlist = questionlist;
	}
	public List<Example> getExamplelist() {
		return examplelist;
	}
	public void setExamplelist(List<Example> examplelist) {
		this.examplelist = examplelist;
	}
}
