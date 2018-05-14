package www.deadlock.sts.chat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import www.deadlock.utility.*;
import www.deadlock.model.chat.ChatMgr;
import www.deadlock.model.chat.Chat_RoomDTO;
import www.deadlock.model.chat.IChat_MessageDAO;
import www.deadlock.model.chat.IChat_RoomDAO;
import www.deadlock.model.member.IMemberDAO;
import www.deadlock.model.member.MemberDTO;


@Controller
public class ChatController{
	
	@Autowired
	private IChat_RoomDAO rdao;
	
//	@Autowired
//	private ChatMgr mgr;
	
	@Autowired
	private IMemberDAO dao;
	
//	@Autowired
//	private IChat_MessageDAO mdao;

	@RequestMapping("/chat/chatCreate")
	public String chatCreate(HttpServletRequest request) throws Exception {
		
		String id = (String)request.getSession().getAttribute("id");
		MemberDTO dto = dao.read(id);
		String chat_nickname = dto.getMname();
		request.setAttribute("chat_nickname", chat_nickname);
		
		return "/chat/chatCreate";
	}
	
	@RequestMapping("/chat/chatCreateProc")
	public String chatCreateProc(Chat_RoomDTO dto, HttpServletRequest request) throws Exception {
		
		if(rdao.create(dto)) {
			return "redirect:/chat/list";
		}else {
			return "/chat/error";
		}
		
	}
	
	@RequestMapping("/chat/list")
	public String chatList(HttpServletRequest request) throws Exception {
		
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		
		if(col.equals("total")) {
			word = "";
		}
		
		int nowPage = 1;
		int recordPerPage = 5;
		
		if(request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		int sno = ((nowPage-1)*recordPerPage)+1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("col", col);
		map.put("word", word);
		
		List list = rdao.list(map);

		int totalRecord = rdao.total(map);
		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
		
		int i = 0;
		
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("i", i);
		
		
		return "/chat/list";
	}
	
	@RequestMapping("/chat/chatRead")
	public String chatRead(HttpServletRequest request) throws Exception {
		int chat_index = Integer.parseInt(request.getParameter("chat_index"));
		
		Chat_RoomDTO dto = (Chat_RoomDTO) rdao.read(chat_index);
		
		request.setAttribute("dto", dto);
		request.setAttribute("col", request.getParameter("col"));
		request.setAttribute("word", request.getParameter("word"));
		request.setAttribute("nowPage", request.getParameter("nowPage"));
		
		return "chat/chatRead";
	}
	
}
