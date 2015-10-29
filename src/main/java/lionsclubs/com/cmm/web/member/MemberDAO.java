package lionsclubs.com.cmm.web.member;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import lionsclubs.com.cmm.pagging.Page;

import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.cmm.web.member.";
	
	/**
	 * 회원 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Page memberList(MemberVO vo) throws Exception {
		return listWithPaging(commonId + "memberList", vo);
	}
	
	public MemberVO byMemberNoOrganCode(MemberVO vo) throws Exception {
		return (MemberVO) selectByPk(commonId + "byMemberNoOrganCode", vo);
	}
	
}
