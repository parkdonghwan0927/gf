package com.gf.example.controller;

import java.security.Principal;
import java.util.Collection;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gf.example.domain.Answer;
import com.gf.example.domain.Example;
import com.gf.example.domain.Question;
import com.gf.example.domain.Result;
import com.gf.example.domain.Survey;
import com.gf.example.domain.User;
import com.gf.example.service.SurveyService;
import com.gf.example.service.UserService;

@org.springframework.stereotype.Controller
public class Controller {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired SurveyService surveyservice;
	@Autowired UserService userservice;
	
	@RequestMapping("/")
	public String home(Model model, Principal principal) {
		logger.debug("debug");
	    logger.info("info");
	    logger.error("error");
	    
	    if(principal != null) {
		    User user = (User)((Authentication)principal).getPrincipal();
		    List<Survey> surveylist = surveyservice.selectSurveyList(user);
		    
		    model.addAttribute("surveylist", surveylist);	
	    }
	    
	    List<Survey> surveylistAll = surveyservice.selectSurveyListAll();
	    
	    model.addAttribute("surveylistall", surveylistAll);	
		
		return "/main";
	}
	
	@RequestMapping("/beforeSignUp") 
	public String beforeSignUp() {
		return "/signup";
	}
	
	@RequestMapping("/signup")
	   public String signup(User user) {
	      //비밀번호 암호화
	      String encodedPassword = new BCryptPasswordEncoder().encode(user.getPassword());
	      
	      //유저 데이터 세팅
	      user.setPassword(encodedPassword);
	      user.setAccountNonExpired(true);
	      user.setEnabled(true);
	      user.setAccountNonLocked(true);
	      user.setCredentialsNonExpired(true);
	      user.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER"));   
	      
	      //유저 생성
	      userservice.createUser(user);
	      //유저 권한 생성
	      userservice.createAuthorities(user);
	      
	      return "/login";
	   }
	
	@RequestMapping("/login")
	public String beforeLogin(Model model) {
		return "/login";
	}
	
	@Secured({"ROLE_ADMIN"})
	@RequestMapping("/admin")
	public String admin(Model model) {
		return "/admin";
	}
	   
   @Secured({"ROLE_USER"})
   @RequestMapping("/user/info")
   public String userInfo(Model model) {
      return "/user_info";
   }
   
   @RequestMapping("/denied")
   public String denied(Model model) {
      return "/denied";
   }
   
   @RequestMapping("/survey/make")
   public String surveyMake(Model model) {
      return "/makesurvey";
   }
   
   @RequestMapping("/survey/make/process")
   public String surveyMakeProcess(Model model, @RequestBody Survey survey, Principal principal) {
	  
	  User user = (User)((Authentication)principal).getPrincipal();
	  survey.setsMaster(user.getuNo());
	  surveyservice.saveSurvey(survey);
	  
	  List<Survey> surveylist = surveyservice.selectSurveyList(user);
	  model.addAttribute("surveylist", surveylist);
	  
      return "/main";
   }
   
   @RequestMapping("/survey/adjust/process")
   public String surveyAdjustProcess(Model model, @RequestBody Survey survey, Principal principal) {
	  
	  User user = (User)((Authentication)principal).getPrincipal();
	  survey.setsMaster(user.getuNo());
	  surveyservice.saveSurvey(survey);
	  surveyservice.deleteSurvey(survey);
	  
	  List<Survey> surveylist = surveyservice.selectSurveyList(user);
	  model.addAttribute("surveylist", surveylist);
	  
      return "/main";
   }
   
   @RequestMapping("/survey/read")
   public String surveyRead(Model model, Survey survey) {
	  Survey sv = surveyservice.getSurvey(survey);
	  model.addAttribute("sv", sv);
	  
      return "/readsurvey";
   }
   
   @RequestMapping("/survey/participate")
   public String surveyParticipate(Model model, Survey survey) {
	  Survey sv = surveyservice.getSurvey(survey);
	  model.addAttribute("sv", sv);
	  
      return "/participatesurvey";
   }
   
   @RequestMapping("/survey/participate/save")
   public String surveyParticipateSave(Model model, @RequestBody Answer answer) {
	  surveyservice.saveAnswer(answer);
	  
	  List<Survey> surveylistAll = surveyservice.selectSurveyListAll();
	  model.addAttribute("surveylistall", surveylistAll);	
		
	  return "/main";
   }
   
   @RequestMapping("/question/delete")
   public String deleteQuestionAndExample(Model model, Question question) { 
	  surveyservice.deleteQuestionAndExample(question);
	 	  
      return "/readsurvey";
   }
   
   @RequestMapping("/example/delete")
   public String deleteExample(Model model, Example example) { 
	  surveyservice.deleteExample(example);
	 	  
      return "/readsurvey";
   }  
   
   @RequestMapping("/survey/delete")
   public String deleteSurvey(Model model, Survey survey) { 
	  surveyservice.deleteSurvey(survey);
	 	  
      return "/main";
   }  
   
   @RequestMapping("/response/statistics")
   public String responseStatistics(Model model, Survey survey) { 
	  List<Result> resultlist = surveyservice.getResult(survey);
	  List<Result> resultlist2 = surveyservice.getResult(survey);
	  
	  int tmp = resultlist.get(0).getrIndex();
	  for(int i = 1; i < resultlist.size(); i++) {	
		  if(tmp == resultlist.get(i).getrIndex()) {
			  resultlist.remove(i);
			  i--;
		  } else {
			  tmp = resultlist.get(i).getrIndex();
		  }	  
	  }
	  
	  model.addAttribute("resultlist", resultlist);
	  model.addAttribute("resultlist2", resultlist2);
	  model.addAttribute("survey", survey);
	  
      return "/responsestatistics";
   }  
   
   @RequestMapping("/response/individual/list")
   public String responseIndividualList(Model model, Survey survey) { 
	   List<Result> resultlist = surveyservice.getResult(survey);
	  
	   
	   for(int i = 0; i < resultlist.size(); i++) {
		   int test = resultlist.get(i).getrWriter();
	 	
		   for(int j = i + 1; j < resultlist.size(); j++) {
			   if(resultlist.get(j).getrWriter() == test)
			   {
				   resultlist.remove(j);
				   j--;
			   }
		   }
	 	  
	   }
	   
	  model.addAttribute("resultlist", resultlist);
	  model.addAttribute("survey", survey);
	  
      return "/responseindividuallist";
   }
   
   @RequestMapping("/response/individual")
   public String responseIndividual(Model model, Survey survey) { 
	   List<Result> resultlist = surveyservice.getResult2(survey);
	   List<Result> resultlist2 = surveyservice.getResult2(survey);
	   
	   int tmp = resultlist.get(0).getrIndex();
	   	   for(int i = 1; i < resultlist.size(); i++) {	
			  if(tmp == resultlist.get(i).getrIndex()) {
				  resultlist.remove(i);
				  i--;
			  } else {
				  tmp = resultlist.get(i).getrIndex();
			  }	  
		  }
	   	   
	   model.addAttribute("resultlist", resultlist);
	   model.addAttribute("resultlist2", resultlist2);
	   	  
       return "/responseindividual";
   }
}

