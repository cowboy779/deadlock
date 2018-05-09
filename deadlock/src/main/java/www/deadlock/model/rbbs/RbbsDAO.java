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
	private static SqlSessionTemplate sqlMapper;

	
	public Object read(Object bbsno) {

		return sqlMapper.selectOne("bbs.read", bbsno);
	}

	public List list(Map map) {

		return sqlMapper.selectList("bbs.list", map);
	}

	public boolean create(Object dto) {
		boolean flag = false;


		int cnt = sqlMapper.insert("bbs.create", dto);
		System.out.println(cnt);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	public boolean delete(Object rnum) {
		boolean flag = false;


		int cnt = sqlMapper.insert("bbs.delete", rnum);

		if (cnt > 0)
			flag = true;

		return flag;
	}

	public boolean update(Object dto) {
		boolean flag = false;

		int cnt = sqlMapper.insert("bbs.update", dto);

		if (cnt > 0)
			flag = true;

		return flag;
	}
	
	public int total(Map map){
		
		// map에 sno eno col word포함 되어있어야함
		
		int total;

		total = (Integer)sqlMapper.selectOne("bbs.total", map);
	
		return total;
	}
	
	public boolean upViewCount(int rnum){
		boolean flag = false;

		
		int cnt  = sqlMapper.update("bbs.upviewcount", rnum);
		
	
		if(cnt>0) flag=true;
		
		return flag;
	}


	public boolean createReply(RbbsDTO dto) {
		boolean flag = false;
		
		return flag;
	}

	
}
