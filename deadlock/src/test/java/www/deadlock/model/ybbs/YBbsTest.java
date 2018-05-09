package www.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class YBbsTest {

	public static void main(String[] args) {
		
		
		YBbsDAO dao = new YBbsDAO();
		
//		read(dao);
//		create(dao);
//		delete(dao);
//		update(dao);
		list(dao);
//		total(dao);
	}
	
	
	private static void total(YBbsDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("col","title");
		map.put("word","오늘");
		
		int total = dao.total(map);
		
		p("레코드 개수:"+total);
	}


	private static void list(YBbsDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("col","title");
		map.put("word","게시판");
		map.put("sno",1);
		map.put("eno",5);
		
		List<YBbsDTO> list = dao.list(map);
		
		for (int i = 0; i < list.size(); i++) {
			YBbsDTO dto = list.get(i);
			p(dto);
			p("------------");

		}
	}




	private static void update(YBbsDAO dao) {
		YBbsDTO dto = dao.read(1);
		dto.setContent("내용용");
		dto.setTitle("안녕하세요");
		dto.setFname("dd");
		if(dao.update(dto)){
			p("성공");
		}else{
			p("실패");
		}
	
	}


	private static void delete(YBbsDAO dao) {
		if(dao.delete(1)){
			p("성공");
		}else{
			p("실패");
		}
		
	}


	private static void create(YBbsDAO dao) {
		YBbsDTO dto = new YBbsDTO();
		dto.setContent("안녕");
		dto.setFname("ㅇㅇ");
		dto.setTitle("게시판");
		dto.setId("admin");
		dto.setFilesize("3");
	
		if (dao.create(dto)) {
			p("성공");
		} else {
			p("실패");
		}
		
	}


	private static void read(YBbsDAO dao) {
		int ynum = 1;
		
		YBbsDTO dto = dao.read(ynum);
		
		p(dto);
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(YBbsDTO dto) {
		p("번호:"+dto.getYnum());
		p("내용:"+dto.getContent());
		p("제목:"+dto.getTitle());
		p("등록날짜:"+dto.getYdate());
		p("조회수:"+dto.getFname());
		p("파일사이즈:"+dto.getFilesize());
		p("id:"+dto.getId());
		
		
		
	}

}
