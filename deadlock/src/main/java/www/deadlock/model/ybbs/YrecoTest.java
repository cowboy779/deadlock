package www.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class YrecoTest {

	public static void main(String[] args) {
		
		
		YrecoDAO dao = new YrecoDAO();
		
//		create(dao);
//		read(dao);
//		update(dao);
//		delete(dao);
//		list(dao);
		
		total(dao);

			
	}
	

	private static void total(YrecoDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("col","content");
		map.put("word","내용");
		
		int total = dao.total(map);
		
		p("레코드 개수:"+total);
	}

	private static void list(YrecoDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("col","content");
		map.put("word","가나다");
		map.put("sno",1);
		map.put("eno",5);
		
		List<YrecoDTO> list = dao.list(map);
		
		for (int i = 0; i < list.size(); i++) {
			YrecoDTO dto = list.get(i);
			p(dto);
			p("------------");

		}
	}




	private static void update(YrecoDAO dao) {
		YrecoDTO dto = dao.read(1);
		dto.setContent("ee");
		if(dao.update(dto)){
			p("성공");
		}else{
			p("실패");
		}
	
	}


	private static void delete(YrecoDAO dao) {
		if(dao.delete(1)){
			p("성공");
		}else{
			p("실패");
		}
		
	}


	private static void create(YrecoDAO dao) {
		YrecoDTO dto = new YrecoDTO();
		dto.setContent("안녕");
		dto.setId("admin");
		dto.setYnum(1);
		
		if (dao.create(dto)) {
			p("성공");
		} else {
			p("실패");
		}
		
	}
	
	
	private static void read(YrecoDAO dao) {
		int yrenum = 1;
		
		YrecoDTO dto = dao.read(yrenum);
		
		p(dto);
		
	}

	

	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(YrecoDTO dto) {
		p("번호:"+dto.getYrenum());
		p("내용:"+dto.getContent());
		p("등날짜:"+dto.getYredate());
		p("아디:"+dto.getId());
		p("띠용:"+dto.getYnum());
		
	}

}
