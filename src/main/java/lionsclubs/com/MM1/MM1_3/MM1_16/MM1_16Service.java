package lionsclubs.com.MM1.MM1_3.MM1_16;

import java.util.List;

public interface MM1_16Service {

	/**
	 * 전입회원 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM1_16VO> MM1_16(MM1_16VO vo) throws Exception;
	
	/**
	 * 전입회원 입력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String insertMoveinMember(MM1_16VO vo) throws Exception;
	
	/**
	 * 전입회원 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String deleteMoveinMember(MM1_16VO vo) throws Exception;
	
	/**
	 * 전입회원 승인
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String updateApprove(MM1_16VO vo) throws Exception;
	
	/**
	 * 전입회원 승인취소
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String updateApproveCancel(MM1_16VO vo) throws Exception;
	
	/**
	 * 전입회원 처리
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String updateTreatment(MM1_16VO vo) throws Exception;
	
	/**
	 * 전입회원 처리취소
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String updateTreatmentCancel(MM1_16VO vo) throws Exception;		
}
