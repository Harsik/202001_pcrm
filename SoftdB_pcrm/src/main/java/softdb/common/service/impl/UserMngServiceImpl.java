package softdb.common.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import softdb.common.mappers.Om001;
import softdb.common.mappers.Or002;
import softdb.common.service.UserMngService;

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
@Service("userMngService")
public class UserMngServiceImpl extends EgovAbstractServiceImpl implements UserMngService{

	/*@Resource(name="monitoringDao")
	private MonitoringDao dao;*/
	
	/*@Resource(name="mainMapper")
	private MainMapper mapper;
	*/
	
	@Resource(name = "om001")
	private Om001 om001Mapper;
	
	@Resource(name = "or002")
	private Or002 or002Mapper;


	@Override
	public List<?> selectUserList(Map map) throws Exception {
		return om001Mapper.selectUserList(map);
	}
	
	@Override
	public List jqUuserList(Map params) throws Exception {
		System.out.println(">>> refined params : " + params);
		System.out.println(">>> page : " + params.get("page"));
		return om001Mapper.selectList(params);
	}
	
	@Override
	public int om001Update(Map params) throws Exception {
		return om001Mapper.update(params);
	}
	
	@Override
	public int om001Insert(Map params) throws Exception {
		return om001Mapper.insert(params);
	}

	@Override
	public int or002AuthUpdate(Map params) throws Exception {
		return or002Mapper.userAuthUpdate(params);
	}
}
