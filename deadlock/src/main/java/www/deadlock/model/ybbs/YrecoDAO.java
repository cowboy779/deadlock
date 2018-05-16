package www.deadlock.model.ybbs;

import java.util.List;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class YrecoDAO implements IYrecoDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	/*Test용*/
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
  
	public boolean create(Object dto){
		boolean flag = false;
		int cnt = mybatis.insert("yreco.create",dto);
		if(cnt>0)flag=true;
		return flag;
	}
	
	
	public YrecoDTO read(Object yrenum){
		return mybatis.selectOne("yreco.read",yrenum);
	}
	
	public boolean update(Object dto){
		boolean flag = false;
		int cnt = mybatis.update("yreco.update",dto);
		if(cnt>0)flag=true;
		return flag;
	}
	
	public boolean delete(Object yrenum){
		boolean flag = false;
		int cnt = mybatis.delete("yreco.ydelete",yrenum);
		if(cnt>0)flag=true;
		return flag;
	}
	
	public List list(Map map){
		return mybatis.selectList("yreco.ylist",map);
	}
	
	public int total(Map map){
		return mybatis.selectOne("yreco.total",map);
	}
	
}





