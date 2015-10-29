package egovframework.com.cmm.util;

import java.util.List;

import lionsclubs.com.login.LoginVO;
import egovframework.com.cmm.service.EgovUserDetailsService;
import egovframework.rte.fdl.string.EgovObjectUtil;

/**
 * EgovUserDetails Helper 클래스
 *
 * @author sjyoon
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    -------------    ----------------------
 *   2009.03.10  sjyoon         최초 생성
 *   2011.07.01	 서준식          interface 생성후 상세 로직의 분리
 * </pre>
 */

public class EgovUserDetailsHelper {

	static EgovUserDetailsService egovUserDetailsService;

	public EgovUserDetailsService getEgovUserDetailsService() {
		return egovUserDetailsService;
	}

	public void setEgovUserDetailsService(EgovUserDetailsService egovUserDetailsService) {
		EgovUserDetailsHelper.egovUserDetailsService = egovUserDetailsService;
	}

	/**
	 * 인증된 사용자객체를 VO형식으로 가져온다.
	 * @return Object - 사용자 ValueObject
	 */
	public static Object getAuthenticatedUser() {
		LoginVO loginVO = (LoginVO)egovUserDetailsService.getAuthenticatedUser();
		
		if(loginVO == null){
			return loginVO;
		} else {
			if(EgovObjectUtil.isNull(loginVO.getSessionChangeVO())){
				return loginVO;
			} else {
				
				LoginVO sessionVO = (LoginVO)loginVO.getSessionChangeVO();
				sessionVO.setIsSessionChange(true);
				
				return sessionVO;
			}
		}
	}

	/**
	 * 인증된 사용자의 권한 정보를 가져온다.
	 *
	 * @return List - 사용자 권한정보 목록
	 */
	public static List<String> getAuthorities() {
		return egovUserDetailsService.getAuthorities();
	}

	/**
	 * 인증된 사용자 여부를 체크한다.
	 * @return Boolean - 인증된 사용자 여부(TRUE / FALSE)
	 */
	public static Boolean isAuthenticated() {
		return egovUserDetailsService.isAuthenticated();
	}
}
