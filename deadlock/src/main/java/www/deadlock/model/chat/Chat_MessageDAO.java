package www.deadlock.model.chat;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

public class Chat_MessageDAO {
	
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public boolean create(int chat_message_index) {
		boolean flag = false;
		int cnt = mybatis.insert("chat.create_content",chat_message_index);
		if(cnt>0) {
			flag = true;
		}
		return flag;
	}
	
	public Chat_MessageDTO read(int chat_index) {
		Chat_MessageDTO dto = mybatis.selectOne("chat.read_content",chat_index);
		return dto;
	}

}
