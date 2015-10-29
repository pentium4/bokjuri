package lionsclubs.com.MM1.MM1_1.MM1_07;

import java.util.List;


public interface MM1_07Service {
	public List<MM1_07VO> List(MM1_07VO vo) throws Exception;
	
	public List<MM1_07VO> ListEvent(MM1_07VO vo) throws Exception;
	
	public void Insert(MM1_07VO vo) throws Exception;
	
	public void Update(MM1_07VO vo) throws Exception;
}
