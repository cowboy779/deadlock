package www.deadlock.sts.ybbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import www.deadlock.model.ybbs.YBbsDAO;
import www.deadlock.model.ybbs.YBbsDTO;
import www.deadlock.model.ybbs.YrecoDAO;
import www.deadlock.model.ybbs.YrecoDTO;
import www.deadlock.utility.Utility;

@Controller
public class YbbsController {

	@Autowired
	private YBbsDAO dao;

	@Autowired
	private YrecoDAO rdao;

	@RequestMapping("/ybbs/yupdate")
	public String rupdate(YrecoDTO dto, Model model, String nowPage, String col, String word, String nPage) {
		if (rdao.update(dto)) {
			model.addAttribute("ynum", dto.getYnum());
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nPage", nPage);
			return "redirect:/ybbs/read";
		} else {
			return "/ybbs/error";
		}
	}
	
	
	@RequestMapping("/ybbs/ydelete")
	public String rdelete(int ynum, int yrenum, String nowPage, String col, String word, int nPage, Model model) {

		Map map = new HashMap();
		int total = rdao.total(map);
		int totalPage = (int)(Math.ceil((double)total/3));
		if (rdao.delete(yrenum)) {
			if (nPage != 1 && nPage == totalPage && total % 3 == 1)nPage = nPage - 1;
			model.addAttribute("ynum", ynum);
			model.addAttribute("nPage", nPage);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			return "redirect:/ybbs/read";
		} else {
			return "/ybbs/error/";
		}

	}
	
	@RequestMapping("/ybbs/ycreate")
	public String ycreate(YrecoDTO dto, Model model, String nowPage, String col, String word) {
		if (rdao.create(dto)) {
			
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("ynum", dto.getYnum());

			return "redirect:/ybbs/read";
		} else {
			return "ybbs/error";
		}
	}

	
	
	@RequestMapping(value = "/ybbs/update", method = RequestMethod.POST)
	public String update(HttpServletRequest request, Model model, YBbsDTO dto,String oldfile) {

	
		String basePath = request.getRealPath("/storage_y");
		String fname = Utility.saveFileSpring30(dto.getFnameMF(), basePath);

		int filesize = (int) dto.getFnameMF().getSize();

		dto.setFname(fname);
		dto.setFilesize(filesize);
		
			if (dao.update(dto)) {
				if (filesize > 0)
					Utility.deleteFile(basePath, oldfile);
				
				model.addAttribute("col", request.getParameter("col"));
				model.addAttribute("word", request.getParameter("word"));
				model.addAttribute("nowPage", request.getParameter("nowPage"));

				return "redirect:/ybbs/list";
			} else {
				return "/ybbs/error";
			}
		
	}

	@RequestMapping(value = "/ybbs/update", method = RequestMethod.GET)
	public String update(int ynum, Model model) {

		model.addAttribute("dto", dao.read(ynum));
		return "/ybbs/update";
	}
	
	
	
	
	
