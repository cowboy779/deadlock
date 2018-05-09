package www.deadlock.sts.qbbs;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import www.deadlock.model.qbbs.QbbsDAO;
import www.deadlock.model.qbbs.QbbsDTO;

@Controller
public class QbbsController {

		
	@Autowired
	private QbbsDAO qdao;
	
	
	
	@RequestMapping(value="/qbbs/update", method=RequestMethod.GET)
	public String update() {
		return "/qbbs/update";
	}
	
	
	@RequestMapping(value="/qbbs/create", method=RequestMethod.GET)
	public String create() {
		return "/qbbs/create";
	}
	
	@RequestMapping(value="/qbbs/create", method=RequestMethod.POST)
	public String create(HttpServletRequest request, QbbsDTO dto) {
		String basePath=request.getRealPath("/storage_qbbs");
		String filename=www.deadlock.utility.Utility.saveFileSpring30(dto.getFilenameMF(), basePath);
		int filesize=(int) dto.getFilenameMF().getSize();
		
		dto.setFname(filename);
		dto.setFilesize(filesize);
		
		if(qdao.create(dto)) {
			return "redirect:/qbbs/list";
		}else {
			return "/qbbs/error";
		}
	}
}
