package www.deadlock.sts.cbbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import www.deadlock.model.cbbs.CbbsDTO;
import www.deadlock.model.cbbs.ICbbsDAO;
import www.deadlock.utility.Utility;

@Controller
public class CbbsController {
	
	@Autowired
	private ICbbsDAO dao;
	
	
	@RequestMapping(value="/cbbs/ex")
  	public String ex1() {
  		return "/cbbs/ex";
  	}
	
	
	@RequestMapping(value="/cbbs/cupdate", method=RequestMethod.POST)
	public String cupdate(HttpServletRequest request, CbbsDTO dto, Model model, String oldfile) throws Exception {
		String basePath=request.getRealPath("/storage_cbbs");
		String filename=Utility.saveFileSpring30(dto.getFilenameMF(), basePath);
		int filesize=(int)dto.getFilenameMF().getSize();
	
		if(filesize>0) {
		dto.setFname(filename);
		}else {
			dto.setFname(oldfile);
		}
		
		dto.setFilesize(filesize);
		
		boolean flag=dao.update(dto);
		if(flag) {
			model.addAttribute("col",request.getParameter("col"));
			model.addAttribute("word",request.getParameter("word"));
			model.addAttribute("nowPage",request.getParameter("nowPage"));
			
			if(filesize>0)
				Utility.deleteFile(basePath, oldfile);
			
			request.getSession().setAttribute("Update", "S");
	
			request.setAttribute("cnum",request.getParameter("cnum"));
			request.setAttribute("flag",flag);
			
			return "redirect:/cbbs/list";
		}else {
			return "/cbbs/error";
		}
	}
	
	
	@RequestMapping(value="/cbbs/cupdate", method=RequestMethod.GET)
	public String cupdate(HttpServletRequest request, Model model) {
		
		
		int cnum=Integer.parseInt(request.getParameter("cnum"));
		
		String col=request.getParameter("col");
		String word=request.getParameter("word");
		String nowPage=request.getParameter("nowPage");
		

		model.addAttribute("update", "update");
		model.addAttribute("cnum", cnum);
		model.addAttribute("col",col);
		model.addAttribute("word",word);
		model.addAttribute("nowPage",nowPage);
		
		return "redirect:/cbbs/list";
		

	}
	
	@RequestMapping(value="/cbbs/ccount")
	public String ccount(HttpServletRequest request) {
		int cnum=Integer.parseInt(request.getParameter("cnum"));
		
		System.out.println("cnum:"+cnum);
		dao.upccount(cnum);
		
		return "redirect:/cbbs/list";
	}
	
	
	@RequestMapping(value="/cbbs/delete")
	public String delete(HttpServletRequest request,
			int cnum,Model model,
			String col,String word,String oldfile
			) throws Exception {
		
		String basePath = request.getRealPath("/storage_cbbs");
		
		if(dao.delete(cnum)) {
			
			model.addAttribute("cnum",cnum);
			model.addAttribute("nowPage",request.getParameter("nowPage"));
			model.addAttribute("col",col);
			model.addAttribute("word",word);
		  
			Utility.deleteFile(basePath, oldfile);
			
			return "redirect:/cbbs/list";
		}else {
			return "/cbbs/error";
		}
		
	}
	
	@RequestMapping(value="/cbbs/create",method=RequestMethod.POST)
  	public String create(CbbsDTO dto,HttpServletRequest request) throws Exception {
  	    
  		String upDir = request.getRealPath("/storage_cbbs");
    	String filename  = Utility.saveFileSpring30(dto.getFilenameMF(), upDir);
    	
    	String id=(String)request.getSession().getAttribute("id");
    	
    	int filesize = (int) dto.getFilenameMF().getSize();
    	
    	dto.setFname(filename);
    	dto.setFilesize(filesize);
    	dto.setId(id);
        
    	boolean flag = dao.create(dto);
    	
    	if(flag) {
    		return "redirect:/cbbs/list";
    	}else {
    		return "/cbbs/error";
    	}
    	
  	    } 
	
	
	@RequestMapping(value="/cbbs/create",method=RequestMethod.GET)
  	public String create() {
  		return "/cbbs/create";
  	}
	
	@RequestMapping("/cbbs/list")
	public String list(HttpServletRequest request,CbbsDTO dto, Model model) throws Exception {
		
		String id =(String)request.getSession().getAttribute("id");
        String grade =(String)request.getSession().getAttribute("grade");
		
		String str=(String)request.getSession().getAttribute("Update");
		
		if(str==null){
			str="";
		}else if(str.equals("S")){
			str="글이 수정되었습니다.";
			request.getSession().removeAttribute("Update");
		}
		
		
		
		
		
		int nowPage =1; //현재 보고있는 페이지
		
		if(request.getParameter("nowPage")!=null){
		    nowPage=Integer.parseInt(request.getParameter("nowPage"));
		}
		    

		int recordPerPage=9; //한페이지당 보여줄 레코드 갯수
		
		String col = Utility.checkNull(request.getParameter("col"));
		String word= Utility.checkNull(request.getParameter("word"));
		 
		if(col.equals("total")) word="";

		int sno= ((nowPage-1)*recordPerPage)+1;
		int eno= nowPage*recordPerPage;


		//-----------------------------------------------------


		Map map=new HashMap();
		map.put("col", col);
		map.put("word",word);

		map.put("sno",sno);
		map.put("eno",eno);

		List<CbbsDTO> list=dao.list(map);
		
		int total=dao.total(map);
	    
	
		
        String paging = Utility.paging_rbbs(total, nowPage, recordPerPage, col, word);
		
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);
		//request.setAttribute("id", "admin");
		model.addAttribute("str", str);
		
		
		return "/cbbs/list";
		
	}
	
	
	
	
	
	
	
	

}
