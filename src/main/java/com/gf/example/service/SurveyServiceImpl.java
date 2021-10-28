package com.gf.example.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gf.example.domain.Answer;
import com.gf.example.domain.Example;
import com.gf.example.domain.Question;
import com.gf.example.domain.Result;
import com.gf.example.domain.Survey;
import com.gf.example.domain.User;
import com.gf.example.mapper.SurveyMapper;

@Service("SurveyServiceImpl")
public class SurveyServiceImpl implements SurveyService{
	
	@Autowired SurveyMapper surveymapper;
	
	@Override
	public List<Survey> selectSurveyListAll() {
		return surveymapper.selectSurveyListAll();
	}
	
	@Override
	public List<Survey> selectSurveyList(User user) {
		return surveymapper.selectSurveyList(user);
	}
	
	@Override
	public void saveSurvey(Survey survey) {
		surveymapper.saveSurvey(survey);;
		surveymapper.saveQuestion(survey);
		surveymapper.saveExample(survey);
	}
	
	@Override
	public Survey getSurvey(Survey survey) {
		Survey resultSurvey = surveymapper.getSurvey(survey);
		resultSurvey.setQuestionlist(surveymapper.getQuestion(survey));
		resultSurvey.setExamplelist(surveymapper.getExample(survey));
		return resultSurvey;
	}
	
	@Override
	public void deleteQuestionAndExample(Question question) {
		surveymapper.deleteQuestion(question);
		surveymapper.deleteExampleWithQuestion(question);
	}
		
	@Override
	public void deleteExample(Example example) {
		surveymapper.deleteExample(example);
	}
	
	@Override
	public void deleteSurvey(Survey survey) {
		surveymapper.deleteSurvey(survey);
		surveymapper.deleteQuestionWithSurvey(survey);
		surveymapper.deleteExampleWithSurvey(survey);
	}		
	
	@Override
	public void saveAnswer(Answer answer) {
	
		if(answer.getAnswernumlist().size() != 0) {
			surveymapper.saveAnswerNum(answer);
		}
		
		if(answer.getAnswerstringlist().size() != 0) {
			surveymapper.saveAnswerString(answer);
		}
	}	
	
	@Override
	public List<Result> getResult(Survey survey) {
		List<Result> tmpList = new ArrayList<>(surveymapper.getResultNum(survey));
		tmpList.addAll(surveymapper.getResultString(survey));
		
		return tmpList;
	}
	
	@Override
	public List<Result> getResult2(Survey survey) {
		List<Result> tmpList = new ArrayList<>(surveymapper.getResultNum2(survey));
		tmpList.addAll(surveymapper.getResultString2(survey));
		
		return tmpList;
	}	

}
