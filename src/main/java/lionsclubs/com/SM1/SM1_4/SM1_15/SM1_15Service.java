package lionsclubs.com.SM1.SM1_4.SM1_15;

import java.util.List;

public interface SM1_15Service {
	public List<SM1_15VO> SM1_15(SM1_15VO vo) throws Exception;
	
	/**
	 * 정산처리
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String calculateConfirm(SM1_15VO vo) throws Exception;
	
	/**
	 * 정산처리 취소
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer calculateConfirmCancel(SM1_15VO vo) throws Exception;
	
	/**
	 * 정산확정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer calculateConfirmLock(SM1_15VO vo) throws Exception;
	
	/**
	 * 정산확정 취소
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String calculateConfirmLockCancel(SM1_15VO vo) throws Exception;
}
