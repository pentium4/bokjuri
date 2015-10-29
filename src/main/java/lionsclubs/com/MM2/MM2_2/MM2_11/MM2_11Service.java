package lionsclubs.com.MM2.MM2_2.MM2_11;

import java.util.List;

public interface MM2_11Service {
	/**
	 * 회비및납부금조회 리스트
	 * @return
	 * @throws Exception
	 */
	public List<MM2_11VO> selectList(MM2_11VO vo) throws Exception;
	
	public MM2_11VO paymentSum(MM2_11VO vo) throws Exception;
	
	public String cDate(MM2_11VO vo) throws Exception;
}
