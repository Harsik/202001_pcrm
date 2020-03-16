package softdb.common.mappers;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * sample에 관한 데이터처리 매퍼 클래스
 *
 * @author  표준프레임워크센터
 * @since 2014.01.24
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *          수정일          수정자           수정내용
 *  ----------------    ------------    ---------------------------
 *   2014.01.24        표준프레임워크센터          최초 생성
 *
 * </pre>
 */
@Mapper("om001")
public interface Om001 {

	/**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	Map login(Map map) throws Exception;

	List<?> selectUserList(Map map) throws Exception;
	
	List<?> selectList(Map map) throws Exception;
	
	Map select(Map map)  throws Exception;

	int update(Map params) throws Exception;

	int insert(Map params) throws Exception;


}
