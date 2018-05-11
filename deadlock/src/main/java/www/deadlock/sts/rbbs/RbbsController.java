package www.deadlock.sts.rbbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import www.deadlock.model.rbbs.IrbbsDAO;
import www.deadlock.model.rbbs.RbbsDAO;
import www.deadlock.model.rbbs.RbbsDTO;
import www.deadlock.utility.Utility;

@Controller
public class RbbsController {

	@Autowired
	private IrbbsDAO dao;

	@RequestMapping("/rbbs/list")
	public String list(HttpServletRequest request) {

		String col = request.getParameter("col");
		String word = request.getParameter("word");

		// --------------------------------------------------------------
		int nowPage = 1;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 10;
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		// --------------------------------------------------------------
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		List list;
		try {
			list = dao.list(map);

			int totalRecord = dao.total(map);

			String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);

			request.setAttribute("list", list);
			request.setAttribute("nowPage", nowPage);
			request.setAttribute("paging", paging);
			request.setAttribute("col", col);
			request.setAttribute("word", word);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "/rbbs/list";
	}

	@RequestMapping(value = "/rbbs/create", method = RequestMethod.GET)
	public String create() {

		return "/rbbs/create";
	}

	@RequestMapping(value = "/rbbs/create", method = RequestMethod.POST)
	public String create(RbbsDTO dto, HttpServletRequest request) throws Exception {
		String basePath = request.getRealPath("/storage_rbbs");
		String filename = Utility.saveFileSpring30(dto.getFnameMF(), basePath);
		int filesize = (int) dto.getFnameMF().getSize();

		dto.setFname(filename);
		if (dao.create(dto)) {
			return "redirect:/rbbs/list";

		} else {
			return "/rbbs/error";
		}

	}

	@RequestMapping("/rbbs/read")
	public String read(HttpServletRequest request, Model model) throws Exception {
		//String id = (String)request.getSession().getAttribute("id");
		String id = "admin";
		boolean flag = false;
		flag= dao.vCheck(id);
		
		if(flag) {

		int rnum = Integer.parseInt(request.getParameter("rnum"));
		RbbsDTO dto = (RbbsDTO) dao.read(rnum);
		
		dao.upViewCount(rnum);
		
		model.addAttribute("dto", dto);

		return "/rbbs/read";
		}else {
		return "/rbbs/aderror";
		}
	}

	@RequestMapping("/rbbs/delete")
	public String delete(HttpServletRequest request) throws Exception {
		Map map = new HashMap();
		String id = request.getParameter("id");
		String rnum = request.getParameter("rnum");

		map.put("id", id);
		map.put("rnum", rnum);

		boolean flag = dao.idCheck(map);

		if (flag) {

			if (dao.delete(rnum)) {
				return "redirect:/rbbs/list";
			} else {
				return "/rbbs/error";
			}

		} else {
			return "/rbbs/perror";
		}

	}

	@RequestMapping(value = "/rbbs/reply", method = RequestMethod.GET)
	public String createreply(HttpServletRequest request) {
		int rnum = Integer.parseInt(request.getParameter("rnum"));
		
		request.setAttribute("rnum", rnum);

		return "/rbbs/reply";
	}
	
	@RequestMapping(value = "/rbbs/reply", method = RequestMethod.POST)
	public String createreply(RbbsDTO dto, HttpServletRequest request) {
		
		boolean flag = dao.createReply(dto);
		
		
		if(flag) {
			return "redirect:/rbbs/list";
			
		}else {
			return "/rbbs/error";
		}
		
	}

	@RequestMapping("/rbbs/update")
	public String update(HttpServletRequest request) {

		

		
		return "/rbbs/update";
	}
}
