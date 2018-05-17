package www.deadlock.model.pbbs;


import java.util.List;
import java.util.Map;

import deadlock.DAOSTDInter;

public interface PBbsDAO extends DAOSTDInter {
	
	public boolean passwdCheck(int bnum, String passwd);
	public boolean ycreate(Object dto);
	public boolean yupdate(Object dto);
	public boolean ydelete(Object bnum);
	public List<PBbsDTO> ylist(Map map);
	public PBbsDTO ybDetail(int bnum);
	
}



