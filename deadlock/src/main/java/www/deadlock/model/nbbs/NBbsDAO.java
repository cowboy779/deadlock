package www.deadlock.model.nbbs;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class NBbsDAO implements INBbsDAO{
	
	@Autowired
	private SqlSessionTemplate myBatis;

	
   public void setMyBatis(SqlSessionTemplate myBatis) {
		this.myBatis = myBatis;
	}


//  interface 적요
	public List<NBbsDTO> list(Map map) {
		List<NBbsDTO> list = myBatis.selectList("nbbs.list", map);
		return list;
	}
	
	public void upViewcnt(int nnum) {
		myBatis.update("nbbs.upViewcnt", nnum);
	}

	public int total(Map map) {
		int total = 0;
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		String sword = (String)map.get("sword");

		total  = myBatis.selectOne("nbbs.total",map);
		return total;
	}

	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag = false;
		int	cnt = myBatis.insert("nbbs.create", dto); 
		if(cnt>0) flag = true;
	
		return flag;
	}

	@Override
	public Object read(Object nnum) throws Exception {
		// TODO Auto-generated method stub
		return myBatis.selectOne("nbbs.read", nnum);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag = false;
		int	cnt = myBatis.update("nbbs.update", dto); 
		if(cnt>0) flag = true;
		return flag;
		
	}

	@Override
	public boolean delete(Object nnum) throws Exception {
		boolean flag = false;
		int cnt = myBatis.delete("nbbs.delete", nnum); 
		if(cnt>0) flag = true;

		return flag;
	}


	@Override
	public boolean passwdCheck(Map map) {
		boolean flag = false;
		int cnt = myBatis.selectOne("nbbs.passwdCheck", map); 
		if(cnt>0) flag = true;
		return flag;
	}
	
	//상단 고정
	public List<NBbsDTO> fixlist() {
		List<NBbsDTO> fixlist = myBatis.selectList("nbbs.fixlist");
		
		return fixlist;
	}
	
	//상단고정추가
	public boolean upfix(String[] arr) {
		boolean flag = false;
		delfix(); // 기존값 삭제
		
		int	cnt = 0;
		
		if(arr.length>0) {
		for(int i=0; i<arr.length; i++) {
			int nnum = Integer.parseInt(arr[i]);
			cnt = myBatis.update("nbbs.upfix", nnum);
			System.out.println("test: " + arr[i]);
		}
		
		if(cnt>0) {
			flag = true;
		}
		}
		return flag;
	}

	public int delfix() {
		return myBatis.update("nbbs.delfix"); 
	}
	
}





