package softdb.monitor.service;

import java.util.List;
import java.util.Map;

public interface CounselService {
	public List selectUserList(Map map) throws Exception;
	
	public List selectCodeList(Map map) throws Exception;
	
	public List selectCtgCodeList(Map map) throws Exception;
	
	public List selectCategoryObjList(Map map) throws Exception;
	
	public List selectCounselList(Map map) throws Exception;
}
