package www.deadlock.model.qbbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class QrecoDAO implements IQrecoDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	
	

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	public Object read(Object qrenum) {

		return mybatis.selectOne("qreco.read", qrenum);
	}
	
	public boolean create(Object dto){
		
		boolean flag=false;
		
		int cnt=mybatis.insert("qreco.create", dto);
	
		
		if(cnt>0) flag=true;

		return flag;
	}
	
	public boolean update(Object dto){
		boolean flag=false;
		
		int cnt=mybatis.update("qreco.update", dto);

		if(cnt>0) flag=true;
		
		return flag;
	}
	
	public boolean delete(Object qrenum){
		boolean flag=false;
		
		int cnt=mybatis.delete("qreco.delete", qrenum);

		if(cnt>0) flag=true;
		
		return flag;
	}
	
	public int qdelete(int qnum) throws Exception{
		return mybatis.delete("qreco.qdelete", qnum);
	}
	
	public int total(Map map) {
		return mybatis.selectOne("qreco.total", map);
	}
	
	public List<QrecoDTO> list(Map map){
	
		List list =mybatis.selectList("qreco.list", map);
		return list;
	}
	

}
