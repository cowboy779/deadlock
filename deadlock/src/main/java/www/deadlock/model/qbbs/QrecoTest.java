package www.deadlock.model.qbbs;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class QrecoTest {

	public static void main(String[] args) {
		
		
		QrecoDAO dao = new QrecoDAO();
		 
		//read(dao);
		//create(dao);
		//total(dao);
		//update(dao);.
		//delete(dao);
		list(dao);

	}

	
	private static void list(QrecoDAO dao) {
		Map map=new HashMap();

		map.put("sno", 1);
		map.put("eno", 5);
		List<QrecoDTO> list=dao.list(map);
		
		
		for(int i=0; i<list.size(); i++){
			QrecoDTO dto=list.get(i);
			p(dto);
			p("-----------------------------");
		}
		
	}


	private static void delete(QrecoDAO dao) {
		
		if(dao.delete(2)){
			p("성공");
		}else{
			p("실패");
		}
		
	}


	private static void update(QrecoDAO dao) {
		QrecoDTO dto=new QrecoDTO();
		dto.setContent("수정연습");
		dto.setQrenum(1);
		
		if(dao.update(dto)){
			p("성공");
		}else{
			p("실패");
		}
		
		
	}


	private static void total(QrecoDAO dao) {
		Map map=new HashMap();
		int total=dao.total(map);
		p("레코드 개수 : "+ total);
		
	}


	private static void create(QrecoDAO dao) {
		QrecoDTO dto=new QrecoDTO();
		dto.setContent("댓글입니다.");
		dto.setQnum(1);
		dto.setId("admin");
		
		if(dao.create(dto)){
			p("성공");
		}else{
			p("실패");
		}
		
	}


	private static void read(QrecoDAO dao) {
		int qrenum = 1;
		
		QrecoDTO dto = dao.read(qrenum);
		
		p(dto);
		
	}

	

	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(QrecoDTO dto) {
		p("번호:"+dto.getQrenum());
		p("부모번호:"+dto.getQnum());
		p("작성자:"+dto.getId());
		p("내용:"+dto.getContent());
		p("작성일:"+dto.getQredate());
		
		
	}

}
