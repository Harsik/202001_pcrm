package softdb.monitor.service.impl;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.let.cop.smt.sim.service.IndvdlSchdulManageVO;
import softdb.common.service.impl.SoftdbAbstractDAO;

/**
 * 일정관리를 처리하는 Dao Class 구현
 * @since 2009.04.10
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>  수정일      수정자           수정내용 -------    ---
 * -----    --------------------------- 2009.04.10  장동한          최초 생성 2011.05.31
 * JJY           경량환경 커스터마이징버전 생성
 * </pre>
 * @author 조재영
 * @version 1.0
 * @created 09-6-2011 오전 10:08:07
 */
// @Repository("monitoringDao")
// public class MonitoringDao extends SoftdbAbstractDAO {
public class MonitoringDao {

    /**
	 * 일정 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return List
	 * @throws Exception
	 */
	public List<?> selectMonitoringList(Map<?, ?> map) throws Exception{
		// return list("Monitoring.selectMonitoringList", map);
		return null;
	}

}
