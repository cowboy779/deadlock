package www.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;

import www.mybatis.MyAppSqlConfig;

public class YrecoDAO {

	private static SqlSessionFactory sqlMapper;
	
	static{

		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
	}
  
	public boolean create(YrecoDTO dto){
		boolean flag = false;
		int cnt = sqlMapper.openSession().insert("yreco.create",dto);
		if(cnt>0)flag=true;
		return flag;
	}
	
	
	public YrecoDTO read(int yrenum){
		return sqlMapper.openSession().selectOne("yreco.read",yrenum);
	}
	
	public boolean update(YrecoDTO dto){
		boolean flag = false;
		int cnt = sqlMapper.openSession().update("yreco.update",dto);
		if(cnt>0)flag=true;
		return flag;
	}
	
	public boolean delete(int yrenum){
		boolean flag = false;
		int cnt = sqlMapper.openSession().delete("yreco.delete",yrenum);
		if(cnt>0)flag=true;
		return flag;
	}
	
	public List<YrecoDTO> list(Map map){
		return sqlMapper.openSession().selectList("yreco.list",map);
	}
	
	public int total(Map map){
		return sqlMapper.openSession().selectOne("yreco.total",map);
	}
	
}





