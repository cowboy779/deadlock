package www.deadlock.model.pbbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PBbsTest {

	public static void main(String[] args) {
		
		
		PBbsDAO dao = new PBbsDAO();
		
//		create(dao);
//		read(dao);
//		update(dao);
//		total(dao);
//		delete(dao);
//		list(dao);
//		passwd(dao);
			
	}
	
	private static void passwd(PBbsDAO dao) {
		Map map = new HashMap();
		map.put("bnum", 1);
		map.put("passwd", "1234");

		if (dao.passwdCheck(map)) {
			p("올바른 비번입니다");
		} else {
			p("잘못된 비번입니다");
		}
	}
	
	private static void total(PBbsDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("col","content");
		map.put("word","내용");
		
		int total = dao.total(map);
		
		p("레코드 개수:"+total);
	}


	private static void list(PBbsDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("col","content");
		map.put("word","내용");
		map.put("sno",1);
		map.put("eno",5);
		
		List<PBbsDTO> list = dao.list(map);
		
		for (int i = 0; i < list.size(); i++) {
			PBbsDTO dto = list.get(i);
			p(dto);
			p("------------");

		}
	}




	private static void update(PBbsDAO dao) {
		PBbsDTO dto = dao.read(1);
		dto.setContent("내용용");
		dto.setBname("안녕하세요");
		if(dao.update(dto)){
			p("성공");
		}else{
			p("실패");
		}
	
	}


	private static void delete(PBbsDAO dao) {
		if(dao.delete(1)){
			p("성공");
		}else{
			p("실패");
		}
		
	}


	private static void create(PBbsDAO dao) {
		PBbsDTO dto = new PBbsDTO();
		dto.setContent("안녕");
		dto.setBname("ㅇㅇ");
		dto.setPasswd("1234");
		
		if (dao.create(dto)) {
			p("성공");
		} else {
			p("실패");
		}
		
	}
	
	
	private static void read(PBbsDAO dao) {
		int bnum = 1;
		
		PBbsDTO dto = dao.read(bnum);
		
		p(dto);
		
	}

	

	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(PBbsDTO dto) {
		p("번호:"+dto.getBnum());
		p("제목:"+dto.getBname());
		p("내용:"+dto.getContent());
		p("등록날짜:"+dto.getBdate());
		p("비번:"+dto.getPasswd());
		
	}

}
