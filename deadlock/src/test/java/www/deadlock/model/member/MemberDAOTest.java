package www.deadlock.model.member;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.HashMap;
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


public class MemberDAOTest {

	private static BeanFactory beans;
	private static MemberDAO dao;
	
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
		dao = (MemberDAO)beans.getBean("mdao");
	}
	
	@After
	public void tearDown() throws Exception {
	}

	@Test @Ignore
	public void testEmailcode() {
		String code = null;
		int a[] = new int[6];
		
		for(int i=0; i<6; i++){
			a[i] = (int)(Math.random()*9+1);
			code += a[i];
			//1~9
		}
		assertNotNull(code);
	}

	@Test @Ignore
	public void testCreate() throws Exception {
		MemberDTO dto = new MemberDTO();
		dto.setId("1444");
		dto.setPasswd("1234");
		dto.setTel("12-21-132");
		dto.setMname("테스트이름");
		dto.setEmail("테스트이메일@에");
		dto.setZipcode(12345);
		dto.setAddress1("주소1");
		dto.setAddress2("주소2");
		dto.setTel("테스트텔");
		dto.setJob("테스트직업");
		dto.setMdate("11=-11-1");
		dto.setFname("파일이름");
		dto.setFilesize(24);
		
		assertTrue(dao.create(dto));
	}

	@Test @Ignore
	public void testUpdatePasswd() throws Exception {
		MemberDTO dto = new MemberDTO();
		dto.setId("test");
		dto.setPasswd("1234");
		
		assertNotNull(dao.updatePasswd(dto));
	}

	@Test @Ignore
	public void testUpdate() throws Exception {
		MemberDTO dto = new MemberDTO();
		dto.setMname("이름변경");
		dto.setTel("11111");
		dto.setEmail("123@123");
		dto.setFname("사진변경");
		dto.setFilesize(44);
		dto.setZipcode(55555);
		dto.setAddress1("주소변경지");
		dto.setAddress2("주소변경시2");
		dto.setJob("직업텟");
		dto.setId("test");
		
		assertTrue(dao.update(dto));
	}

	@Test @Ignore
	public void testUpdateGrade_S() throws Exception {
		MemberDTO dto = new MemberDTO();
		Map map = new HashMap();
		map.put("id", "test");
		assertTrue(dao.updateGrade_S(map));
	}

	@Test @Ignore
	public void testUpdateGrade_V() throws Exception {
		MemberDTO dto = new MemberDTO();
		Map map = new HashMap();
		map.put("id", "test");
		assertTrue(dao.updateGrade_V(map));
	}

	@Test
	public void testRead() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testDelete() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testFind_Id() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testList() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testLoginCheck() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testTotal() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testDuplicateId() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testDuplicateEmail() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testGetFname() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testCheckPW() {
		fail("Not yet implemented");
	}

}
