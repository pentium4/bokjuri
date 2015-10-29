package lionsclubs.com.SM1.SM1_2.SM1_06;

import java.util.List;


public interface SM1_06Service {

	public List<SM1_06VO> SM1_06(SM1_06VO vo) throws Exception;
	
	public SM1_06VO SM1_06_Object(SM1_06VO vo) throws Exception;
	
	public void SM1_06_InputInsert(SM1_06VO vo) throws Exception;
	
	public Integer SM1_06_EditUpdate(SM1_06VO vo) throws Exception;
	
	public Integer SM1_06_Delete(SM1_06VO vo) throws Exception;
	
}
