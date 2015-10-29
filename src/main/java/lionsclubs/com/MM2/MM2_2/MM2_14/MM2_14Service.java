package lionsclubs.com.MM2.MM2_2.MM2_14;

import java.util.List;

public interface MM2_14Service {

	/**
	 * 전회원 부과/납부금 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM2_14VO> MM2_14(MM2_14VO vo) throws Exception;
	
	/**
	 * 전회원 부과/납부금 합계
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM2_14VO total(MM2_14VO vo) throws Exception;
	
	/**
	 * 전회원 부과 대상 회원리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM2_14VO> listImpostMember(MM2_14VO vo) throws Exception;
	
	/**
	 * 전회원 부과금 입력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String insertImpost(MM2_14VO vo) throws Exception;

	/**
	 * 전회원 부과금 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String updateImpost(MM2_14VO vo) throws Exception;

	
	/**
	 * 전회원 부과금 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String deleteImpost(MM2_14VO vo) throws Exception;
	
	/**
	 * 전회원 부과금 상세
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM2_14VO detail(MM2_14VO vo) throws Exception;
	
	/**
	 * 전회원 납부 대상 회원리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM2_14VO> listPaymentMember(MM2_14VO vo) throws Exception;	
	
	/**
	 * 전회원 납부 처리
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String payment(MM2_14VO vo) throws Exception;
}
