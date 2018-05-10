package www.deadlock.model.qbbs;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class QbbsDAOTest {

	private static BeanFactory beans;
	private static QbbsDAO qdao;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource=new ClassPathResource("daoTest.xml");
		beans=new XmlBeanFactory(resource);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		qdao=(QbbsDAO)beans.getBean("qdao");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testUpcount() {
		QbbsDTO dto=(QbbsDTO) qdao.read(1);
		int c1=dto.getQcount();
		qdao.upcount(1);
		dto=(QbbsDTO) qdao.read(1);
		int c2=dto.getQcount();
		
		assertEquals(c2, c1+1);
	}

	@Test
	public void testRead() {
		int qnum = 1;
		QbbsDTO dto = (QbbsDTO) qdao.read(qnum);
		assertNotNull(dto);
	}

	@Test
	public void testCreate() {
		QbbsDTO dto=new QbbsDTO();
		dto.setTitle("제목3");
		dto.setContent("내용3");
		dto.setFname("man.jpg");
		dto.setQsep("a");
		dto.setId("admin");
		
		assertTrue(qdao.create(dto));
	}

	@Test
	public void testUpdate() {
		QbbsDTO dto=new QbbsDTO();
		dto.setTitle("제목수정");
		dto.setContent("수정연습");
		dto.setFname("사진수정연습");
		dto.setFilesize(10000);
		dto.setQnum(2); 
		
		assertTrue(qdao.update(dto));
	}

	@Test
	public void testDelete() {
		int qnum=3;
		assertTrue(qdao.delete(qnum));
	}

	@Test
	public void testTotal() {
		Map map=new HashMap();
		int total=qdao.total(map);
		assertEquals(total,2);
	}

	@Test
	public void testList() throws Exception {
		Map map=new HashMap();
		map.put("col", "title");
		map.put("word", "수정");
		map.put("sno", 1);
		map.put("eno", 5);
		List<QbbsDTO> list=qdao.list(map);
		
		
		assertEquals(list.size(), 1);
	}

}
