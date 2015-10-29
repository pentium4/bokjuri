package lionsclubs.com.MM3.MM3_12.MM3_50;

import java.util.List;


public interface MM3_50Service {
	/**
	 * 연간지출실적 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_50VO> MM3_50(MM3_50VO vo) throws Exception;
	
	/**
	 * 연간지출실적 총금액
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_50VO amountSum(MM3_50VO vo) throws Exception;
	
	/**
	 * 연간지출실적 상세
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_50VO objectExpend(MM3_50VO vo) throws Exception;
	
	/**
	 * 연간지출실적 입력 / 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String saveExpend(MM3_50VO vo) throws Exception;
	
	/**
	 * 연간지출실적 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String deleteExpend(MM3_50VO vo) throws Exception;
}
