package lionsclubs.com.SM1.SM1_4.SM1_16;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class SM1_16ServiceImpl extends AbstractServiceImpl implements SM1_16Service{
	@Autowired private SM1_16DAO dao;

	@Override
	public List<SM1_16VO> SM1_16(SM1_16VO vo) throws Exception {
		return dao.SM1_16(vo);
	}
	
	@Override
	public String updatePassword(SM1_16VO vo) throws Exception {
		String message = updatePasswordProcess(vo);
		String sMessage = null;
   
    	/*
    	오류 메세지 정보
    	message = "1";	// 완료
    	*/		
		switch(Integer.parseInt(message)){
			default:
				log.debug("정산 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;		
	}
	
	public String updatePasswordProcess(SM1_16VO vo) throws Exception {
		ShaPasswordEncoder shaPasswordEncoder = new ShaPasswordEncoder(256);	// 암호화 방식인 sha-256 객체구함
		
		for(SM1_16VO pw : vo.getInitArray()){
			String password = shaPasswordEncoder.encodePassword(dao.birth(pw), null);	// 사용자의 실제 비밀번호를 sha-256로 암호화함.
			pw.setPassword(password);
			
			dao.updatePassword(pw);
		}
		
		return "1";
	}
}
