package lionsclubs.com.MM3.MM3_12.MM3_52;

import java.util.List;


public interface MM3_52Service {
	/**
	 * 클럽별 수지현황 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_52VO> MM3_52(MM3_52VO vo) throws Exception;
	
	/**
	 * 총합계
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_52VO sum(MM3_52VO vo) throws Exception;
}
