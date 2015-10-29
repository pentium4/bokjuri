package lionsclubs.com.MM1.MM1_3.MM1_15;

import java.util.List;

public interface MM1_15Service {
	
	/**
	 * 퇴회회원 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM1_15VO> MM1_15(MM1_15VO vo) throws Exception;
	
	/**
	 * 퇴회회원 대상 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM1_15VO> listRetireMember(MM1_15VO vo) throws Exception;
	
	/**
	 * 퇴회 회원 입력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String insertRetireMember(MM1_15VO vo) throws Exception;

	/**
	 * 퇴회 회원 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String deleteRetireMember(MM1_15VO vo) throws Exception;
	
	/**
	 * 퇴회 회원 승인
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String updateApprove(MM1_15VO vo) throws Exception;
	
	/**
	 * 퇴회 회원 승인취소
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String updateApproveCancel(MM1_15VO vo) throws Exception;
	
	/**
	 * 퇴회 회원 처리
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String updateTreatment(MM1_15VO vo) throws Exception;
	
	/**
	 * 퇴회 회원 처리취소
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String updateTreatmentCancel(MM1_15VO vo) throws Exception;	
}
