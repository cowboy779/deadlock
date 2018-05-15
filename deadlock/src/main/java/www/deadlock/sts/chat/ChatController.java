package www.deadlock.sts.chat;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import www.deadlock.model.chat.Chat_MessageDTO;
import www.deadlock.model.chat.Chat_RoomDTO;
import www.deadlock.model.chat.IChat_MessageDAO;
import www.deadlock.model.chat.IChat_RoomDAO;
import www.deadlock.model.member.IMemberDAO;
import www.deadlock.model.member.MemberDTO;
import www.deadlock.utility.Utility;


@Controller
public class ChatController{
	
	@Autowired
	private IChat_RoomDAO rdao;
	
//	@Autowired
//	private ChatMgr mgr;
	
	@Autowired
	private IMemberDAO dao;
	
	@Autowired
	private IChat_MessageDAO mdao;

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
		
		if(request.getSession().getAttribute("id") != null) {
			String realId = (String)request.getSession().getAttribute("id");
			String nickname = mdao.getNcikname(realId);
			request.setAttribute("nickname", nickname);
		}
		
		request.setAttribute("dto", dto);
		request.setAttribute("col", request.getParameter("col"));
		request.setAttribute("word", request.getParameter("word"));
		request.setAttribute("nowPage", request.getParameter("nowPage"));
		
		return "chat/chatRead";
	}
	
	@RequestMapping("/chat/chat_write")
	public String chat_write(HttpServletRequest request) {
		String nickname = request.getParameter("nickname");
		String msg = request.getParameter("msg");
		int chat_index = Integer.parseInt(request.getParameter("chat_index"));
		
		try {
			URLDecoder.decode(nickname, "UTF-8");
			URLDecoder.decode(msg, "UTF-8");
			
			Chat_MessageDTO dto = new Chat_MessageDTO();
			dto.setChat_index(chat_index);
			dto.setChat_content(msg);
			dto.setNickname(nickname);
			
			mdao.create(dto);
			request.setAttribute("nickname", nickname);
			request.setAttribute("msg", msg);
			
			return "/chat/chat_write";
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "/chat/error";
		}
		
	}
	
	@RequestMapping("/chat/chat_time")
	public String getTime(HttpServletRequest request) {
		try {
			String realtime = mdao.getRealTime();
			request.setAttribute("realtime", realtime);
			return "/chat/chat_write";
		}catch(Exception e){
			e.printStackTrace();
			return "/chat/error";
		}
	}
	
	@RequestMapping("/chat/chat_proc")
	public String chat_proc(HttpServletRequest request) {
		int count = 0;
		int chat_index = Integer.parseInt(request.getParameter("chat_index"));
		
		try {
			
			count = mdao.insert_check(chat_index);
			request.setAttribute("count", count);
			return "/chat/chat_write";
			
		}catch(Exception e) {
			e.printStackTrace();
			return "/chat/error";
		}
	}
	
	@RequestMapping("/chat/chat_check")
	public String chat_check(HttpServletRequest request) {
		int table_cnt = Integer.parseInt(request.getParameter("table_cnt"));
		int chat_index = Integer.parseInt(request.getParameter("chat_index"));
		boolean flag = false;
		try {
			
			mdao.insert_check(chat_index);
			if(table_cnt != chat_index) {
				flag = true;
				request.setAttribute("flag", flag);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "/chat/error";
		}
		
		return "/chat/chat_write";
		
	}
	
	@RequestMapping("/chat/chat_show")
	public String chat_show(HttpServletRequest request) {
		//아마 필요가 없게 될 것 같다. 일단 보류
//		int table_cnt = Integer.parseInt(request.getParameter("table_cnt"));
		
		int chat_index = Integer.parseInt(request.getParameter("chat_index"));
		String finalDate = request.getParameter("finalDate");
		
		Map map = new HashMap(); 
		map.put("chat_index", chat_index);
		map.put("finalDate", finalDate);
		
		try {
			boolean cflag = mdao.Canyou_Seethem(map);
			if(cflag) {
				
			List list = mdao.Chat_content_read(map);
			
			
//			String nickname = dto.getNickname();
//			String chat_content = dto.getChat_content();
			
//			request.setAttribute("nickname", nickname);
//			request.setAttribute("msg", chat_content);
			request.setAttribute("cflag", cflag);
			
			request.setAttribute("list", list);
			}
			
			return "/chat/chat_write";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "/chat/error";
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
