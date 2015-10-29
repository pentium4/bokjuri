package lionsclubs.com.cmm.web.password;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class PasswordDAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.cmm.web.password.";
	
	public Integer pwCheck(PasswordVO vo) {
		return (Integer) selectByPk(commonId + "pwCheck", vo);
		
	}
	
	public Integer pwUpdate(PasswordVO vo) {
		return update(commonId + "pwUpdate", vo);
	}
}
