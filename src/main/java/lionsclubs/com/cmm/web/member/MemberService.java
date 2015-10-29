package lionsclubs.com.cmm.web.member;

import lionsclubs.com.cmm.pagging.Page;


public interface MemberService {

	/**
	 * 회원 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Page memberList(MemberVO vo) throws Exception;
	
	/**
	 * 검색유지 회원번호를 저장한다.
	 * @param clubCode
	 * @throws Exception
	 */
	public void saveMemberNo(MemberVO vo) throws Exception;		
}
