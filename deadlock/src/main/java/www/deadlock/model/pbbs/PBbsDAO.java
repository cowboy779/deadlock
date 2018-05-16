package www.deadlock.model.pbbs;

import java.util.List;
import java.util.Map;

import deadlock.DAOSTDInter;

public interface PBbsDAO extends DAOSTDInter {
	
	public int passwdCheck(int bnum, String passwd);
	
	public boolean create(Object dto);
	
	public boolean update(Object dto);
	
	public boolean delete(Object bnum);
	
	public List<PBbsDTO> list(Map map);

	public PBbsDTO ybDetail(int bnum);

	public int total(Map map);
}



