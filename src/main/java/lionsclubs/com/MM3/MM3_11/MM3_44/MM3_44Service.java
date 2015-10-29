package lionsclubs.com.MM3.MM3_11.MM3_44;

import java.util.List;


public interface MM3_44Service {
	/**
	 * 연간지출 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_44VO> MM3_44(MM3_44VO vo) throws Exception;
	
	/**
	 * 연간지출 총금액
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_44VO amountSum(MM3_44VO vo) throws Exception;
}
