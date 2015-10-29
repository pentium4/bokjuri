package lionsclubs.com.SM1.SM1_3.SM1_09;

import java.util.List;


public interface SM1_09Service {

	public List<SM1_09VO> selectList(SM1_09VO vo) throws Exception;
	
	public void insert(SM1_09VO vo) throws Exception;
	
	public Integer update(SM1_09VO vo) throws Exception;
	
	public Integer delete(SM1_09VO vo) throws Exception;
	
	public List<SM1_09VO> headerMenuList() throws Exception;
	
	public List<SM1_09VO> leftMenuList() throws Exception;
	
	public SM1_09VO menuTitle(String menuId) throws Exception;
	
	public SM1_09VO menuAuthorization(String menuId) throws Exception;
}
