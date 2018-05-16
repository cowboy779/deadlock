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

import www.deadlock.model.pbbs.PBbsDAO;
import www.deadlock.model.pbbs.PBbsDTO;
import www.deadlock.utility.Utility;


@Controller
public class PbbsController {

	@Autowired
	private PBbsDAO dao;
	
	@RequestMapping("/pbbs/delete")
    public String delete(@ModelAttribute int bnum) {
 
        dao.delete(bnum);
 
        // 리스트 갱신
        return "redirect:/pbbs/list";
    }
 
    @RequestMapping("/pbbs/update")
    public String update(PBbsDTO dto) {
    
    	dao.update(dto);
        return "redirect:/pbbs/list";
    }
	
	
	  @RequestMapping("/pbbs/view")
	    public String view(int bnum, String passwd, Model model) {
		  Map map = new HashMap();
	        // 비밀번호가 맞는지 체크
	        int result = dao.passwdCheck(bnum, passwd);
	 
	        if (result>0) {
	            // 맞으면 view.jsp 로 이동(수정/삭제화면)
	            model.addAttribute("dto", dao.ybDetail(bnum));
	            
	            //view.jsp 에서 수정 삭제 할 수 있다.
	            return "/pbbs/view";
	 
	        } else {
	 
	            // 틀리면
	            model.addAttribute("message", "비밀번호가 일치하지 않습니다");
	            return "redirect:/pbbs/list";
	        }
	 
	    }
	
	
	
	
	@RequestMapping("/pbbs/list")
	public void list(Model model,HttpServletRequest request) {
		
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
		
		
		List<PBbsDTO> list = dao.list(map);
		
		int totalRecord = dao.total(map);
		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
		
		model.addAttribute("list",list);
//		model.addAttribute("listsize",list.size());
		model.addAttribute("paging",paging);
		System.out.println("리스트"+list);
		
	}
	
	
	
	@RequestMapping("/pbbs/create")
    public String write(@ModelAttribute PBbsDTO dto, Model model) {
 
        // 입력한 내용이 없을때
        if (dto.getBname() == null) {
 
           
            return "/pbbs/create";
        } else {
            // 입력한 내용이 있을때
            // 테이블에 insert
            // 목록 갱신
 
        	dao.create(dto);
                //입력후 리스트로 이동
            return "redirect:/pbbs/list";

        }
	}
}
