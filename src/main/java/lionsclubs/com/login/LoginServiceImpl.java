package lionsclubs.com.login;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.EgovUserDetailsService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class LoginServiceImpl extends AbstractServiceImpl implements LoginService{
	@Autowired private LoginDAO dao;
	 @Resource private EgovUserDetailsService egovUserDetailsService;
	
	@Override
	public Boolean sessionChange(LoginVO vo) throws Exception {
		// 로그인된 사용자
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(isAuthenticated){
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			user.setSessionChangeVO(dao.sessionChange(vo));
		}
		
		return Boolean.TRUE;
	}
	
	@Override
	public Boolean sessionChangeLogout() throws Exception {
		LoginVO user = (LoginVO)egovUserDetailsService.getAuthenticatedUser();
		user.setSessionChangeVO(null);
		
		return Boolean.TRUE;
	}
	
	@Override
	public LoginVO actionLogin(LoginVO vo) throws Exception {
		return dao.sessionChange(vo);
	}
}
