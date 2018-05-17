package deadlock;

import java.util.List;
import java.util.Map;

import www.deadlock.model.pbbs.PBbsDTO;
import www.deadlock.model.ybbs.YBbsDTO;

public interface DAOSTDInter {
	
    boolean create(Object dto) throws Exception;
	boolean update(Object dto) throws Exception;
	boolean delete(Object pk) throws Exception;
	public int total(Map map);
	public Object read(Object pk) throws Exception;
	public List<YBbsDTO> list(Map map);
	

}