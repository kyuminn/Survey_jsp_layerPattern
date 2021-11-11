package survey.service;

import java.util.List;

import survey.dao.SurveyDao;
import survey.vo.SurveyVo;

public class SurveyService {
	private SurveyDao surveyDao;
	
	public SurveyService(SurveyDao surveydao) {
		this.surveyDao=surveydao;
	}
	
	public boolean vote(String country) {
		return surveyDao.vote(country);
	}
	
	public List<SurveyVo> selectAll(){
		return surveyDao.selectAll();
	}
	
	public void initializeNewItem(String country) {
		surveyDao.initializeNewItem(country);
	}
	
	public List<String> selectCountry(){
		return surveyDao.selectCountry();
	}
	
	public void revoke(String country) {
		surveyDao.revoke(country);
	}
}
