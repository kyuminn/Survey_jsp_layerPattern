package survey.service;

import java.util.List;

import survey.dao.SurveyDao;
import survey.vo.SurveyVo;

public class SurveyService {
	private SurveyDao surveyDao;
	
	public SurveyService(SurveyDao surveydao) {
		this.surveyDao=surveydao;
	}
	
	// country 에 해당하는 나라의  count=count+1
	public boolean vote(String country) {
		return surveyDao.vote(country);
	}
	
	public List<SurveyVo> selectAll(){
		return surveyDao.selectAll();
	}
	
	// DB에 없는 나라이름 입력했을 때 새로운 행 추가, count 1로 설정
	public boolean initializeNewItem(String country) {
		return surveyDao.initializeNewItem(country);
	}
	
	// DB에 있는 나라이름 가져오기
	public List<String> selectCountry(){
		return surveyDao.selectCountry();
	}
	
	// 설문 취소
	public boolean revoke(String country) {
		return surveyDao.revoke(country);
	}
	
	// country 값에 해당하는 id값 가져오기
	public int selectCountByCountry(String country) {
		return surveyDao.selectCountByCountry(country);
	}
	
	// 새로 추가한 행 중에 count 값이 0이면 삭제하기
	public boolean deleteZeroValue(String country) {
		return surveyDao.deleteZeroValue(country);
	}
}
