package lionsclubs.com.MM1.MM1_3.MM1_14;

import java.util.List;

import lionsclubs.com.cmm.pagging.Page;

public interface MM1_14Service {
	/**
	 * 신입회원 기본사항 조회
	 * @param vo
	 * @throws Exception
	 */
	public MM1_14VO MM1_14(MM1_14VO vo) throws Exception;
	
	/**
	 * 신입회원 입회대상 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM1_14VO> listNewMember(MM1_14VO vo) throws Exception;
	
	/**
	 * 프로필 기본사항 입력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String insertProfile(MM1_14VO vo) throws Exception;
	
	
	/**
	 * 프로필 기본사항 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer updateProfile(MM1_14VO vo) throws Exception;
	
	/**
	 * 현재/이전/다음 registerNo
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM1_14VO registerNo(MM1_14VO vo) throws Exception;

	/**
	 * 신입회원 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Page listRegister(MM1_14VO vo) throws Exception;
	
	/**
	 * 인사기본 수정
	 * @param vo
	 * @throws Exception
	 */
	public Integer hrUpdate(MM1_14VO vo) throws Exception;

	/**
	 * 신입회원 입회삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String delete(MM1_14VO vo) throws Exception;
	
	/**
	 * 신입회원 승인
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String updateApprove(MM1_14VO vo) throws Exception;
	
	/**
	 * 신입회원 승인취소
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String updateApproveCancel(MM1_14VO vo) throws Exception;
	
	/**
	 * 신입회원 처리
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String updateTreatment(MM1_14VO vo) throws Exception;
	
	/**
	 * 신입회원 처리취소
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String updateTreatmentCancel(MM1_14VO vo) throws Exception;
	
}
