package www.deadlock.model.qbbs;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class QrecoDAO {
	private static SqlSessionTemplate mybatis;


	public QrecoDTO read(int qrenum) {

		return mybatis.selectOne("qreco.read", qrenum);
	}
	
	public boolean create(QrecoDTO dto){
		
		boolean flag=false;
		
		int cnt=mybatis.insert("qreco.create", dto);
	
		
		if(cnt>0) flag=true;

		return flag;
	}
	
	public boolean update(QrecoDTO dto){
		boolean flag=false;
		
		int cnt=mybatis.update("qreco.update", dto);

		if(cnt>0) flag=true;
		
		return flag;
	}
	
	public boolean delete(int qrenum){
		boolean flag=false;
		
		int cnt=mybatis.delete("qreco.delete", qrenum);

		if(cnt>0) flag=true;
		
		return flag;
	}
	
	public int total(Map map) {
		return mybatis.selectOne("qreco.total", map);
	}
	
	public List<QrecoDTO> list(Map map){
		
		return mybatis.selectList("qreco.list", map);
	}
	

}
