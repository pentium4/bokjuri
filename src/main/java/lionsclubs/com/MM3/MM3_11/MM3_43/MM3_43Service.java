package lionsclubs.com.MM3.MM3_11.MM3_43;

import java.util.List;

public interface MM3_43Service {
	/**
	 * 연간수입 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_43VO> MM3_43(MM3_43VO vo) throws Exception;
	
	/**
	 * 연간수입 총금액
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_43VO amountSum(MM3_43VO vo) throws Exception;
}
