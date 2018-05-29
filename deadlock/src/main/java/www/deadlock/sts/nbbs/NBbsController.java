package www.deadlock.sts.nbbs;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import www.deadlock.model.nbbs.NBbsDAO;
import www.deadlock.model.nbbs.NBbsDTO;
import www.deadlock.utility.Utility;

@Controller
public class NBbsController {
	
	@Autowired
	private NBbsDAO dao;
	
	
	@RequestMapping(value="/nbbs/create",method=RequestMethod.GET)
	public String create() {	
		return "/nbbs/createForm";
	}
	
	@RequestMapping(value="/nbbs/create",method=RequestMethod.POST)
	public String create(HttpServletRequest request,NBbsDTO dto) {
		boolean flag = false;
		
		String basePath = request.getRealPath("/storage_nbbs");
		String fname = Utility.saveFileSpring30(dto.getFnameMF(), basePath);
		dto.setFname(fname);
		try {
			flag = dao.create(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(flag) {
			return "redirect:/nbbs/list";   //			redirect로 넘겨줘야 url로 요청하는 것이 된다
		}else {
			return "error";
		}
	}
	
	@RequestMapping(value="/nbbs/read", method=RequestMethod.GET)
	public String read(HttpServletRequest request,Model model) {
		
		//request.getSession().setAttribute("grade", "A"); //--------나중에 삭제 
		
		//grade 받아오기
		String grade = (String)request.getSession().getAttribute("grade");
		
		int nnum = Integer.parseInt(request.getParameter("nnum"));
		NBbsDTO dto;
		try {
			dto = (NBbsDTO)dao.read(nnum);
			
			String content = dto.getContent();
			content = content.replaceAll("\r\n", "<br>");

			dao.upViewcnt(nnum);

			model.addAttribute("dto", dto);
			model.addAttribute("content", content);
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			model.addAttribute("grade",grade);
			
			if(request.getAttribute("pwError")!=null) {
				model.addAttribute("pwError",request.getAttribute("pwError"));
			}
			
			
			return "/nbbs/read";
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "/nbbs/error";
		}

	}
	
	@RequestMapping(value="/nbbs/fix",method=RequestMethod.POST)
	public String fixNotice(HttpServletRequest request,Model model) {
		//상단고정
		//int[] fixed = {71,72,73};
		String[] fix = request.getParameterValues("fix");
		if( dao.upfix(fix)) {
			return "redirect:/nbbs/list";	
		}else {
			return "error";
		}
		
		
	}

	
	@RequestMapping(value="/nbbs/list" )
	public String list(HttpServletRequest request,Model model) {
		
		//grade 받아오기
		//request.getSession().setAttribute("grade", "A"); //--------나중에 삭제 
		String grade = (String)request.getSession().getAttribute("grade");

		//체크-----
		List<String> arrChk = new ArrayList<String>();
		 //클라이언트에서 넘긴 데이터 받기 
		if(request.getParameterValues("test[]")!=null) {
			String[] arr = request.getParameterValues("test[]");    
			
			for(int i=0; i<arr.length; i++) {
				System.out.println("test: " + arr[i]);	
				arrChk.add(arr[i]);
			}
			request.setAttribute("arr", arr);
		}
		
        model.addAttribute("arrChk", arrChk);
        
		//검색관련
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		
		if(col.equals("total")) word = "";

		//페이징관련
		int nowPage = 1;
		int recordPerPage = 5;
		if(request.getParameter("nowPage")!=null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		//db에서 가져올 순번
		int sno = ((nowPage - 1) * recordPerPage) +1;
		int eno = nowPage * recordPerPage;

		//dao메소드 호출
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		List<NBbsDTO> fixlist = dao.fixlist();
		
		List<NBbsDTO> list = dao.list(map);

		int totalRecord = dao.total(map);
		//페이징 출력 메소드
		String paging = Utility.pagingNbbs(totalRecord, nowPage, recordPerPage, col, word );
		
		request.setAttribute("fixlist", fixlist);
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("today", new Date());
		request.setAttribute("grade", grade);
	
		
		return "/nbbs/list";
	}
	
	@RequestMapping(value="/nbbs/delete")
	public String delete(HttpServletRequest request,int nnum) {
		
		try {
			if(dao.delete(nnum)) {
				return "redirect:/nbbs/list";
			}else {
				return "nbbs/error";
			}
		} catch (Exception e) {	
			e.printStackTrace();
			return "nbbs/error";
		}
	
	}
	
	
	@RequestMapping(value="/nbbs/update",method=RequestMethod.GET)
	public String update(HttpServletRequest request,int nnum,String passwd,Model model) {	
		
		NBbsDTO dto;
		boolean pflag = false; // false로 바꿔야함
		String id = (String)request.getSession().getAttribute("id");
		System.out.println("id: " + id + "passwd:" + passwd);
		
		Map map = new HashMap();
		map.put("id", id);
		map.put("passwd",passwd.trim());
		
		
		try {
			//멤버있어야함
			pflag = dao.passwdCheck(map);
			if(pflag) {
			dto = (NBbsDTO)dao.read(nnum);
			request.setAttribute("dto", dto);
			return "nbbs/updateForm";
			}else {
				
			String pwError = "ERROR : 비밀번호 오류 ";
			model.addAttribute("nnum", nnum);
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			model.addAttribute("pwError", pwError);
			
			return "redirect:/nbbs/read";
		}
			
		} catch (Exception e) {
			e.printStackTrace();
			return "nbbs/error"; 
		}

	}
	
	@RequestMapping(value="/nbbs/update",method=RequestMethod.POST)
	public String update(HttpServletRequest request,NBbsDTO dto,MultipartFile fnameMF) {

		boolean flag = false;

		
		String basePath = request.getRealPath("/storage_nbbs");
		String fname = Utility.saveFileSpring30(fnameMF, basePath);
		dto.setFname(fname);
		
		try {
			flag = dao.update(dto);
			if(flag) {
				return "redirect:/nbbs/list";   
			}else {
				return "error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		

	}

	/**
     * 이미지 업로드
     * @param request
     * @param response
     * @param upload
    */
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public void communityImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
    	System.out.println("log : " + "test");
    	
        OutputStream out = null;
        PrintWriter printWriter = null;
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
 
        try{
 
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();
            String uploadPath = request.getRealPath("ckstorage");//저장경로
 
            out = new FileOutputStream(new File(uploadPath));
            out.write(bytes);
            String callback = request.getParameter("CKEditorFuncNum");
 
            printWriter = response.getWriter();
            String fileUrl = uploadPath + fileName;//url경로
 
            printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
                    + callback
                    + ",'"
                    + fileUrl
                    + "','이미지를 업로드 하였습니다.'"
                    + ")</script>");
            printWriter.flush();
  
        }catch(IOException e){
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
 
        return;
    }	


}
