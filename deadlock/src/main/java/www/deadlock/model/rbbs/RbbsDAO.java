package www.deadlock.model.rbbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

@Repository
public class RbbsDAO implements IrbbsDAO{

	@Autowired
	private static SqlSessionTemplate mybatis;
	
	
	public static void setMybatis(SqlSessionTemplate mybatis) {
		RbbsDAO.mybatis = mybatis;
	}

	public static SqlSessionTemplate getMybatis() {
		return mybatis;
	}

	public Object read(Object bbsno) {
		
		

		return mybatis.selectOne("rbbs.read", bbsno);
	}

	public List list(Map map) {
		
		List list =  mybatis.selectList("rbbs.list", map);

		return list;
	}

	public boolean create(Object dto) {
		boolean flag = false;


		int cnt = mybatis.insert("rbbs.create", dto);
		System.out.println(cnt);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	public boolean delete(Object rnum) {
		boolean flag = false;


		int cnt = mybatis.insert("rbbs.delete", rnum);

		if (cnt > 0)
			flag = true;

		return flag;
	}

	public boolean update(Object dto) {
		boolean flag = false;

		int cnt = mybatis.insert("rbbs.update", dto);

		if (cnt > 0)
			flag = true;

		return flag;
	}
	
	public int total(Map map){
		
		// map에 sno eno col word포함 되어있어야함
		
		int total;

		total = (Integer)mybatis.selectOne("rbbs.total", map);
	
		return total;
	}
	
	public boolean upViewCount(int rnum){
		boolean flag = false;

		
		int cnt  = mybatis.update("rbbs.upviewcount", rnum);
		
	
		if(cnt>0) flag=true;
		
		return flag;
	}


	public boolean createReply(RbbsDTO dto) {
		boolean flag = false;
		
		
		int cnt = mybatis.insert("rbbs.createReply",dto);
		
		if(cnt>0) flag=true;
		
		return flag;
	}

	
}
