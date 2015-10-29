package lionsclubs.com.MM3.MM3_11.MM3_42;

import java.util.List;


public interface MM3_42Service {
	/**
	 * 연간수입/지출실적 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_42VO> MM3_42(MM3_42VO vo) throws Exception;
	
	/**
	 * 연간수입/지출실적 총금액
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_42VO amountSum(MM3_42VO vo) throws Exception;

	/**
	 * 정산상세
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_42VO objectDistrictCalculate(MM3_42VO vo) throws Exception;
	
	/**
	 * 정산처리
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String districtCalculateConfirm(MM3_42VO vo) throws Exception;
	
	/**
	 * 정산처리 취소
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String districtCalculateConfirmCancel(MM3_42VO vo) throws Exception;
	
	/**
	 * 정산처리 확정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String districtCalculateConfirmLock(MM3_42VO vo) throws Exception;

	/**
	 * 정산처리 확정취소
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String districtCalculateConfirmLockCancel(MM3_42VO vo) throws Exception;

}
