package www.deadlock.sts.game;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import www.deadlock.model.member.IMemberDAO;

@Controller
public class GameController {
	
	@Autowired
	private IMemberDAO dao;
	
	//********************************나슬이누나
	@RequestMapping("/dl_game/start")
	public String start() {
		
		return "/dl_game/start";
	}
	@RequestMapping("/game/lnsi_game/start")
	public String start1() {
		
		return "/game/lnsi_game/start";
	}
	@RequestMapping("/dl_game/memo")
	public String memo() {
		return "/dl_game/memo";
	}
	@RequestMapping("/game/lnsi_game/memo")
	public String memo1() {
		return "/game/lnsi_game/memo";
	}
	@RequestMapping("/dl_game/game")
	public String game() {
		return "/dl_game/game";
	}
	@RequestMapping("/game/lnsi_game/game")
	public String game_lnsi() {
		return "/game/lnsi_game/game";
	}
	@RequestMapping("/dl_game/game2")
	public String game2() {
		return "/dl_game/game2";
	}
	@RequestMapping("/game/lnsi_game/game2")
	public String game2_lnsi() {
		return "/game/lnsi_game/game2";
	}
	@RequestMapping("/dl_game/game3")
	public String game3() {
		return "/dl_game/game3";
	}
	@RequestMapping("/game/lnsi_game/game3")
	public String game3_lnsi() {
		return "/game/lnsi_game/game3";
	}
	@RequestMapping("/dl_game/game4")
	public String game4() {
		return "/dl_game/game4";
	}
	@RequestMapping("/game/lnsi_game/game4")
	public String game4_lnsi() {
		return "/game/lnsi_game/game4";
	}
	@RequestMapping("/dl_game/game5")
	public String game5() {
		return "/dl_game/game5";
	}
	@RequestMapping("/game/lnsi_game/game5")
	public String game5_lnsi(HttpServletRequest request) {
		boolean flag = false;
		String id = (String)request.getSession().getAttribute("id");
		try {
			if(dao.getGrade(id).equals("n")) {
					dao.updateGrade_S(id);
					flag = true;
					request.setAttribute("flag", flag);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/game/lnsi_game/game5";
	}
	//********************************나슬이누나
	//********************************영부형
	@RequestMapping("/game/yb_game/game")
	public String game_yb() {
		return "/game/yb_game/game";
	}
	@RequestMapping("/game/yb_game/game2")
	public String game_yb1() {
		return "/game/yb_game/game2";
	}
	@RequestMapping("/game/yb_game/game3")
	public String game_yb2() {
		return "/game/yb_game/game3";
	}
	@RequestMapping("/game/yb_game/game4")
	public String game_yb3(HttpServletRequest request) {
		boolean flag = false;
		String id = (String)request.getSession().getAttribute("id");
		try {
			if(dao.getGrade(id).equals("n")) {
					dao.updateGrade_S(id);
					flag = true;
					request.setAttribute("flag", flag);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/game/yb_game/game4";
	}
	@RequestMapping("/game/yb_game/memo")
	public String game_yb_memo() {
		return "/game/yb_game/memo";
	}
	//********************************영부형
	//********************************정훈이형
	@RequestMapping("/game/oh_game/ex1")
	public String game_oh_game1() {
		return "/game/oh_game/ex1";
	}
	@RequestMapping("/game/oh_game/ex2")
	public String game_oh_game2() {
		return "/game/oh_game/ex2";
	}
	@RequestMapping("/game/oh_game/ex3")
	public String game_oh_game3() {
		return "/game/oh_game/ex3";
	}
	@RequestMapping("/game/oh_game/ex4")
	public String game_oh_game4(HttpServletRequest request) {
		boolean flag = false;
		String id = (String)request.getSession().getAttribute("id");
		try {
			if(dao.getGrade(id).equals("n")) {
					dao.updateGrade_S(id);
					flag = true;
					request.setAttribute("flag", flag);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/game/oh_game/ex4";
	}
	//********************************정훈이형
	//********************************한정환
	@RequestMapping("/game/han_game/m_Psychological_testing")
	public String m_Psychological_testing(HttpServletRequest request) {
		
		return "/game/han_game/m_Psychological_testing";
	}
	//********************************한정환
	//********************************안서현
	@RequestMapping("/game/ash_game/doremiGame")
	public String doremiGame(HttpServletRequest request) {
		
		return "/game/ash_game/doremiGame";
	}
	//********************************안서현
	
}
