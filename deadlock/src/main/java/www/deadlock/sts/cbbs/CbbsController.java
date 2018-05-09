package www.deadlock.sts.cbbs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import www.deadlock.model.cbbs.CbbsDAO;

@Controller
public class CbbsController {
	
	@Autowired
	private CbbsDAO dao;
	
	
	

}
