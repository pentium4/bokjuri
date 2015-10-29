package lionsclubs.com.MM3.MM3_4.MM3_22;

import java.util.List;

public interface MM3_22Service {

	/**
	 * 클럽납부금일괄입력 조회
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_22VO> MM3_22(MM3_22VO vo) throws Exception;
	
	/**
	 * 클럽납부금 일괄입력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String payment(MM3_22VO vo) throws Exception;
	
	/**
	 * 지구납부금 입력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Boolean insertDistrictItemPayment(MM3_22VO vo) throws Exception;
	
	/**
	 * 클럽납부금 상세 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_22VO> listClubPayment(MM3_22VO vo) throws Exception;
}
