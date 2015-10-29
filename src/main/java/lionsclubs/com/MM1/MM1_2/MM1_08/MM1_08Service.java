package lionsclubs.com.MM1.MM1_2.MM1_08;

import java.util.List;

public interface MM1_08Service {
	/**
	 * 회비납부현황 리스트
	 * @return
	 * @throws Exception
	 */
	public List<MM1_08VO> selectList(MM1_08VO vo) throws Exception;
	
	/**
	 * 납부금 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM1_08VO> listPayment(MM1_08VO vo) throws Exception;	
}
