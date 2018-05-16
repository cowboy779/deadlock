package deadlock;

import java.util.List;
import java.util.Map;

import www.deadlock.model.pbbs.PBbsDTO;
import www.deadlock.model.ybbs.YBbsDTO;
import www.deadlock.model.ybbs.YrecoDTO;

public interface DAOSTDInter {
	
    boolean create(Object dto) throws Exception;
    
	boolean update(Object dto) throws Exception;

	boolean delete(Object pk) throws Exception;

//	List<PBbsDTO> list(Map map);

}