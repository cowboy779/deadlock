package www.deadlock.sts.rbbs;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import www.deadlock.model.rbbs.RbbsDAO;
import www.deadlock.model.rbbs.RbbsDTO;
import www.deadlock.utility.Utility;


@Controller
public class RbbsController {

	@Autowired
	private RbbsDAO dao;
	
	@RequestMapping("/rbbs/list")
	public String list(HttpServletRequest request) {
		
		
		
		return "/bbs/list";
	}
	
	@RequestMapping(value = "/bbs/createForm", method = RequestMethod.GET)
	public String create() {

		return "/bbs/create";
	}
	
	@RequestMapping(value = "/bbs/createForm", method = RequestMethod.POST)
	public String create(RbbsDTO dto, HttpServletRequest request) {
		
		String basePath = request.getRealPath("/storage_b");
		String filename = Utility.saveFileSpring30(dto.getFnameMF(), basePath);
		int filesize = (int) dto.getFnameMF().getSize();

		dto.setFname(filename);
		
		if (dao.create(dto)) {
			return "redirect:/bbs/list";

		} else {
			return "/bbs/error";
		}

	}
	
}
