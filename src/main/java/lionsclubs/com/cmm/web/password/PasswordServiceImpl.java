package lionsclubs.com.cmm.web.password;

import lionsclubs.com.login.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class PasswordServiceImpl extends AbstractServiceImpl implements PasswordService{
	@Autowired private PasswordDAO dao;
	
	@Override
	public String pwUpdate(PasswordVO vo) throws Exception {
			int message = pwUpdateProcess(vo);
			String sMessage = null;
			switch(message){
				case 90: 
			    	log.debug("현재 패스워드가 일치하지 않습니다.");
			    	sMessage = "현재 패스워드가 일치하지 않습니다.";
		    	break;
				case 91: 
			    	log.debug("패스워드 변경 오류 입니다.");
			    	sMessage = "패스워드 변경 오류 입니다.";
		    	break;
				default: 
					log.debug("비밀번호 변경 완료.");
					sMessage = "0";
				break;
		   }
			
		   log.debug(message);
		   return sMessage;
	}

	public Integer pwUpdateProcess(PasswordVO vo) throws Exception {
		
		int errorCode = 91;
		ShaPasswordEncoder shaPasswordEncoder = new ShaPasswordEncoder(256);	// 암호화 방식인 sha-256 객체구함
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setMemberNo(user.getId());
		
		String currentPassword = shaPasswordEncoder.encodePassword(vo.getCurrentPassword(), null);	// 사용자의 실제 비밀번호를 sha-256로 암호화함.
		vo.setCurrentPassword(currentPassword);
		if(dao.pwCheck(vo) == 0){
			return 90;
		}

		String newPassword = shaPasswordEncoder.encodePassword(vo.getNewPassword(), null);	// 사용자의 실제 비밀번호를 sha-256로 암호화함.
		vo.setNewPassword(newPassword);
		if(dao.pwUpdate(vo) == 1){
			return 0;
		}
		
		return errorCode;
	}
	
}
