package lionsclubs.com.MM3.MM3_7.MM3_34;

import java.util.List;

public interface MM3_34Service {
	/**
	 * 임원분담금 현황 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_34VO> List(MM3_34VO vo) throws Exception;
	
	/**
	 * 임원분담금 현황 합계
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_34VO sum(MM3_34VO vo) throws Exception;
}
