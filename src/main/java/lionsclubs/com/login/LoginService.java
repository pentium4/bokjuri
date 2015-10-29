package lionsclubs.com.login;


public interface LoginService {
	public Boolean sessionChange(LoginVO vo) throws Exception;
	
	public Boolean sessionChangeLogout() throws Exception;
	
	public LoginVO actionLogin(LoginVO vo) throws Exception;
}
