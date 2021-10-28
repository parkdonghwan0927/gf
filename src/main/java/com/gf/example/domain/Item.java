package com.gf.example.domain;

import java.util.List;

public class Item {
	private Question question;
	private List<Example> examplelist;
	
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	public List<Example> getExamplelist() {
		return examplelist;
	}
	public void setExamplelist(List<Example> examplelist) {
		this.examplelist = examplelist;
	}
	@Override
	public String toString() {
		return "Item [question=" + question + ", examplelist=" + examplelist + "]";
	}

}
