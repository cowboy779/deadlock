package www.deadlock.model.rbbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import www.mybatis.MyAppSqlConfig;

public class RbbsDAO {

	private static SqlSessionFactory sqlMapper;

	static {

		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
	}

	public RbbsDTO read(int bbsno) {

		return sqlMapper.openSession().selectOne("bbs.read", bbsno);
	}

	public List list(Map map) {

		return sqlMapper.openSession().selectList("bbs.list", map);
	}

	public boolean create(RbbsDTO dto) {
		boolean flag = false;
		SqlSession session = sqlMapper.openSession();

		int cnt = session.insert("bbs.create", dto);
		System.out.println(cnt);
		if (cnt > 0)
			flag = true;

		session.commit();
		session.close();

		return flag;
	}

	public boolean delete(int rnum) {
		boolean flag = false;
		SqlSession session = sqlMapper.openSession();

		int cnt = session.insert("bbs.delete", rnum);

		if (cnt > 0)
			flag = true;

		session.commit();
		session.close();

		return flag;
	}

	public boolean update(RbbsDTO dto) {
		boolean flag = false;
		SqlSession session = sqlMapper.openSession();

		int cnt = session.insert("bbs.update", dto);

		session.commit();
		session.close();
		if (cnt > 0)
			flag = true;

		return flag;
	}
	
	public int total(Map map){
		
		// map에 sno eno col word포함 되어있어야함
		
		int total;
		SqlSession session = sqlMapper.openSession();
		
		total = (Integer)session.selectOne("bbs.total", map);
		
		session.commit();
		session.close();
		
		return total;
	}
	
	public boolean upViewCount(int rnum){
		boolean flag = false;
		SqlSession session = sqlMapper.openSession();
		
		int cnt  = session.update("bbs.upviewcount", rnum);
		
		session.commit();
		session.close();
		if(cnt>0) flag=true;
		
		return flag;
	}
	
	public boolean passCheck(Map map){
		boolean flag = false;
//		Map map = new HashMap();
//		map.put("rnum", rnum);
//		map.put("id", id);
		
		// map에 id,rnum 포함
		
		SqlSession session = sqlMapper.openSession();
		
		int cnt  = session.selectOne("bbs.idcheck", map);
		
		session.commit();
		session.close();
		
		if(cnt>0)flag=true;
		
		
		return flag;
	}
	

	
}
