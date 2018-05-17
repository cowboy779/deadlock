package www.deadlock.model.cbbs;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import www.mybatis.MyAppSqlConfig;




public class CbbsDAO {
	
private static SqlSessionFactory sqlMapper;
	
	static{
		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
	}
	
	
	
	
	
	
	
   public CbbsDTO read(int cnum) {
		return sqlMapper.openSession().selectOne("cbbs.read", cnum);
	}
   
   
   public boolean create(CbbsDTO dto) {
	   SqlSession session=sqlMapper.openSession();
	   
	   boolean flag=false;
	   
	   int cnt=session.insert("cbbs.create",dto);
	   
	   if(cnt>0) flag=true;
	   
	   session.commit();
	   session.close();
	   
	   return flag;
   }
   
   public boolean update(CbbsDTO dto) {
	   boolean flag=false;
	   SqlSession session=sqlMapper.openSession();
	   
	   int cnt=session.update("cbbs.update", dto);
	   
	   session.commit();
	   session.close();
	   
	   if(cnt>0) flag=true;
	   
	   return flag;
   }
   
   public boolean delete(int cnum) {
	   boolean flag=false;
	   SqlSession session=sqlMapper.openSession();
	   int cnt=session.delete("cbbs.delete", cnum);
	   
	   if(cnt>0) flag=true;
	   
	   session.commit();
	   session.close();
	   
	   return flag;
   }

   public List list(Map map) {
	   SqlSession session=sqlMapper.openSession();
	   List list=session.selectList("cbbs.list", map);
	  
	   session.commit();
	   session.close();
	   
	
	return list;
}

   public int total(Map map) {
	   SqlSession session=sqlMapper.openSession();
	   int total=session.selectOne("cbbs.total", map);
	   
	   session.commit();
	   session.close();
	   
	return total;
}

   public void upccount(int cnum) {
	   SqlSession session=sqlMapper.openSession();
	   session.update("cbbs.upccount", cnum);
	   
	   session.commit();
	   session.close();
	
   }
   

}
