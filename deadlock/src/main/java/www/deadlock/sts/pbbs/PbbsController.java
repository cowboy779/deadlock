package www.deadlock.sts.pbbs;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import www.deadlock.model.pbbs.PBbsDAO;
import www.deadlock.model.pbbs.PBbsDTO;
import www.deadlock.utility.Utility;


@Controller
public class PbbsController {

	@Autowired
	private PBbsDAO dao;
	
	@RequestMapping("/pbbs/delete")
    public String delete(int bnum) {
 
        dao.ydelete(bnum);
        // 리스트 갱신
        return "redirect:/pbbs/list";
    }
 
    @RequestMapping("/pbbs/update")
    public String update(PBbsDTO dto,HttpServletRequest request,Model model) {
    	dao.yupdate(dto);
        return "redirect:/pbbs/list";
    }
	
	
	  @RequestMapping("/pbbs/view")
	    public String real_update(HttpServletRequest request,Model model) {
		  int bnum = Integer.parseInt(request.getParameter("bnum"));
		  ModelAndView modelAndView = new ModelAndView(new MappingJacksonJsonView());
		  model.addAttribute("dto", dao.ybDetail(bnum));
		  modelAndView.addObject("bnum",bnum);
	
		  
	      return "/pbbs/view";
	 
	    }
	 @RequestMapping("/pbbs/passwd_check")
	 public ModelAndView passwd_check(HttpServletRequest request) {
		 
		  int bnum = Integer.parseInt(request.getParameter("bnum"));
		  String passwd = request.getParameter("passwd");
		  
		  ModelAndView modelAndView = new ModelAndView(new MappingJacksonJsonView());
	        // 비밀번호가 맞는지 체크
	        boolean flag = dao.passwdCheck(bnum, passwd);
	 
	            // 맞으면 view.jsp 로 이동(수정/삭제화면)
	            modelAndView.addObject("flag", flag);
	            modelAndView.addObject("bnum", bnum);
	            //view.jsp 에서 수정 삭제 할 수 있다.
	            return modelAndView;
	 }
	
	
	
	
	@RequestMapping("/pbbs/list")
	public String list(Model model,HttpServletRequest request) throws Exception {
		
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
		
		
		List<PBbsDTO> list = dao.ylist(map);
		
		int totalRecord = dao.total(map);
		String paging3 = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
		
		request.setAttribute("ylist",list);
		request.setAttribute("ylistsize",list.size());
		request.setAttribute("paging3",paging3);
		System.out.println("리스트"+list);
		
		return "/pbbs/list";
		
	}
	
	
	
	@RequestMapping("/pbbs/create")
    public ModelAndView write(@ModelAttribute PBbsDTO dto, Model model) {
		  ModelAndView modelAndView = new ModelAndView(new MappingJacksonJsonView());
       
        	boolean flag = dao.ycreate(dto);
            modelAndView.addObject("flag", flag);       
          
            return modelAndView;

        }
	
}
