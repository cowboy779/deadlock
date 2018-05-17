package www.deadlock.model.qbbs;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

 

@Repository
public class QbbsDAO implements IQbbsDAO{ 
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}


	public void upcount(int qnum){
		mybatis.update("qbbs.upcount",qnum);
	}
	

	public Object read(Object qnum) {
		return mybatis.selectOne("qbbs.read", qnum);
	}
	
	
	public boolean create(Object dto){
		
		boolean flag=false;
		int cnt=mybatis.insert("qbbs.create", dto);
		if(cnt>0) flag=true;
		return flag;
	}
	
	
	public boolean update(Object dto){
		boolean flag=false;
		int cnt=mybatis.update("qbbs.update", dto);
		if(cnt>0) flag=true;
		
		return flag;
	}
	
	
	public boolean delete(Object qnum){
		boolean flag=false;
		int cnt=mybatis.delete("qbbs.delete", qnum);
		if(cnt>0) flag=true;
		
		return flag;
	}
	
	
	public int total(Map map) {
		return mybatis.selectOne("qbbs.total", map);
	}
	
	
	public List<QbbsDTO> list(Map map) {
		List<QbbsDTO> list = mybatis.selectList("qbbs.list", map);
		return list;
	}
	

}
