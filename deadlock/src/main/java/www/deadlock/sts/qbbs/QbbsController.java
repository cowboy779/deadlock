package www.deadlock.sts.qbbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import www.deadlock.model.member.MemberDTO;
import www.deadlock.model.qbbs.IQbbsDAO;
import www.deadlock.model.qbbs.QbbsDTO;
import www.deadlock.utility.Utility;

@Controller
public class QbbsController {

		
	@Autowired
	private IQbbsDAO qdao;
	
	
	
	
	
	@RequestMapping(value="/qbbs/update", method=RequestMethod.GET)
	public String update() {
		return "/qbbs/update";
	}
	
	
	@RequestMapping(value="/qbbs/create", method=RequestMethod.GET)
	public String create(HttpServletRequest request, MemberDTO dto){
		
		dto.setId("admin");
		String id=dto.getId();
		request.setAttribute("id",id);
		
		return "/qbbs/create";
	}
	
	@RequestMapping(value="/qbbs/create", method=RequestMethod.POST)
	public String create(HttpServletRequest request, QbbsDTO dto) throws Exception {
		
		String basePath=request.getRealPath("/storage_qbbs");
		String filename=Utility.saveFileSpring30(dto.getFilenameMF(), basePath);
		int filesize=(int) dto.getFilenameMF().getSize();
		
		dto.setFname(filename);
		dto.setFilesize(filesize);
		
		boolean flag=qdao.create(dto);

		
		if(flag) {
			return "redirect:/qbbs/list";
		}else {
			return "/qbbs/error";
		}
		
	}
	
	
	@RequestMapping("/qbbs/list")
	public String list(HttpServletRequest request, Model model) throws Exception {
		//검색관련
		String col=Utility.checkNull(request.getParameter("col"));
		String word=Utility.checkNull(request.getParameter("word"));

		if(col.equals("total")) word="";
		
		//페이징관련
		int nowPage=1;
		int recordPerPage=5;
		
		if(request.getParameter("nowPage")!=null)
			nowPage=Integer.parseInt(request.getParameter("nowPage"));
		
		int sno=((nowPage-1)*recordPerPage)+1;
		int eno=nowPage*recordPerPage;
		
		Map map=new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		int qnum=0;
		if(request.getParameter("qnum")!=null)
			qnum=Integer.parseInt(request.getParameter("qnum"));
		
		List<QbbsDTO> list=qdao.list(map);
		
		int totalRecord=qdao.total(map);
		
		String paging=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
		
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		
		return "/qbbs/list";
	}
}
