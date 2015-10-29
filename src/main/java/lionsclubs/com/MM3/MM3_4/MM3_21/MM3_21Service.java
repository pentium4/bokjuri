package lionsclubs.com.MM3.MM3_4.MM3_21;

import java.util.List;

public interface MM3_21Service {
	public List<MM3_21VO> selectList(MM3_21VO vo) throws Exception;
	
	public MM3_21VO expensesSum(MM3_21VO vo) throws Exception;
	
	/**
	 * 클럽납부금 정산여부 상세
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_21VO objectPaymentSettle(MM3_21VO vo) throws Exception;
	
	/**
	 * 정산처리
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String confirm(MM3_21VO vo) throws Exception;
	
	/**
	 * 정산취소
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String confirmCancel(MM3_21VO vo) throws Exception;
	
	/**
	 * 정산확정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String confirmLock(MM3_21VO vo) throws Exception;
}
