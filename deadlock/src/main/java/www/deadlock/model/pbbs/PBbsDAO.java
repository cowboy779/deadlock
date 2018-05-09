package www.deadlock.model.pbbs;

import java.util.List;
import java.util.Map;

public class PBbsDAO {

	private static SqlSessionFactory sqlMapper;
	
	static{

		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
	}
	
   public boolean passwdCheck(Map map){
	   boolean flag = false;
	   int cnt = sqlMapper.openSession().selectOne("pbbs.passwdCheck", map);
	   if(cnt>0)flag=true;
	   return flag;
   }
	
   public PBbsDTO read(int bnum) {
		
		return sqlMapper.openSession().selectOne("pbbs.read", bnum);
	}
   
   public boolean create(PBbsDTO dto){
	   SqlSession session = sqlMapper.openSession();
	   boolean flag = false;
	   int cnt = session.insert("pbbs.create",dto);
	   if(cnt>0)flag=true;
	   session.commit();
	   session.close();
	   
	   return flag;
   }

	
	public boolean update(PBbsDTO dto){
		boolean flag = false;
		int cnt = sqlMapper.openSession().update("pbbs.update",dto);
		if(cnt>0)flag=true;
		return flag;
	}

	public boolean delete(int bnum){
		boolean flag = false;
		int cnt = sqlMapper.openSession().delete("pbbs.delete",bnum);
		if(cnt>0)flag=true;
		return flag;
	} 
   
	public List<PBbsDTO> list(Map map){
	
	return sqlMapper.openSession().selectList("pbbs.list", map);
	}
	
	
	public int total(Map map){
		
		return sqlMapper.openSession().selectOne("pbbs.total",map);
	}
	

	
}





