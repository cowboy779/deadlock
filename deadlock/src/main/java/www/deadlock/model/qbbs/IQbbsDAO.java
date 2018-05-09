package www.deadlock.model.qbbs;

import deadlock.DAOSTDInter;

public interface IQbbsDAO extends DAOSTDInter {
	
	public void upcount(int qnum);
	
}
