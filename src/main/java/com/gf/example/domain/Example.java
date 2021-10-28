package com.gf.example.domain;

public class Example {
	private int eNo;
	private String eContent;
	private int eMaster;
	private int eIndex;
	
	public int geteNo() {
		return eNo;
	}
	public void seteNo(int eNo) {
		this.eNo = eNo;
	}
	public String geteContent() {
		return eContent;
	}
	public void seteContent(String eContent) {
		this.eContent = eContent;
	}
	public int geteMaster() {
		return eMaster;
	}
	public void seteMaster(int eMaster) {
		this.eMaster = eMaster;
	}
	public int geteIndex() {
		return eIndex;
	}
	public void seteIndex(int eIndex) {
		this.eIndex = eIndex;
	}
	@Override
	public String toString() {
		return "Example [eNo=" + eNo + ", eContent=" + eContent + ", eMaster=" + eMaster + ", eIndex=" + eIndex + "]";
	}
	
}
