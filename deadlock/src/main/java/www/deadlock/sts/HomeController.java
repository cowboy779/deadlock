package www.deadlock.sts;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/home";
	}
	
	@RequestMapping(value="/template/about")
	public String about() {
		
		return "/template/about";
	}
	
	@RequestMapping(value="/template/gintro")
	public String intro() {
		
		return "/template/gintro";
	}
	
	@RequestMapping(value="/game/top")
	public String start() {
		
		return "/game/top";
	}
	
	
	
	@RequestMapping(value="/game/1")
	public String first(HttpServletRequest request) {
		String ans = request.getParameter("ans");
		request.setAttribute("next", 2);
		return "/game/1";
	}
	@RequestMapping(value="/game/2")
	public String second(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		String ans = request.getParameter("ans");
		if(ans.equals("벽돌깨기")) {
			return "/game/2";
		}else {
			return "/game/1";
		}
	}
	@RequestMapping(value="/game/3")
	public String third(HttpServletRequest request) {
		String ans = request.getParameter("ans");
		if(ans.equals("Red")||ans.equals("red")){
			return "/game/3";
		}else {
			return "/game/2";
		}
	}
	@RequestMapping(value="/game/4")
	public String four(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		String ans = request.getParameter("ans");
		if(ans.equals("제목없음")) {
			return "/game/4";
		}else {
			return "/game/3";
		}
	}
	@RequestMapping(value="/game/5")
	public String fif(HttpServletRequest request) {
		String ans = request.getParameter("ans");
		if(ans.equals("Anna")) {
			return "/game/5";
		}else {
			return "/game/4";
		}
	}
	@RequestMapping(value="/game/6")
	public String six(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		String ans = request.getParameter("ans");
		if(ans.equals("김도훈")) {
			return "/game/6";
		}else {
			return "/game/5";
		}
	}
	@RequestMapping(value="/game/7")
	public String sev(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		String ans = request.getParameter("ans");
		if(ans.equals("마지막")) {
			return "/game/7";
		}else {
			return "/game/6";
		}
	}
	
	
}
