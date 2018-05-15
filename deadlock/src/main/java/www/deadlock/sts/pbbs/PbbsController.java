package www.deadlock.sts.pbbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import www.deadlock.model.pbbs.PBbsDAO;
import www.deadlock.model.pbbs.PBbsDTO;
import www.deadlock.utility.Utility;

@Controller
public class PbbsController {

	@Autowired
	private PBbsDAO dao;
	
	@RequestMapping("/pbbs/bcreate")
	public String create(PBbsDTO dto, Model model, String nowPage, String col, String word) {
		if (dao.create(dto)) {

			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("bnum", dto.getBnum());

			return "redirect:/pbbs/list";
		} else {
			return "pbbs/error";
		}

	}

	
	@RequestMapping("/pbbs/list")
	public String list(HttpServletRequest request) {

		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

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

		List<PBbsDTO> blist = dao.list(map);

		// 전체 레코드 개수 가져오기
		int totalRecord = dao.total(map);
		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);

		request.setAttribute("blist", blist);
		request.setAttribute("paging", paging);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);

		return "/pbbs/list";
	}

}
