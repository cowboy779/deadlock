package www.deadlock.model.ybbs;

import java.util.List;
import java.util.Map;

import deadlock.DAOSTDInter;
import www.deadlock.model.pbbs.PBbsDTO;

public interface IYrecoDAO extends DAOSTDInter {
	public List<PBbsDTO> ylist(Map map);
	public PBbsDTO ybDetail(int bnum);
	public boolean ydelete(Object bnum);
	public boolean yupdate(Object dto);
	public boolean ycreate(Object dto);
	public int passwdCheck(int bnum, String passwd);
}
