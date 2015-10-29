package lionsclubs.com.MM1.MM1_1.MM1_01;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;

import lionsclubs.com.cmm.web.member.MemberService;
import lionsclubs.com.cmm.web.member.MemberVO;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM1_01ServiceImpl extends AbstractServiceImpl implements MM1_01Service{
	@Autowired private MM1_01DAO dao;
	@Resource private MemberService memberService;
	
	/**
	 * 개인기본사항 조회
	 */
	@Override
	public MM1_01VO MM1_01(MM1_01VO vo) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(StringUtils.isEmpty(vo.getMemberNo())){
			vo.setMemberNo(user.getSearchId());
		} else {
			user.setSearchId(vo.getMemberNo());
			
			MemberVO memverVO = new MemberVO();
			memverVO.setMemberNo(vo.getMemberNo());
			memberService.saveMemberNo(memverVO);
		}
		
		return dao.MM1_01(vo);
	}
	
	/**
	 * 프로필 기본사항 입력
	 */
	@Override
	public String profileInsert(MM1_01VO vo) throws Exception {
		String message = profileInsertProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			default:
				log.debug("입력 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String profileInsertProcess(MM1_01VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		String birth = vo.getBirth().replaceAll("\\.", "");
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat birthFormat = new SimpleDateFormat("yyMMdd");
		String passBirth = birthFormat.format(sd.parse(birth));
		
		ShaPasswordEncoder shaPasswordEncoder = new ShaPasswordEncoder(256);	// 암호화 방식인 sha-256 객체구함
		String shaPassword = shaPasswordEncoder.encodePassword(passBirth, null);	// 사용자의 실제 비밀번호를 sha-256로 암호화함.
		vo.setPassword(shaPassword);	// 암호화된 비밀번호로 셋팅함		
		
		dao.profileInsert(vo);
		
		return "1";
	}
	
	/**
	 * 프로필 기본사항 수정
	 */
	@Override
	public Integer profileUpdate(MM1_01VO vo) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setUpdateName(user.getId());
		
		return dao.profileUpdate(vo);
	}
	
	@Override
	public List<MM1_01VO> recommMemberList(MM1_01VO vo) throws Exception {
		return dao.recommMemberList(vo);
	}
	
	/**
	 * 생년월일 동일자 조회
	 */
	@Override
	public List<MM1_01VO> birthPopup(MM1_01VO vo) throws Exception {
		return dao.duplicate(vo);
	}
	
	/**
	 * 중복체크
	 */
	@Override
	public Integer duplicateCheck(MM1_01VO vo) throws Exception {
		return dao.duplicateCheck(vo);
	}
	
	/**
	 * 인사기본 수정
	 */
	@Override
	public Integer hrUpdate(MM1_01VO vo) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setUpdateName(user.getId());
		
		return dao.hrUpdate(vo);
	}
	
	/**
	 * 이전/다음 MemberNo
	 */
	@Override
	public MM1_01VO memberNo(MM1_01VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setAuthMemberNo(user.getId());
		
		return dao.memberNo(vo);
	}
}
