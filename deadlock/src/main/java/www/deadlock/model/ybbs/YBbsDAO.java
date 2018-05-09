package www.dao;




import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import www.mybatis.MyAppSqlConfig;

public class YBbsDAO {

	private static SqlSessionFactory sqlMapper;
	
	static{

		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
	}
   public YBbsDTO read(int ynum) {
		
		return sqlMapper.openSession().selectOne("ybbs.read", ynum);
	}
   
   public boolean create(YBbsDTO dto){
	   SqlSession session = sqlMapper.openSession();
	   boolean flag = false;
	   int cnt = session.insert("ybbs.create",dto);
	   if(cnt>0)flag=true;
	   session.commit();
	   session.close();
	   
	   return flag;
   }

	
	public boolean update(YBbsDTO dto){
		boolean flag = false;
		int cnt = sqlMapper.openSession().update("ybbs.update",dto);
		if(cnt>0)flag=true;
		return flag;
	}

	public boolean delete(int ynum){
		boolean flag = false;
		int cnt = sqlMapper.openSession().delete("ybbs.delete",ynum);
		if(cnt>0)flag=true;
		return flag;
	} 
   
	public List<YBbsDTO> list(Map map){
	
	return sqlMapper.openSession().selectList("ybbs.list", map);
	}
	
	
	public int total(Map map){
		
		return sqlMapper.openSession().selectOne("ybbs.total",map);
	}
	
}





