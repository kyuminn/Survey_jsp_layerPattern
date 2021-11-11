package survey.dao;

import java.util.List;

import survey.vo.SurveyVo;

public interface SurveyDao {
	public boolean vote(String country);
	public List<SurveyVo> selectAll();
	public boolean initializeNewItem(String country);
	public List<String> selectCountry();
	public boolean revoke(String country);
	public int selectCountByCountry(String country);
	public boolean deleteZeroValue(String country);
}
