package com.gf.example.domain;

public class Question {
	private int qNo;
	private String qKind;
	private String qContent;
	private int qMaster;
	private int qIndex;
	
	public int getqNo() {
		return qNo;
	}
	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	public String getqKind() {
		return qKind;
	}
	public void setqKind(String qKind) {
		this.qKind = qKind;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
	}
	public int getqMaster() {
		return qMaster;
	}
	public void setqMaster(int qMaster) {
		this.qMaster = qMaster;
	}
	public int getqIndex() {
		return qIndex;
	}
	public void setqIndex(int qIndex) {
		this.qIndex = qIndex;
	}
	@Override
	public String toString() {
		return "Question [qNo=" + qNo + ", qKind=" + qKind + ", qContent=" + qContent + ", qMaster=" + qMaster
				+ ", qIndex=" + qIndex + "]";
	}
}
