package www.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import www.mybatis.MyAppSqlConfig;


public class QrecoDAO {
	private static SqlSessionFactory sqlMapper;

	static {

		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
	}
	

	public QrecoDTO read(int qrenum) {

		return sqlMapper.openSession().selectOne("qreco.read", qrenum);
	}
	
	public boolean create(QrecoDTO dto){
		
		boolean flag=false;
		
		int cnt;
		
		SqlSession session=sqlMapper.openSession();
				
		cnt=session.insert("qreco.create", dto);
		session.commit();
		session.close();
		
		if(cnt>0) flag=true;

		return flag;
	}
	
	public boolean update(QrecoDTO dto){
		boolean flag=false;
		
		int cnt;
		
		SqlSession session= sqlMapper.openSession();
		
		cnt=session.update("qreco.update", dto);
		session.commit();
		session.close();
		
		if(cnt>0) flag=true;
		
		return flag;
	}
	
	public boolean delete(int qrenum){
		boolean flag=false;
		
		int cnt;
		SqlSession session =sqlMapper.openSession();
		cnt=session.delete("qreco.delete", qrenum);
		session.commit();
		session.close();
		
		if(cnt>0) flag=true;
		
		return flag;
	}
	
	public int total(Map map) {
		return sqlMapper.openSession().selectOne("qreco.total", map);
	}
	
	public List<QrecoDTO> list(Map map){
		
		return sqlMapper.openSession().selectList("qreco.list", map);
	}
	

}
