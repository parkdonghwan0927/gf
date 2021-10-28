package com.gf.example.service;

import java.util.List;

import com.gf.example.domain.Answer;
import com.gf.example.domain.Example;
import com.gf.example.domain.Question;
import com.gf.example.domain.Result;
import com.gf.example.domain.Survey;
import com.gf.example.domain.User;

public interface SurveyService {
	public List<Survey> selectSurveyListAll();
	
	public List<Survey> selectSurveyList(User user);
	
	public void saveSurvey(Survey survey);
	
	public Survey getSurvey(Survey survey);
	
	public void deleteQuestionAndExample(Question question);
	
	public void deleteExample(Example example);
	
	public void deleteSurvey(Survey survey);
	
	public void saveAnswer(Answer answer);
	
	public List<Result> getResult(Survey survey);
	
	public List<Result> getResult2(Survey survey);
}

