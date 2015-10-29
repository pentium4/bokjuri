package lionsclubs.com.cmm.web.member;

import lionsclubs.com.cmm.pagging.Page;
import lionsclubs.com.login.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MemberServiceImpl extends AbstractServiceImpl implements MemberService{

	@Autowired
	private MemberDAO dao;

	/**
	 * 회원리스트
	 */
	@Override
	public Page memberList(MemberVO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setAuthMemberNo(user.getId());
		
		return dao.memberList(vo);
	}
	
	/**
	 * 검색유지 회원번호를 저장한다.
	 */
	@Override
	public void saveMemberNo(MemberVO vo) throws Exception {
		
		MemberVO byMemberNoOrganCode = dao.byMemberNoOrganCode(vo);
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		user.setSearchId(vo.getMemberNo());
		user.setSearchAssociationCode(byMemberNoOrganCode.getAssociationCode());
		user.setSearchComplexCode(byMemberNoOrganCode.getComplexCode());
		user.setSearchDistrictCode(byMemberNoOrganCode.getDistrictCode());
		user.setSearchClubCode(byMemberNoOrganCode.getClubCode());		
	}
}
