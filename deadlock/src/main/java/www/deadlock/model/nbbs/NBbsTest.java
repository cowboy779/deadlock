package www.deadlock.model.nbbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;




public class NBbsTest {

	public static void main(String[] args) {
	
		Resource rs = new ClassPathResource("daoTest.xml");
		BeanFactory factory = new XmlBeanFactory(rs);
		NBbsDAO dao = (NBbsDAO) factory.getBean("ndao");
	
		read(dao);
		//create(dao);
		//list(dao);
		//update(dao);
		//delete(dao);
	}
	
	private static void delete(NBbsDAO dao) {
		try {
			if(dao.delete(8)) {
				p("SUCCESS");
			}else {
				p("FAILED");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private static void update(NBbsDAO dao) {
		NBbsDTO dto;
		try {
			dto = (NBbsDTO) dao.read(1);
			dto.setCorname("tt");
			if(dao.update(dto)) {
				p("success");
			}else {
				p("fail");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private static void create(NBbsDAO dao) {
		NBbsDTO dto = new NBbsDTO();
		
		dto.setTitle("create");
		dto.setNoname("creat2");
		dto.setContent("create");
		try {
			if(dao.create(dto)) {
				p("성공");
			} else {
				p("실패");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		NBbsDTO dto;
		try {
			dto = (NBbsDTO) dao.read(bbsno);
			p(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
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
