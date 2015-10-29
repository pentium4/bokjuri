package lionsclubs.com.SM1.SM1_2.SM1_07;

import java.util.List;


public interface SM1_07Service {

	public List<SM1_07VO> SM1_07(SM1_07VO vo) throws Exception;
	
	public void SM1_07_InputInsert(SM1_07VO vo) throws Exception;
	
	public Integer SM1_07_EditUpdate(SM1_07VO vo) throws Exception;
	
	public Integer SM1_07_Delete(SM1_07VO vo) throws Exception;
	
	public List<SM1_07VO> selectGroupCode() throws Exception;
}
