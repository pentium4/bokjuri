package lionsclubs.com.MM3.MM3_9.MM3_39;

import java.util.List;
import java.util.Map;

public interface MM3_39Service {

	/**
	 * 행사별 공적점수 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> MM3_39(MM3_39VO vo) throws Exception;
	
	/**
	 * 행사별 공적점수 합계
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> sum(MM3_39VO vo) throws Exception;
	
	/**
	 * 행사코드리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_39VO> listEvent(MM3_39VO vo) throws Exception ;
}
