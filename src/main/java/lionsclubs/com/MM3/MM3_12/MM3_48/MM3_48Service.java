package lionsclubs.com.MM3.MM3_12.MM3_48;

import java.util.List;


public interface MM3_48Service {
	/**
	 * 연간수입실적 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_48VO> MM3_48(MM3_48VO vo) throws Exception;
	
	/**
	 * 연간수입실적 총금액
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_48VO amountSum(MM3_48VO vo) throws Exception;
	
	/**
	 * 연간수입실적 상세
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_48VO objectIncome(MM3_48VO vo) throws Exception;
	
	/**
	 * 연간수입실적 입력 / 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String saveIncome(MM3_48VO vo) throws Exception;
	
	/**
	 * 연간수입실적 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String deleteIncome(MM3_48VO vo) throws Exception;
}
