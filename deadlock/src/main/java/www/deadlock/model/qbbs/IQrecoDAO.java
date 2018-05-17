package www.deadlock.model.qbbs;

import deadlock.DAOSTDInter;

public interface IQrecoDAO extends DAOSTDInter {

	public int qdelete(int qnum) throws Exception;

}
