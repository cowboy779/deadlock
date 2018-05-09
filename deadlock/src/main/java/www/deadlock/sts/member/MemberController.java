package www.deadlock.sts.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import www.deadlock.model.member.IMemberDAO;

@Controller
public class MemberController {
	
	@Autowired
	private IMemberDAO dao;
	
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
	
	@RequestMapping("/member/email_Form")
	public String email_form() {
		
		return "/member/email_form";
	}
	
	@RequestMapping("/member/email_proc")
	public String email_proc() {
		return "/member/email_proc";
	}
	
	@RequestMapping("/member/id_Form")
	public String id_form() {
		
		return "/member/id_Form";
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
