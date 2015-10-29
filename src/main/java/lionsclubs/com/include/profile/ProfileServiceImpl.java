package lionsclubs.com.include.profile;

import javax.annotation.Resource;

import lionsclubs.com.cmm.web.member.MemberService;
import lionsclubs.com.cmm.web.member.MemberVO;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class ProfileServiceImpl extends AbstractServiceImpl implements ProfileService{
	@Autowired private ProfileDAO dao;
	@Resource private MemberService memberService;
	
	/**
	 * 현재 개인기본사항을 가져온다.
	 */
	@Override
	public ProfileVO profile(ProfileVO vo) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getSearchMemberNo())){
			vo.setSearchMemberNo(user.getSearchId());
		} else {
			user.setSearchId(vo.getSearchMemberNo());
			
			MemberVO memverVO = new MemberVO();
			memverVO.setMemberNo(vo.getSearchMemberNo());
			memberService.saveMemberNo(memverVO);
		}
		
		ProfileVO pvo = dao.profile(vo);
		ProfileVO mvo = dao.memberNo(vo);
		
		if(mvo != null){
			pvo.setPrevMemberNo(mvo.getPrevMemberNo());
			pvo.setNextMemberNo(mvo.getNextMemberNo());
		}
		
		return pvo;
	}
}
