package www.deadlock.sts.qbbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import www.deadlock.model.member.MemberDTO;
import www.deadlock.model.qbbs.IQbbsDAO;
import www.deadlock.model.qbbs.IQrecoDAO;
import www.deadlock.model.qbbs.QbbsDTO;
import www.deadlock.model.qbbs.QbbsMgr;
import www.deadlock.model.qbbs.QrecoDTO;
import www.deadlock.utility.Utility;

@Controller
public class QbbsController {

		
	@Autowired
	private IQbbsDAO qdao;
	
	@Autowired
	private IQrecoDAO qrdao;
	
	@Autowired
	private QbbsMgr mgr;
	
	
	
	@RequestMapping("qbbs/updateProc")
	public String updateProc(HttpServletRequest request, QbbsDTO dto, Model model, String oldfile) throws Exception {
		String basePath=request.getRealPath("/storage_qbbs");
		
		String filename=Utility.saveFileSpring30(dto.getFilenameMF(), basePath);
		int filesize=(int)dto.getFilenameMF().getSize();
	
		if(filesize>0) {
		dto.setFname(filename);
		}else {
			dto.setFname(oldfile);
		}
		
		dto.setFilesize(filesize);

		
			boolean flag=qdao.update(dto);
			if(flag) {
				model.addAttribute("qnum",request.getParameter("qnum"));
				model.addAttribute("col",request.getParameter("col"));
				model.addAttribute("word",request.getParameter("word"));
				model.addAttribute("nowPage",request.getParameter("nowPage"));
			Utility.deleteFile(basePath, oldfile);
			request.getSession().setAttribute("Update", "S");

			model.addAttribute("flag",flag);
			return "/qbbs/updateProc";
		}else {
			return "/qbbs/error";
		}
	}
	
	
	@RequestMapping("/qbbs/update")
	public String update(Model model, int qnum, HttpServletRequest request) throws Exception {
		
		String col=request.getParameter("col");
		String word=request.getParameter("word");
		String nowPage=request.getParameter("nowPage");
		
		QbbsDTO dto=(QbbsDTO) qdao.read(qnum);
		
		String content=dto.getContent();
		content=content.replaceAll("<br>", "\r\n");
		
		
		model.addAttribute("dto",dto);
		model.addAttribute("qnum",qnum);
		model.addAttribute("col",col);
		model.addAttribute("word",word);
		model.addAttribute("nowPage",nowPage);
		model.addAttribute("content",content);
		
		
		return "/qbbs/update";
	}
	

	
	
	@RequestMapping("/qbbs/delete")
	public String delete(HttpServletRequest request, Model model, String oldfile,QrecoDTO rdto ) throws Exception {
		String basePath=request.getRealPath("/storage_qbbs");
		int qnum=Integer.parseInt(request.getParameter("qnum"));
			
		if(mgr.delete(qnum)) {
					
			Utility.deleteFile(basePath, oldfile);
						
			model.addAttribute("col",request.getParameter("col"));
			model.addAttribute("word",request.getParameter("word"));
			model.addAttribute("nowPage",request.getParameter("nowPage"));
				
			return "redirect:/qbbs/list";
		}
					
			return "/qbbs/error";

	}
	

	@RequestMapping("/qbbs/rdelete")
	public String rdelete(Model model, int qrnum, int qnum, String nowPage, String col, String word, int nPage) throws Exception {
		int recordPerPage=5;
		int sno=((nPage-1)*recordPerPage)+1;
		int eno=nPage*recordPerPage;
		
		Map map=new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("qnum",qnum);
		
		int total=qrdao.total(map);
		int totalPage=(int) (Math.ceil((double)total/5));
		
		if(qrdao.delete(qrnum)) {

			
			if(nPage!=1&&nPage==totalPage&&total%5==1) nPage=nPage-1;
			model.addAttribute("qnum",qnum);
			model.addAttribute("nowPage",nowPage);
			model.addAttribute("col",col);
			model.addAttribute("word",word);
			model.addAttribute("nPage",nPage);
			
			return "redirect:/qbbs/read";
			
		}else {
			return "/qbbs/error/";
		}
		
	}
	
	
	
