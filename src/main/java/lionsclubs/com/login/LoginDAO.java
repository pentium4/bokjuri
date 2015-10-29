package lionsclubs.com.login;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.login.";

	public LoginVO sessionChange(LoginVO vo) throws Exception {
        return (LoginVO) selectByPk(commonId + "sessionChange", vo);
    }
}
