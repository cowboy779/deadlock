package www.deadlock.model.qbbs;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class QrecoDAOTest {

	private static BeanFactory beans;
	private static QrecoDAO qrdao;
	
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
		qrdao=(QrecoDAO)beans.getBean("qrdao");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testRead() {
		int qrenum = 1;
		QrecoDTO dto = (QrecoDTO) qrdao.read(qrenum);
		assertNotNull(dto);
	}

	@Test
	public void testCreate() {
		QrecoDTO dto=new QrecoDTO();
		dto.setContent("댓글입니다.2");
		dto.setQnum(2);
		dto.setId("admin");
		
		assertTrue(qrdao.create(dto));
	}

	@Test
	public void testUpdate() {
		QrecoDTO dto=new QrecoDTO();
		dto.setContent("수정연습");
		dto.setQrenum(2);
		
		assertTrue(qrdao.update(dto));
	}

	@Test
	public void testDelete() {
		int qrenum=3;
		assertTrue(qrdao.delete(qrenum));
	}

	@Test
	public void testTotal() {
		Map map=new HashMap();
		int total=qrdao.total(map);
		assertEquals(total,2);
	}

	@Test
	public void testList() {
		Map map=new HashMap();
		map.put("col", "title");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		List<QrecoDTO> list=qrdao.list(map);
		
		
		assertEquals(list.size(), 2);
	}

}
