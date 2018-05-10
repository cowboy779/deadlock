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

import www.deadlock.model.rbbs.RbbsDAO;
import www.deadlock.model.rbbs.RbbsDTO;
import www.deadlock.utility.Utility;


@Controller
public class RbbsController {

	@Autowired
	private RbbsDAO dao;
	
	
	@RequestMapping("/rbbs/list")
	public String list(HttpServletRequest request) {

		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total")) {
			word = "";
		}

		// --------------------------------------------------------------
		int nowPage = 1;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5;
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		// --------------------------------------------------------------
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		List<RbbsDTO> list = dao.list(map);

		int totalRecord = dao.total(map);

		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);

		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		

		return "/bbs/list";
	}

	@RequestMapping(value = "/rbbs/createForm", method = RequestMethod.GET)
	public String create() {

		return "/rbbs/create";
	}

	@RequestMapping(value = "/rbbs/createForm", method = RequestMethod.POST)
	public String create(RbbsDTO dto, HttpServletRequest request) {
		String basePath = request.getRealPath("/storage_b");
		String filename = Utility.saveFileSpring30(dto.getFnameMF(), basePath);
		int filesize = (int) dto.getFnameMF().getSize();

		dto.setFname(filename);
		if (dao.create(dto)) {
			return "redirect:/bbs/list";

		} else {
			return "/bbs/error";
		}

	}

	@RequestMapping("/rbbs/read")
	public String read(HttpServletRequest request,Model model) {

		Map map = new HashMap();
		
		String col = request.getParameter("col");
		String word = request.getParameter("word");
		int nowPage = Integer.parseInt(request.getParameter("nowPage"));

		int rnum = Integer.parseInt(request.getParameter("rnum"));

		dao.upViewCount(rnum);
		RbbsDTO dto = (RbbsDTO)dao.read(rnum);

		String content = dto.getContent();
		content = content.replaceAll("\r\n", "<br>");

		model.addAttribute("dto", dto);
		model.addAttribute("content", content);
		
		String url = "read";
		int nPage = 1;
		if(request.getParameter("nPage")!=null) {
			nPage=Integer.parseInt(request.getParameter("nPage"));
		}
		
		int recordPerPage = 3;
		int sno = ((nPage-1)* recordPerPage)+1;
		
		int eno = nPage * recordPerPage;
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("rnum", rnum);
		List<RbbsDTO> rlist = dao.list(map);

		int total = rdao.total(bbsno);
		String paging = Utility.paging2(total, nPage , recordPerPage ,url, bbsno,nowPage, col, word);
		
		model.addAttribute("rlist", rlist);
		model.addAttribute("paging", paging);
		model.addAttribute("nPage", nPage);
		
		
		return "/bbs/read";
	}

	@RequestMapping(value="/rbbs/delete", method=RequestMethod.GET)
	public String delete() {
		
		return "/rbbs/delete";
	}
	
	@RequestMapping(value="/bbs/delete" , method=RequestMethod.POST)
	public String delete(HttpServletRequest request) {
		
		
		String basePath = request.getRealPath("/storage_b");
		
		int bbsno = Integer.parseInt(request.getParameter("bbsno"));
		String passwd = request.getParameter("passwd");
		String oldfile = request.getParameter("oldfile");

		
		Map map = new HashMap();
		map.put("bbsno", bbsno);
		map.put("passwd",passwd);
		
		boolean pflag = dao.passCheck(map);
		boolean flag = false;
		if(pflag){
			//flag = dao.delete(bbsno);
			try {
				if(flag)Utility.deleteFile(basePath, oldfile);
				service.delete(bbsno);
				return "redirect:/bbs/list";
			} catch (Exception e) {
				e.printStackTrace();
				return "/err/error";
			}
		}else {
			return "/err/perror";
		}
		
		
	}

	@RequestMapping("/bbs/reply")
	public String reply(int num) {
		
		return "redirect:/bbs/list";
	}
	
	
	
}
