package survey.dao;

import java.util.List;

import survey.vo.SurveyVo;

public interface SurveyDao {
	public boolean vote(String country);
	public List<SurveyVo> selectAll();
	public void initializeNewItem (String country);
	public List<String> selectCountry();
	public void revoke(String country);
}
