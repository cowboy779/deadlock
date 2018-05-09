package www.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import www.mybatis.MyAppSqlConfig;


public class NBbsDAO {
	
	private static SqlSessionFactory sqlMapper;
	
	static{
		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
	}
	
   public NBbsDTO read(int nnum) {	
	   //jsp에서 세션확인
		return sqlMapper.openSession().selectOne("nbbs.read", nnum);
	}
   
	public boolean create(NBbsDTO dto) {
		boolean flag = false;
		int cnt;
		
		SqlSession session = sqlMapper.openSession();
		try { 
			//세션 등급확인
			cnt = session.insert("nbbs.create", dto); 
		} finally { 
			session.commit(); session.close(); 
		}
		if(cnt>0) flag = true;
		
		return flag;
	}
	
	public List<NBbsDTO> list(Map map) {
		List<NBbsDTO> list = sqlMapper.openSession().selectList("nbbs.list", map);
		return list;
	}
	
	public boolean update(NBbsDTO dto) {
		boolean flag = false;
		int cnt;
		SqlSession session = sqlMapper.openSession();
		try { 
			//세션등급확인
			cnt = session.update("nbbs.update", dto); 
		} finally { 
			session.commit(); session.close(); 
		}
		if(cnt>0) flag = true;

		return flag;
	}

	public boolean delete(int nnum) {
		
		boolean flag = false;
		int cnt;
		SqlSession session = sqlMapper.openSession();
		try { 
			//세션 등급확인
			cnt = session.delete("nbbs.delete", nnum); 
		} finally { 
			session.commit(); session.close(); 
		}
		if(cnt>0) flag = true;

		return flag;
	}

	
}





