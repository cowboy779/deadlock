package www.deadlock.sts.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import www.deadlock.model.member.IMemberDAO;

@Controller
public class MemberController {
	
	@Autowired
	private IMemberDAO dao;
	
	//메일 전송을 위한 객체 선언
	@Autowired
	private JavaMailSender mailSender;
	
	//mailForm
	@Requestmapping(value="/member/sendMail")
	
	
	@RequestMapping("/member/agreement")
	public String agreement() {
		return "/member/agreement";
	}
	
	@RequestMapping("/member/createForm")
	public String create() {
		return "/member/create";
	}
	
	@RequestMapping("/member/deleteForm")
	public String delete() {
		return "/member/delete";
	}
	
	//현재 진행중인 소스 부분
	//메일 보내는 부분에서 현재 막혀있다.
	//https://m.blog.naver.com/PostView.nhn?blogId=racoon_z&logNo=220695568817&proxyReferer=https%3A%2F%2Fwww.google.co.kr%2F
	@RequestMapping("/member/email_Form")
	public String email_form() {
		
		return "/member/email_form";
	}
	
	@RequestMapping("/member/email_proc")
	public String email_proc() {
		
		return "/member/email_proc";
		
	}
	
	@RequestMapping("/member/email_proc_send")
	public String email_proc_send() {
		
		return "/member/email_proc_send";
	}
	//현재 진행중인 소스 부분
	
	
	@RequestMapping("/member/id_form")
	public String id_form() {
		
		return "/member/id_form";
	}
	
	@RequestMapping("/member/id_proc")
	public String id_proc(HttpServletRequest request) throws Exception {
		String id = request.getParameter("id");
		boolean flag = dao.duplicateId(id);
		
		request.setAttribute("flag", flag);
		
		return "/member/id_proc";
	}
	
	@RequestMapping("/member/loginForm")
	public String loginForm() {
		
		return "/member/loginForm";
	}
	
	@RequestMapping("/member/logout")
	public String logout() {
		
		return "/member/logout";
	}
	
	@RequestMapping("/member/passwordCheck")
	public String passwordCheck() {
		
		return "/member/passwordCheck";
	}
	
	@RequestMapping("/member/read")
	public String read() {
		
		return "/member/read";
	}
	
	
	
	
}
