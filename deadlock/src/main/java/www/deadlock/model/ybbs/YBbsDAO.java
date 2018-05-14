package www.deadlock.model.ybbs;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class YBbsDAO implements IYBbsDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
   public YBbsDTO read(Object ynum){
		
		return mybatis.selectOne("ybbs.read", ynum);
	}
   
   public boolean create(Object dto){
	   
	   boolean flag = false;
	   int cnt = mybatis.insert("ybbs.create",dto);
	   if(cnt>0)flag=true;

	   return flag;
   }

	
	public boolean update(Object dto){
		boolean flag = false;
		int cnt = mybatis.update("ybbs.update",dto);
		if(cnt>0)flag=true;
		return flag;
	}

	public boolean delete(Object ynum){
		boolean flag = false;
		System.out.println("dao의 ynum:"+ynum);
		int cnt = mybatis.delete("ybbs.delete",ynum);
		System.out.println("dao cnt:"+cnt);
		if(cnt>0)flag=true;
		return flag;
	} 
   
	public List<YBbsDTO> list(Map map){
	
	return mybatis.selectList("ybbs.list", map);
	}
	
	public void ycount(int ynum){
		mybatis.update("ybbs.ycount",ynum);
	}
	
	
	public int total(Map map){
		
		return mybatis.selectOne("ybbs.total",map);
	}
	
	
}





