package lionsclubs.com.MM3.MM3_13.MM3_56;

import java.util.List;


public interface MM3_56Service {
	/**
	 * 간사명단 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_56VO> MM3_56(MM3_56VO vo) throws Exception;
	
	/**
	 * 조직별 간사명단 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_56VO> listRepOrganHistory(MM3_56VO vo) throws Exception;
	
}
