package www.deadlock.model.pbbs;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PBbsDAO implements IPBbsDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
   public boolean passwdCheck(Map map){
	   boolean flag = false;
	   int cnt = mybatis.selectOne("pbbs.passwdCheck", map);
	   if(cnt>0)flag=true;
	   return flag;
   }
	
   public PBbsDTO read(Object bnum) {
		
		return mybatis.selectOne("pbbs.read", bnum);
	}
   
   public boolean create(Object dto){
	   boolean flag = false;
	   int cnt = mybatis.insert("pbbs.create",dto);
	   if(cnt>0)flag=true;
	   return flag;
   }

	
	public boolean update(Object dto){
		boolean flag = false;
		int cnt = mybatis.update("pbbs.update",dto);
		if(cnt>0)flag=true;
		return flag;
	}

	public boolean delete(Object bnum){
		boolean flag = false;
		int cnt = mybatis.delete("pbbs.delete",bnum);
		if(cnt>0)flag=true;
		return flag;
	} 
   
	public List<PBbsDTO> list(Map map){
	return mybatis.selectList("pbbs.list", map);
	}
	
	public int total(Map map){	
		return mybatis.selectOne("pbbs.total",map);
	}
	

	
}





