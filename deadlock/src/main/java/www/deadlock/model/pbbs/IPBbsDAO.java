package www.deadlock.model.pbbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import www.deadlock.model.ybbs.YBbsDTO;


@Repository
public class IPBbsDAO implements PBbsDAO{


	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	
	@Override
	public boolean passwdCheck(int bnum, String passwd) {
		boolean flag = false;
        int result = 0;
        try {
            // mybatis에 전달할 값이 2개인 경우
            // dto 또는 map으로 전달
        	Map map = new HashMap();
            map.put("bnum", bnum);
            map.put("passwd", passwd);
 
            int cnt = mybatis.selectOne("pbbs.passwdCheck", map);
	     	  if(cnt > 0) {
	     		  flag = true;
	     	  }
	     	  
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
	
	
  
	@Override
	public boolean ycreate(Object dto){
		boolean flag = false;
        int result = 0;
        try {
 
            // insert가 성공하면 affected row가 리턴됨
            // affected rows : insert query의 영향을 받은 레코드의 수
            result = mybatis.insert("pbbs.create", dto);
            if(result>0)flag=true;
        } catch (Exception e) {
            e.printStackTrace();
            
        }
        return flag;
    }

	
	
	@Override
	public List<PBbsDTO> ylist(Map map) {
        List<PBbsDTO> list = null;
        
        try {
            list = mybatis.selectList("pbbs.list",map);
 
            for (PBbsDTO dto : list) {
       
                String content = dto.getContent();
                content = content.replace("\n", "<br>");
                content.replace("  ", "&nbsp;&nbsp;");
                content.replace("<", "&lt");
                content.replace(">", "&gt");
                dto.setContent(content);
            }
 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

	@Override
    public PBbsDTO ybDetail(int bnum) {
    	PBbsDTO dto = null;
        try {
            dto = mybatis.selectOne("pbbs.ybDetail", bnum);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }
	
	@Override
	public boolean ydelete(Object bnum){
    	boolean flag = false; 
        int result = 0;
        try {
       	result = mybatis.delete("pbbs.delete", bnum);
        	if(result>0)flag=true;
        } catch (Exception e) {
 
            e.printStackTrace();
        }
       
        return flag;
    }

	
	@Override
	public boolean yupdate(Object dto){	   
	    boolean flag = false;    
		int result = 0;
		
	        try {
	            result = mybatis.update("pbbs.update", dto);
	            if(result>0)flag=true;
	     
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return flag;
	    }

	@Override
	public int total(Map map){
		int result = 0; 
		try {
		result = mybatis.selectOne("pbbs.total",map);
		 } catch (Exception e) {
	            e.printStackTrace();
	        }
		return result;
	}


	
//	-----------------------------------------필요없음-----------------------------------------
	
	
	
	
	
	@Override
	public boolean create(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public boolean update(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public boolean delete(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public List<YBbsDTO> list(Map map) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public Object read(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
}