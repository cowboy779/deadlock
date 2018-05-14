package www.deadlock.model.chat;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Chat_MessageDAO implements IChat_MessageDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	@Override
	public String getRealTime() throws Exception {
		String realtime = "";
		
		realtime = mybatis.selectOne("chat.getRealTime");
		
		return realtime;
	}
	
	
	@Override
	public boolean create(Object chat_index) throws Exception {
		boolean flag = false;
		int cnt = mybatis.insert("chat.create_content",chat_index);
		if(cnt>0) {
			flag = true;
		}
		return flag;
	}
	
	@Override
	public Object read(Object chat_index) throws Exception {
		Chat_MessageDTO dto = mybatis.selectOne("chat.read_content",chat_index);
		return dto;
	}

	

	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public boolean update(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
