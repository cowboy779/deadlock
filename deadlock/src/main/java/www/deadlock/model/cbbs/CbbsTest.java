package www.deadlock.model.cbbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CbbsTest {

	public static void main(String[] args) {
		CbbsDAO dao=new CbbsDAO();
		
		//read(dao);
		//create(dao);
		//list(dao);
		//update(dao);
		//delete(dao);
		//total(dao);
		//upccount(dao);

	}

	private static void upccount(CbbsDAO dao) {
		CbbsDTO dto=dao.read(2);
		p("현재 추천수:"+dto.getCcount());
		
		dao.upccount(2);
		
		dto=dao.read(2);
		p("변경된 추천수:"+dto.getCcount());
	}

	private static void total(CbbsDAO dao) {
		Map map=new HashMap();
		map.put("col", "title");
		map.put("word", "추천");
		
		int total=dao.total(map);
		
		p("레코드개수: "+total);
	}

	private static void delete(CbbsDAO dao) {
		int cnum=1;
		
		if(dao.delete(cnum)) {
			p("삭제성공");
		}else {
			p("삭제실패");
		}
		
	}

	private static void update(CbbsDAO dao) {
		CbbsDTO dto=new CbbsDTO();
		int cnum=1;
		dto.setTitle("쿠라모토");
		dto.setContent("예쓰맨");
		dto.setFname("123.jpg");
		dto.setCnum(cnum);
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void list(CbbsDAO dao) {
		Map map=new HashMap();
		map.put("col", "title");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		
		
		List<CbbsDTO> list = dao.list(map);
		for (int i = 0; i < list.size(); i++) {
			CbbsDTO dto = list.get(i);

			p(dto);
			p("--------");
		}
		
	}

	private static void create(CbbsDAO dao) {
		
		CbbsDTO dto = new CbbsDTO();
		dto.setId("nomal");
		dto.setTitle("test");
		dto.setContent("mybatis test");
		dto.setFname("ggg.jpg");
		
		if (dao.create(dto)) {
			p("성공");
		} else {
			p("실패");
		}
		
		
	}

	private static void read(CbbsDAO dao) {
		int cnum = 1;
		CbbsDTO dto = dao.read(cnum);
		p(dto);
	}
	
	
	private static void p(String string) {
		System.out.println(string);
	}

	private static void p(CbbsDTO dto) {
		p("번호:"+dto.getCnum());
		p("제목:"+dto.getTitle());
		p("내용:"+dto.getContent());
		p("등록날짜:"+dto.getCdate());
		p("조회수:"+dto.getFname());
		p("추천수:"+dto.getCcount());
		p("작성자:"+dto.getId());
		
	}

}