	@RequestMapping("/qbbs/rupdate")
	public String rupdate(QrecoDTO dto, Model model, String nowPage, String col, String word, String nPage) throws Exception {
		if(qrdao.update(dto)) {
			model.addAttribute("qnum",dto.getQnum());
			model.addAttribute("nowPage",nowPage);
			model.addAttribute("col",col);
			model.addAttribute("word",word);
			model.addAttribute("nPage",nPage);
			
			return "redirect:/qbbs/read";
		}else {
			return "/bbs/error";
		}
	}
	
	
	@RequestMapping("/qbbs/rcreate")
	public String rcreate(QrecoDTO dto, Model model, int nowPage, String col, String word) throws Exception {
		if(qrdao.create(dto)) {
			
			
			model.addAttribute("qnum",dto.getQnum());
			model.addAttribute("nowPage",nowPage);
			model.addAttribute("col",col);
			model.addAttribute("word",word);
			
			return "redirect:/qbbs/read";
		}else {
			return "/qbbs/error";
		}
	}
	
	
	
	@RequestMapping("/qbbs/read")
	public String read(HttpServletRequest request, int qnum, QbbsDTO dto, Model model, QrecoDTO rdto) throws Exception {
	
		qdao.upcount(qnum);
		dto=(QbbsDTO) qdao.read(qnum);
		
		
		String str=(String)request.getSession().getAttribute("Update");
		if(str==null){
			str="";
		}else if(str.equals("S")){
			str="글이 수정되었습니다.";
			request.getSession().removeAttribute("Update");
		}
		
		
		String content=dto.getContent();
		content=content.replaceAll("\r\n", "<br>");
		
		dto.setId("admin");
		rdto.setId("admin");
		
		
		//검색관련
		String col=Utility.checkNull(request.getParameter("col"));
		String word=Utility.checkNull(request.getParameter("word"));

		if(col.equals("total")) word="";
		
		
		//댓글페이징관련
		String url="read";
		int nPage=1;
		if(request.getParameter("nPage")!=null) {
			nPage=Integer.parseInt(request.getParameter("nPage"));
		}
		int recordPerPage=5;
		int sno=((nPage-1)*recordPerPage)+1;
		int eno=nPage*recordPerPage;
		
		Map map=new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("qnum",qnum);

		
		List qrlist= qrdao.list(map);
		List list=qdao.list(map);
		
		int total=qrdao.total(map);

		int nowPage=Integer.parseInt(request.getParameter("nowPage"));
		
		String paging=Utility.paging2(total, nPage, recordPerPage, url, qnum, nowPage, col, word);
		
		
		model.addAttribute("qrlist", qrlist);
		model.addAttribute("paging", paging);
		model.addAttribute("nPage", nPage);
		model.addAttribute("rdto",rdto);
		
		model.addAttribute("str", str);

		model.addAttribute("qnum",qnum);
		model.addAttribute("dto",dto);
		model.addAttribute("content",content);
		model.addAttribute("nowPage",nowPage);
		model.addAttribute("col",col);
		model.addAttribute("word",word);
		
		model.addAttribute("list",list);
		//model.addAttribute("paging2",paging2);

		
		return"/qbbs/read";
	}
	
	
	@RequestMapping(value="/qbbs/create", method=RequestMethod.GET)
	public String create(HttpServletRequest request, MemberDTO dto){
		
		dto.setId("admin");
		//String id=dto.getId();
		//request.setAttribute("id",id);
		
		return "/qbbs/create";
	}
	
	@RequestMapping(value="/qbbs/create", method=RequestMethod.POST)
	public String create(HttpServletRequest request, QbbsDTO dto) throws Exception {
		
		String basePath=request.getRealPath("/storage_qbbs");
		String filename=Utility.saveFileSpring30(dto.getFilenameMF(), basePath);
		int filesize=(int) dto.getFilenameMF().getSize();
		
		if(filesize>0) {
			dto.setFname(filename);
			dto.setFilesize(filesize);
		}else {
			dto.setFname("default.jpg");
			dto.setFilesize(filesize);
		}
		
		
		
		dto.setId("admin");
		
		boolean flag=qdao.create(dto);

		
		if(flag) {
			return "redirect:/qbbs/list";
		}else {
			return "/qbbs/error";
		}
		
	}
	
	
	@RequestMapping("/qbbs/list")
	public String list(HttpServletRequest request, Model model, QbbsDTO dto) throws Exception {
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
