package www.deadlock.model.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import www.DAOSTDInter;
import www.mybatis.MyAppSqlConfig;

public class MemberDAO implements DAOSTDInter{
	
	private static SqlSessionFactory sqlMapper;
	
	static {
		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
	}
	
	public String emailcode() throws Exception {
		String code = "";
		int a[] = new int[6];
		
		for(int i=0; i<6; i++){
			a[i] = (int)(Math.random()*9+1);
			code += a[i];
			//1~9
		}
		return code;
	}
	
	public boolean create(Object dto) throws Exception {
		SqlSession session = sqlMapper.openSession();
		
		boolean flag = false;
		
		int cnt = session.insert("member.create",dto); 
		if(cnt>0) {
			flag = true;
		}
		
		session.commit();
		session.close();
		
		return flag;
	}
	
	public boolean updatePasswd(MemberDTO dto)  throws Exception{
		SqlSession session = sqlMapper.openSession();
		
		boolean flag = false;
		
		int cnt = session.update("member.updatePasswd",dto);
		if(cnt > 0) {
			flag = true;
		}
		
		session.commit();
		session.close();
		
		return flag;
	}
	
	public boolean update(Object dto) throws Exception {
		SqlSession session = sqlMapper.openSession();
		
		boolean flag = false;
		
		int cnt = session.update("member.update",dto);
		if(cnt>0) {
			flag = true;
		}
		
		session.commit();
		session.close();
		
		return flag;
	}
	
	public boolean updateGrade_S(Map map) throws Exception {
		SqlSession session = sqlMapper.openSession();
		
		boolean flag = false;
		
		int cnt = session.update("member.updateGrade_S",map);
		
		if(cnt>0) {
			flag = true;
		}
		
		session.commit();
		session.close();
		
		return flag;
	}
	
	public boolean updateGrade_V(Map map) throws Exception {
		SqlSession session = sqlMapper.openSession();
		
		boolean flag = false;
		
		int cnt = session.update("member.updateGrade_V",map);
		
		if(cnt > 0) {
			flag = true;
		}
		session.commit();
		session.close();
		
		return flag;
	}
	
	public MemberDTO read(Object id) throws Exception {
		SqlSession session = sqlMapper.openSession();
		
		MemberDTO dto = session.selectOne("member.read",id);
		
		return dto;
	}
	
	public boolean delete(Object id) throws Exception {
		SqlSession session = sqlMapper.openSession();
		
		boolean flag = false;
		
		int cnt = session.delete("member.delete",id);
		
		if(cnt > 0) {
			flag = true;
		}
		
		session.commit();
		session.close();
		
		return flag;
	}
	
	public String Find_Id(String email) throws Exception {
		SqlSession session = sqlMapper.openSession();
		
		String id = "";
		
		id = session.selectOne("member.Fine_Id",email);
		
		return id;
	}
	
	public List<MemberDTO> list(Map map) throws Exception {
		SqlSession session = sqlMapper.openSession();
		
		List<MemberDTO> list = session.selectList("member.list",map);
		
		return list;
	}
	
	public boolean loginCheck(Map map) throws Exception {
		SqlSession session = sqlMapper.openSession();
		
		boolean flag = false;
		
		int cnt = session.selectOne("member.loginCheck",map);
		
		if(cnt>0) {
			flag = true;
		}
		
		return flag;
	}
	
	public int total(Map map) throws Exception {
		SqlSession session = sqlMapper.openSession();
		
		int total = session.selectOne("member.total",map);
		
		return total;
	}
	
	public boolean duplicateId(String id) throws Exception {
		SqlSession session = sqlMapper.openSession();
		
		boolean flag = false;
		
		int cnt = session.selectOne("member.duplicateId",id);
		if(cnt>0) {
			flag = true;
		}
		return flag;
	}
	
	public boolean duplicateEmail(String email) throws Exception {
		SqlSession session = sqlMapper.openSession();
		
		boolean flag= false;
		
		int cnt = session.selectOne("member.duplicateEmail",email);
		if(cnt>0) {
			flag = true;
		}
		return flag;
	}
	
	public String getFname(String id) throws Exception {
		SqlSession session = sqlMapper.openSession();
		
		String fname = "";
		
		fname = session.selectOne("member.getFname",id);
		
		return fname;
	}
	
	public boolean CheckPW(Map map) throws Exception {
		boolean flag = false;
		
		SqlSession session = sqlMapper.openSession();
		
		int cnt = session.selectOne("member.CheckPW",map);
		if(cnt>0) {
			flag = true;
		}
		
		return flag;
	}





}
