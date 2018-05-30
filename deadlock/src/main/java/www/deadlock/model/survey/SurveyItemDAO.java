package www.deadlock.model.survey;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SurveyItemDAO implements ISurveyItemDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	@Override
	public int numread(String id) throws Exception{
		int numvalue = 0;
		
		numvalue = mybatis.selectOne("survey.numread",id);
		
		return numvalue;
	}
	
	@Override
	public int gender_man(int num) throws Exception {
		int count = 0;
		count = mybatis.selectOne("survey.man",num);
		return count;
	}
	
	@Override
	public int gender_woman(int num) throws Exception {
		int count = 0;
		count = mybatis.selectOne("survey.woman",num);
		return count;
	}
	
	@Override
	public boolean dupSurvey(String id) throws Exception {
		boolean flag = false;
		int cnt = mybatis.selectOne("survey.dupSurvey",id);
		if(cnt>0)flag=true;
		return flag;
	}
	
	@Override
	public boolean surveyUpdate(String id) throws Exception {
		boolean flag = false;
		
		int cnt = mybatis.update("survey.surveyUpdate",id);
		if(cnt>0)flag=true;
		return flag;
	}
	
	@Override
	public int getCount(int num) throws Exception {
		return mybatis.selectOne("survey.getCount",num);
	}
	@Override
	public int totalCount() throws Exception {
		return mybatis.selectOne("survey.totalCount");
	}

	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag = false;
		
		int cnt = mybatis.insert("survey.create",dto);
		if(cnt>0) flag=true;
		
		return flag;
	}
	@Override
	public Object read(Object pk) throws Exception {
		
		return mybatis.selectOne("survey.read",pk);
	}

	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public boolean update(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}



}
