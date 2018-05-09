package www.deadlock.model.cbbs;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;



public class CbbsDAOTest {
	private static BeanFactory beans;
	private static CbbsDAO dao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("daoTest.xml");
		beans = new XmlBeanFactory(resource);
	}

	@Before
	public void setUp() throws Exception {
		dao = (CbbsDAO)beans.getBean("cdao");
	}

	@Ignore
	public void testcreate() {
		CbbsDTO dto = new CbbsDTO();
		dto.setId("nomal");
		dto.setTitle("test");
		dto.setContent("mybatis test");
		dto.setFname("ggg.jpg");
		
		assertTrue(dao.create(dto));
	}
	
	@Test
	public void testList() {
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word","추천");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<CbbsDTO> list = dao.list(map);
		System.out.println(list.size());
		assertEquals(list.size(),4);
	}
	
	@Test
	public void testTotal() {
		Map map=new HashMap();
		map.put("col", "title");
		map.put("word", "마이");
		
		int cnt=dao.total(map);
		assertEquals(cnt,1);
	}
	
	@Test
	public void testRead() {
		Object dto=dao.read(6);
		assertNotNull(dto);
	}
	
	

}
