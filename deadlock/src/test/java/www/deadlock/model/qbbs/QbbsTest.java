package www.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class QbbsTest {

	public static void main(String[] args) {
		
		
		QbbsDAO dao = new QbbsDAO();
		 
		//read(dao);
		//create(dao);
		//total(dao);
		//update(dao);
		//delete(dao);
		//list(dao);
		upcount(dao);

	}

	
	private static void upcount(QbbsDAO dao) {
		QbbsDTO dto=dao.read(1);
		p("조회수 : "+dto.getQcount());
		p("조회수 증가합니다.");
		dao.upcount(1);
		dto=dao.read(1);
		p("변경된 조회수 : "+dto.getQcount());
		
	}


	private static void list(QbbsDAO dao) {
		Map map=new HashMap();
		map.put("col", "title");
		map.put("word", "수정");
		map.put("sno", 1);
		map.put("eno", 5);
		List<QbbsDTO> list=dao.list(map);
		
		
		for(int i=0; i<list.size(); i++){
			QbbsDTO dto=list.get(i);
			p(dto);
			p("-----------------------------");
		}
		
	}


	private static void delete(QbbsDAO dao) {
		
		if(dao.delete(1)){
			p("성공");
		}else{
			p("실패");
		}
		
	}


	private static void update(QbbsDAO dao) {
		QbbsDTO dto=new QbbsDTO();
		dto.setTitle("제목수정");
		dto.setContent("수정연습");
		dto.setFname("사진수정연습");
		dto.setFilesize(10000);
		dto.setQnum(2);
		
		if(dao.update(dto)){
			p("성공");
		}else{
			p("실패");
		}
		
	}


	private static void total(QbbsDAO dao) {
		Map map=new HashMap();
		int total=dao.total(map);
		p("레코드 개수 : "+ total);
		
	}


	private static void create(QbbsDAO dao) {
		QbbsDTO dto=new QbbsDTO();
		dto.setTitle("제목3");
		dto.setContent("내용3");
		dto.setFname("man.jpg");
		dto.setQsep("a");
		dto.setId("admin");
		
		if(dao.create(dto)){
			p("성공");
		}else{
			p("실패");
		}
		
	}


	private static void read(QbbsDAO dao) {
		int qnum = 1;
		
		QbbsDTO dto = dao.read(qnum);
		
		p(dto);
		
	}

	

	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(QbbsDTO dto) {
		p("번호:"+dto.getQnum());
		p("작성자:"+dto.getId());
		p("제목:"+dto.getTitle());
		p("내용:"+dto.getContent());
		p("등록날짜:"+dto.getQdate());
		p("조회수:"+dto.getQcount());
		p("파일명:"+dto.getFname());
		p("분류:"+dto.getQsep());
		
		
	}

}