	@RequestMapping("/ybbs/read")
	public String read(int ynum, Model model, HttpServletRequest request) {
		

		String col = request.getParameter("col");
		String word = request.getParameter("word");
		int nowPage = Integer.parseInt(request.getParameter("nowPage"));
		
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		
		dao.ycount(ynum);
		YBbsDTO dto = dao.read(ynum);
		String content = dto.getContent();
		content = content.replaceAll("\r\n", "<br>");

		model.addAttribute("dto", dto);
		model.addAttribute("content", content);
			
		
		// 일단 여기부터 댓글
		String url = "read";
		int nPage = 1;
		if (request.getParameter("nPage") != null) {
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}
		int recordPerPage = 3;
		int sno = ((nPage - 1) * recordPerPage) + 1;
		int eno = nPage * recordPerPage;
		
		
		String col2 = Utility.checkNull(request.getParameter("col"));
		String word2 = Utility.checkNull(request.getParameter("word"));
//		dto.setId("user1");

		if (col.equals("total"))
			word = "";
		// 검색관련end----------------------------

		// paging관련
		int nowPage2 = 1;// 현제 보이는 페이지
		if (request.getParameter("nowPage") != null)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));

		int recordPerPage2 = 5; // 한페이지당 보여줄 레코드 개수

		int sno2 = ((nowPage - 1) * recordPerPage) + 1; // 시작 페이지
		int eno2 = nowPage * recordPerPage; // 어디부터 어디까지 보여주겠다 =끝페이지
		
		
		
		
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("ynum", ynum);
		
		Map map2 = new HashMap();
		map2.put("col", col2);
		map2.put("word", word2);
		map2.put("sno", sno2);
		map2.put("eno", eno2);
	
		List<YrecoDTO> ylist = rdao.list(map);
		List<YBbsDTO> list = dao.list(map2);
		
		int total = rdao.total(map);
		int ytotal = dao.total(map2);


		String paging2 = Utility.ypaging(total, nPage, recordPerPage, url, ynum, nowPage, col, word);
		String paging4 =  Utility.paging4(ynum, ytotal, recordPerPage, nowPage, col, word);
		
		model.addAttribute("list",list);
		model.addAttribute("ylist", ylist);
		model.addAttribute("nowPage",nowPage);
		model.addAttribute("paging2", paging2);
		model.addAttribute("paging4",paging4);
		model.addAttribute("nPage", nPage);
		model.addAttribute("id",id);

		return "/ybbs/read";

	}

	@RequestMapping(value = "/ybbs/create", method = RequestMethod.POST)
	public String create(YBbsDTO dto, HttpServletRequest request) throws Exception {

		String basePath = request.getRealPath("/storage_y");

		String fname = Utility.saveFileSpring30(dto.getFnameMF(), basePath);
		int filesize = (int) dto.getFnameMF().getSize();
		dto.setFname(fname);
		dto.setFilesize(filesize);
		
		
		if (dao.create(dto)) {
			return "redirect:/ybbs/list";
		} else {
			return "/ybbs/error";
		}

	}

	@RequestMapping(value = "/ybbs/create", method = RequestMethod.GET)
	public String create(HttpServletRequest request,YBbsDTO dto) {
		String id = request.getParameter("id");
		request.setAttribute("id", id);
//		dto.setId(id);

		return "/ybbs/create";
	}

	@RequestMapping(value = "/ybbs/delete", method = RequestMethod.POST)
	public String deleteProc(HttpServletRequest request, int ynum, Model model) {

		String oldfile = request.getParameter("oldfile");
		String basePath = request.getParameter("/storage_y");
		System.out.println("ynum:"+ynum);
		boolean flag = dao.delete(ynum);
		System.out.println("flag:"+flag);
		if (flag) {

			Utility.deleteFile(basePath, oldfile);

			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));

			return "redirect:/ybbs/list";
		} else {
			return "/ybbs/read";
		}
	}

	@RequestMapping(value = "/ybbs/delete", method = RequestMethod.GET)
	public String delete(HttpServletRequest request, YBbsDTO dto) {

//		String id = (String) request.getSession().getAttribute("id");
//		if (id == dto.getId()) 
//		{
			return "/ybbs/delete";
//		} else {
//			return "redirect:/ybbs/error";
//		}
	}

	@RequestMapping("/ybbs/list")
	public String list(HttpServletRequest request,YBbsDTO dto) {

		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
//		dto.setId("user1");

		if (col.equals("total"))
			word = "";
		// 검색관련end----------------------------

		// paging관련
		int nowPage = 1;// 현제 보이는 페이지
		if (request.getParameter("nowPage") != null)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));

		int recordPerPage = 5; // 한페이지당 보여줄 레코드 개수

		int sno = ((nowPage - 1) * recordPerPage) + 1; // 시작 페이지
		int eno = nowPage * recordPerPage; // 어디부터 어디까지 보여주겠다 =끝페이지

		// -----------------------------------------------
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		List<YBbsDTO> list = dao.list(map);

		// 전체 레코드 개수 가져오기
		int totalRecord = dao.total(map);
		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);

		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("id", dto.getId());

		return "/ybbs/list";
	}

}
