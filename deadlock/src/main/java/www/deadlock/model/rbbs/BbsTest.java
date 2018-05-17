package www.deadlock.model.rbbs;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


public class BbsTest {

	public static void main(String[] args) {
		
		
		RbbsDAO dao = new RbbsDAO();
		
		read(dao);
		//list(dao);
		//create(dao);
		//delete(dao);
		//update(dao);
		
	}

	
	private static void update(RbbsDAO dao) {
		RbbsDTO dto = new RbbsDTO();
		
		dto.setRnum(1);
		dto.setContent("안녕갑세요");
		dto.setTitle("dkjakdslf");
		dto.setFname("asdf.jpg");
		
		if(dao.update(dto)){
			p("성공");
		}else{
			p("실패");
		}
		
	}


	private static void delete(RbbsDAO dao) {
		int rnum = 3;
		
		if(dao.delete(rnum)){
			p("성공");
		}else{
			p("실 패ㅑ");
		}
		
	}


	private static void create(RbbsDAO dao) {
		RbbsDTO dto = new RbbsDTO();
		
		dto.setId("admin");
		dto.setContent("안녕갑세요");
		dto.setTitle("dkjakdslf");
		dto.setImp("V");
		dto.setRcount(0);
		dto.setFname("asdf.jpg");
		
		boolean flag = dao.create(dto);
		if(flag){
			p("성공");
		}else{
			p("실패");
		}
	}


	private static void list(RbbsDAO dao) {
		
		Map map = new HashMap();
		map.put("sno", 1);
		map.put("eno", 10);
		
		List<RbbsDTO> list = dao.list(map);
		Iterator<RbbsDTO> iter = list.iterator();
		while(iter.hasNext()) {
			RbbsDTO dto = iter.next();
			p(dto);
			p("----------");
		}
	}


	private static void read(RbbsDAO dao) {
		int rnum = 1;
		
		RbbsDTO dto = dao.read(rnum);
		
		p(dto);
		
	}

	

	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(RbbsDTO dto) {
		p("번호:"+dto.getRnum());
		p("제목:"+dto.getTitle());
		p("내용:"+dto.getContent());
		p("등록날짜:"+dto.getRdate());
		p("조회수:"+dto.getRcount());
		p("작성자:"+dto.getId());
		p("grpno:"+dto.getGrpno());
		p("ansnum:"+dto.getAnsnum());
		p("indent:"+dto.getIndent());
		p("imp: "+dto.getImp());
		
	}

}
