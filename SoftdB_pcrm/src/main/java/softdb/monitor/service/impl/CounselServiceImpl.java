package softdb.monitor.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import softdb.monitor.mappers.Ch001;
import softdb.monitor.service.CounselService;

@Service("counselService")
public class CounselServiceImpl implements CounselService {
	
	@Resource(name="ch001")
	private Ch001 ch001;
	
	@Override
	public List selectUserList(Map map) throws Exception {
		return ch001.selectUserList(map);
	}
	
	@Override
	public List selectCodeList(Map map) throws Exception {
		return ch001.selectCodeList(map);
	}
	
	@Override
	public List selectCtgCodeList(Map map) throws Exception {
		return ch001.selectCtgCodeList(map);
	}
	
	@Override
	public List selectCategoryObjList(Map map) throws Exception {
		return ch001.categoryObjList(map);
	}
	
	@Override
	public List selectCounselList(Map map) throws Exception {
		return ch001.counsellist(map);
	}

}
