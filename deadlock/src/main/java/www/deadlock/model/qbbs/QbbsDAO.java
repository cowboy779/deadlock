package www.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import www.mybatis.MyAppSqlConfig;


public class QbbsDAO {
	private static SqlSessionFactory sqlMapper;

	static {

		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
	}
	
	
	
	public void upcount(int qnum){
		
		SqlSession session=sqlMapper.openSession();
		session.update("qbbs.upcount",qnum);
		
		session.commit();
		session.close();
	}
	

	public QbbsDTO read(int qnum) {

		return sqlMapper.openSession().selectOne("qbbs.read", qnum);
	}
	
	public boolean create(QbbsDTO dto){
		
		boolean flag=false;
		
		int cnt;
		
		SqlSession session=sqlMapper.openSession();
				
		cnt=session.insert("qbbs.create", dto);
		session.commit();
		session.close();
		
		if(cnt>0) flag=true;

		return flag;
	}
	
	public boolean update(QbbsDTO dto){
		boolean flag=false;
		
		int cnt;
		
		SqlSession session= sqlMapper.openSession();
		
		cnt=session.update("qbbs.update", dto);
		session.commit();
		session.close();
		
		if(cnt>0) flag=true;
		
		return flag;
	}
	
	public boolean delete(int qnum){
		boolean flag=false;
		
		int cnt;
		SqlSession session =sqlMapper.openSession();
		cnt=session.delete("qbbs.delete", qnum);
		session.commit();
		session.close();
		
		if(cnt>0) flag=true;
		
		return flag;
	}
	
	public int total(Map map) {
		return sqlMapper.openSession().selectOne("qbbs.total", map);
	}
	
	public List<QbbsDTO> list(Map map){
		
		return sqlMapper.openSession().selectList("qbbs.list", map);
	}
	

}
