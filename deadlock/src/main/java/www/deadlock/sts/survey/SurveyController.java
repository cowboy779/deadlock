package www.deadlock.sts.survey;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import www.deadlock.model.member.IMemberDAO;
import www.deadlock.model.survey.ISurveyItemDAO;
import www.deadlock.model.survey.SurveyItemDTO;


@Controller
public class SurveyController {
	
	@Autowired
	private ISurveyItemDAO dao;
	
	@Autowired
	private IMemberDAO mdao;
	
	@RequestMapping("/survey/create")
	public String create() {
		
		return "/survey/createForm";
	}
	
	@RequestMapping("/survey/createProc")
	public ModelAndView createProc(SurveyItemDTO dto, HttpServletRequest request,Model model) {
		ModelAndView modelAndView = new ModelAndView(new MappingJacksonJsonView());
		try {
			boolean grade_flag = true;
			request.setCharacterEncoding("UTF-8");
			if(dto.getContent().equals("다잉메세지")) dto.setNum(1);
			if(dto.getContent().equals("다크솔데스크")) dto.setNum(2);
			if(dto.getContent().equals("도리를찾아서")) dto.setNum(3);
			if(dto.getContent().equals("도레미'솔'")) dto.setNum(4);
			if(dto.getContent().equals("심리테스트")) dto.setNum(5);
			
			dto.setId((String)request.getSession().getAttribute("id"));
			
			boolean id_flag = dao.dupSurvey(dto.getId());
			if(id_flag == false) {
				if(mdao.getGrade(dto.getId()).equals("n")) {
					grade_flag = false;
				}else {
					dao.surveyUpdate(dto.getId());
					dao.create(dto);
					if(mdao.getGrade(dto.getId()).equals("S"))
						mdao.updateGrade_V(dto.getId());
					request.setAttribute("num", dto.getNum());
					modelAndView.addObject("num",dto.getNum());
					modelAndView.addObject("content",dto.getContent());
				}
			}
			modelAndView.addObject("grade_flag",grade_flag);
			modelAndView.addObject("id_flag",id_flag);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return modelAndView;
	}
	
	@RequestMapping("/survey/result")
	public ModelAndView result(HttpServletRequest request, Model model) {
		ModelAndView modelAndView = new ModelAndView(new MappingJacksonJsonView());
		try {
			String id = (String)request.getSession().getAttribute("id");
			int numvalue = dao.numread(id);
			int count = dao.getCount(numvalue);
			
			SurveyItemDTO dto = (SurveyItemDTO) dao.read(id);
			
			int man = dao.gender_man(numvalue);
			int woman = dao.gender_woman(numvalue);
			
			int total = dao.totalCount();
			double man_percent;
			double woman_percent;
			if(woman != 0) {
				woman_percent = Math.round((double)((double)woman/(double)count) * 100);
			}else {
				woman_percent = 0;
			}
			if(man != 0) {
				man_percent = Math.round((double)((double)man/(double)count) * 100);
			}else {
				man_percent = 0;
			}
			
			double percent = Math.round((double)((double)count/(double)total) * 100);
			
			modelAndView.addObject("woman_percent",woman_percent);
			modelAndView.addObject("man_percent",man_percent);
			modelAndView.addObject("content",dto.getContent());
			modelAndView.addObject("count",count);
			modelAndView.addObject("total",total);
			modelAndView.addObject("percent",percent);
			
			
			
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return modelAndView;
	}
	
		
	
	

}
