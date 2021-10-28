package com.gf.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gf.example.domain.Answer;
import com.gf.example.domain.Example;
import com.gf.example.domain.Question;
import com.gf.example.domain.Result;
import com.gf.example.domain.Survey;
import com.gf.example.domain.User;

@Mapper
public interface SurveyMapper {
	public List<Survey> selectSurveyListAll();
	
	public List<Survey> selectSurveyList(User user);
	
	public void saveSurvey(Survey survey);
	
	public void saveQuestion(Survey survey);
	
	public void saveExample(Survey survey);
	
	public Survey getSurvey(Survey survey);
	
	public List<Question> getQuestion(Survey survey);
	
	public List<Example> getExample(Survey survey);
	
	public void deleteQuestion(Question question);
	
	public void deleteExampleWithQuestion(Question question);
	
	public void deleteExample(Example example);
	
	public void deleteSurvey(Survey survey);
	
	public void deleteQuestionWithSurvey(Survey survey);
	
	public void deleteExampleWithSurvey(Survey survey);
	
	public void saveAnswerNum(Answer answer);
	
	public void saveAnswerString(Answer answer);
	
	public List<Result> getResultNum(Survey survey);
	
	public List<Result> getResultString(Survey survey);
	
	public List<Result> getResultNum2(Survey survey);
	
	public List<Result> getResultString2(Survey survey);
	
}
