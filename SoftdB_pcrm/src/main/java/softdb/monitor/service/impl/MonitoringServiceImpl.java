package softdb.monitor.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import softdb.monitor.mappers.Ch001;
import softdb.monitor.mappers.MainMapper;
import softdb.monitor.service.MonitoringService;

/**
 * 일정관리를 처리하는 ServiceImpl Class 구현
 * @since 2009.04.10
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>  수정일      수정자           수정내용 -------    ---
 * -----    --------------------------- 2009.04.10  장동한          최초 생성 2011.05.31
 * JJY           경량환경 커스터마이징버전 생성
 * </pre>
 * @author 조재영
 * @version 1.0
 * @created 09-6-2011 오전 10:08:05
 */
@Service("monitoringService")
public class MonitoringServiceImpl extends EgovAbstractServiceImpl implements MonitoringService{

	@Resource(name="mainMapper")
	private MainMapper main;
	
	@Resource(name="ch001")
	private Ch001 ch001;


    /**
	 * 메인페이지/일정관리조회
	 * @param map - 조회할 정보가 담긴 map
	 * @return List
	 * @throws Exception
	 */
	@Override
	public List<?> selectMonitoringList(Map map) throws Exception{
		return main.selectSampleList(map);
	}

	@Override
	public List<?> selectMainChartList(Map map) throws Exception {
		return main.selectMainChartList(map);
	}
	
	@Override
	public List selectRtCounseltList(Map map) throws Exception {
		return ch001.counsellist(map);
	}
	
	//hhs codeList
	@Override
	public List selectCodeList(Map map) throws Exception {
		return main.selectCodeList(map);
	}
	
	@Override
	public List selectCtgList(Map map) throws Exception {
		return main.selectCtgList(map);
	}
	
}
