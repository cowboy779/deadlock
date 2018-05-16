package www.deadlock.sts.cbbs;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.synth.SynthSeparatorUI;

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
	
	@RequestMapping(value="/cbbs/cupdate", method=RequestMethod.POST)
	public String cupdate(Model model, HttpServletRequest request) {
		
		int cnum=Integer.parseInt(request.getParameter("cnum"));
		System.out.println("update test");
		boolean flag = false;
		try {
			CbbsDTO dto = (CbbsDTO)dao.read(cnum);
			flag = dao.update(dto);
			
			model.addAttribute("update","update");
			model.addAttribute("cnum",cnum);
			//update 됐고 확인해야한다 .. ..응.. input 이 안간것같아 
			return "redirect:/cbbs/list";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		

		
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
    	
    	int filesize = (int) dto.getFilenameMF().getSize();
    	
    	dto.setFname(filename);
    	dto.setFilesize(filesize);
        dto.setId("test");
        
    	
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
	public String list(HttpServletRequest request,CbbsDTO dto) throws Exception {
		
		
		
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
	    
	
		
        String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);
		
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);
		request.setAttribute("id", "admi");
		
		
		return "/cbbs/list";
		
	}
	
	
	
	
	
	
	
	

}
