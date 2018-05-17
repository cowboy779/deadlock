package www.deadlock.model.qbbs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QbbsMgr {
	
	@Autowired
	private IQbbsDAO qdao;
	
	@Autowired
	private IQrecoDAO qrdao;
	
	public boolean delete(int qnum) throws Exception{
		boolean flag=false;
		qrdao.qdelete(qnum);//댓글들 삭제
		
		//댓글이 달려있는 게시글 삭제
		
		if(qdao.delete(qnum)) flag=true;
		
		return flag;
	}
	
}
