package www.deadlock.model.nbbs;

import java.util.Map;

import deadlock.DAOSTDInter;

public interface INBbsDAO extends DAOSTDInter {
// Nbbs에 추가할 메소드 
	public void upViewcnt(int nnum);
	
	public boolean passwdCheck(Map map);
}
