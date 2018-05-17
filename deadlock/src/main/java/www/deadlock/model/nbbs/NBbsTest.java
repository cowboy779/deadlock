package www.deadlock.model.nbbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class NBbsTest {

	public static void main(String[] args) {
		
		
		NBbsDAO dao = new NBbsDAO();
		
		//read(dao);
		//create(dao);
		list(dao);
		//update(dao);
		//delete(dao);
	}
	
	private static void delete(NBbsDAO dao) {
		if(dao.delete(8)) {
			p("SUCCESS");
		}else {
			p("FAILED");
		}
	}

	private static void update(NBbsDAO dao) {
		NBbsDTO dto = dao.read(1);
		dto.setCorname("tt");
		if(dao.update(dto)) {
			p("success");
		}else {
			p("fail");
		}
	}

	private static void create(NBbsDAO dao) {
		NBbsDTO dto = new NBbsDTO();
		
		dto.setTitle("create");
		dto.setNoname("creat2");
		dto.setContent("create");
		if(dao.create(dto)) {
			p("성공");
		} else {
			p("실패");
		}
		
		
	}
	
	private static void list(NBbsDAO dao) {
		Map map = new HashMap();
		map.put("col", "noname");
		map.put("word", "답");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<NBbsDTO> list = dao.list(map);
		for (int i=0; i < list.size(); i++) {
			NBbsDTO dto = list.get(i);
			p(dto);
			p("------------------");
		}
		
	}

	
	private static void read(NBbsDAO dao) {
		int bbsno = 1;
		
		NBbsDTO dto = dao.read(bbsno);
		
		p(dto);
		
	}

	

	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(NBbsDTO dto) {
		p("번호:"+dto.getNnum());
		p("제목:"+dto.getTitle());
		p("내용:"+dto.getContent());
		p("등록날짜:"+dto.getNdate());
		p("조회수:"+dto.getNcount());
		p("작성자:"+dto.getNoname());
		p("수정자:"+dto.getCorname());
		
	}

}
