package www.deadlock.model.cbbs;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;


public class CbbsDAO {
	
	SqlSessionTemplate mybatis;
	
	
   public CbbsDTO read(int cnum) {
		return mybatis.selectOne("cbbs.read", cnum);
	}
   
   public boolean create(CbbsDTO dto) {
	   boolean flag=false;
	   
	   int cnt=mybatis.insert("cbbs.create",dto);
	   
	   if(cnt>0) flag=true;
	   
	   return flag;
   }
   
   public boolean update(CbbsDTO dto) {
	   boolean flag=false;
	   
	   int cnt=mybatis.update("cbbs.update", dto);
	   
	   if(cnt>0) flag=true;
	   
	   return flag;
   }
   
   public boolean delete(int cnum) {
	   boolean flag=false;
	   
	   int cnt=mybatis.delete("cbbs.delete", cnum);
	   
	   if(cnt>0) flag=true;
	   
	   return flag;
   }

   public List list(Map map) {
	   List list=mybatis.selectList("cbbs.list", map);
	
	return list;
   }

   public int total(Map map) {
	   int total=mybatis.selectOne("cbbs.total", map);
	   
	return total;
   }

   public void upccount(int cnum) {
	   mybatis.update("cbbs.upccount", cnum);
	
   }
   

}
