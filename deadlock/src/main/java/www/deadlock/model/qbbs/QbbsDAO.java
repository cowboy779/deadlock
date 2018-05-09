package www.deadlock.model.qbbs;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;



@Repository
public class QbbsDAO {
	private static SqlSessionTemplate mybatis;

	
	public void upcount(int qnum){
		mybatis.update("qbbs.upcount",qnum);
	}
	

	public QbbsDTO read(int qnum) {
		return mybatis.selectOne("qbbs.read", qnum);
	}
	
	
	public boolean create(QbbsDTO dto){
		
		boolean flag=false;
		int cnt=mybatis.insert("qbbs.create", dto);
		if(cnt>0) flag=true;
		
		return flag;
	}
	
	
	public boolean update(QbbsDTO dto){
		boolean flag=false;
		int cnt=mybatis.update("qbbs.update", dto);
		if(cnt>0) flag=true;
		
		return flag;
	}
	
	
	public boolean delete(int qnum){
		boolean flag=false;
		int cnt=mybatis.delete("qbbs.delete", qnum);
		if(cnt>0) flag=true;
		
		return flag;
	}
	
	
	public int total(Map map) {
		return mybatis.selectOne("qbbs.total", map);
	}
	
	
	public List<QbbsDTO> list(Map map){
		return mybatis.selectList("qbbs.list", map);
	}
	

}
