package www.deadlock.model.survey;

import java.util.Map;

import deadlock.DAOSTDInter;

public interface ISurveyItemDAO extends DAOSTDInter {

	int getCount(int num) throws Exception;

	int totalCount() throws Exception;
	
	boolean surveyUpdate(String id) throws Exception;
	
	boolean dupSurvey(String id) throws Exception;

	int gender_man(int num) throws Exception;

	int gender_woman(int num) throws Exception;

	int numread(String id) throws Exception;
}
