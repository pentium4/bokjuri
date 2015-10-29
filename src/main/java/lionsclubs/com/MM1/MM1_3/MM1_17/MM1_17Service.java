package lionsclubs.com.MM1.MM1_3.MM1_17;

import java.util.List;

public interface MM1_17Service {
	/**
	 * 재입회원 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM1_17VO> MM1_17(MM1_17VO vo) throws Exception;
	
	/**
	 * 재입회원 대상 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM1_17VO> listReinductMember(MM1_17VO vo) throws Exception;
	
	/**
	 * 재입 회원 입력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String insertReinductMember(MM1_17VO vo) throws Exception;

	/**
	 * 재입 회원 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String deleteReinductMember(MM1_17VO vo) throws Exception;
	
	/**
	 * 전입회원 승인
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String updateApprove(MM1_17VO vo) throws Exception;
	
	/**
	 * 전입회원 승인취소
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String updateApproveCancel(MM1_17VO vo) throws Exception;
	
	/**
	 * 전입회원 처리
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String updateTreatment(MM1_17VO vo) throws Exception;
	
	/**
	 * 전입회원 처리취소
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String updateTreatmentCancel(MM1_17VO vo) throws Exception;			
}
