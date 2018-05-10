package www.deadlock.model.rbbs;

import static org.junit.Assert.*;

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




public class RbbsDAOTest {
	
	private static BeanFactory beans;

	private static RbbsDAO dao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("daoTest.xml");
		beans = new XmlBeanFactory(resource);
		
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		dao = (RbbsDAO)beans.getBean("rdao");
	}

	@After @Ignore
	public void tearDown() throws Exception {
	}

	@Test
	public void testRead() {
		RbbsDTO dto = (RbbsDTO) dao.read(11);
		assertNotNull(dto);
	}

	@Test 
	public void testList() {
		Map map = new HashMap();
		map.put("bbsno", 2);
		map.put("sno", 1);
		map.put("eno", 5);
		List<RbbsDTO> list = dao.list(map);
		assertEquals(list.size(),5);
	}

	@Test 
	public void testCreate() {
		RbbsDTO dto = new RbbsDTO();
		dto.setRnum(2);
		dto.setContent("hihi");
		dto.setId("admin");
		dto.setTitle("dkdkdkd");
		dto.setImp("V");
		dto.setFname("dndn.jpg");
		
		assertTrue(dao.create(dto));
	}

	@Test 
	public void testDelete() {
		int rnum = 3;
		assertTrue(dao.delete(rnum));
	}

	@Test  
	public void testUpdate() {
		RbbsDTO dto = new RbbsDTO();
		dto.setRnum(2);
		dto.setContent("hihi");
		dto.setId("admin");
		dto.setTitle("dkdkdkd");
		dto.setImp("V");
		dto.setFname("dndn.jpg");
		assertTrue(dao.update(dto));
	}

	@Test
	public void testTotal() {
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word", "dk");

		int cnt = dao.total(map);
		assertEquals(cnt,1);
	}

	@Test
	public void testUpViewCount() {

		assertTrue(dao.upViewCount(1));
	}

	@Test
	public void testCreateReply() {
		RbbsDTO dto = new RbbsDTO();
		dto.setRnum(10);
		dto.setContent("hihi");
		dto.setId("admin");
		dto.setTitle("댑글");
		dto.setImp("V");
		dto.setFname("dndn.jpg");
		
		assertTrue(dao.createReply(dto));
	}

}
