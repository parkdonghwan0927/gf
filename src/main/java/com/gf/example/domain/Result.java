package com.gf.example.domain;

public class Result {
	private int rIndex;
	private int rWriter;
	private String rWriterName;
	private String rKind;
	private String rQuestion;
	private String rExample1;
	private int rCount;
	private String rExample2;
	
	public int getrIndex() {
		return rIndex;
	}
	public void setrIndex(int rIndex) {
		this.rIndex = rIndex;
	}
	public String getrWriterName() {
		return rWriterName;
	}
	public void setrWriterName(String rWriterName) {
		this.rWriterName = rWriterName;
	}
	public int getrWriter() {
		return rWriter;
	}
	public void setrWriter(int rWriter) {
		this.rWriter = rWriter;
	}
	public String getrKind() {
		return rKind;
	}
	public void setrKind(String rKind) {
		this.rKind = rKind;
	}
	public String getrQuestion() {
		return rQuestion;
	}
	public void setrQuestion(String rQuestion) {
		this.rQuestion = rQuestion;
	}
	public String getrExample1() {
		return rExample1;
	}
	public void setrExample1(String rExample1) {
		this.rExample1 = rExample1;
	}
	public int getrCount() {
		return rCount;
	}
	public void setrCount(int rCount) {
		this.rCount = rCount;
	}
	public String getrExample2() {
		return rExample2;
	}
	public void setrExample2(String rExample2) {
		this.rExample2 = rExample2;
	}
	
	@Override
	public String toString() {
		return "Result [rIndex=" + rIndex + ", rWriter=" + rWriter + ", rWriterName=" + rWriterName + ", rKind=" + rKind
				+ ", rQuestion=" + rQuestion + ", rExample1=" + rExample1 + ", rCount=" + rCount + ", rExample2="
				+ rExample2 + "]";
	}

}
