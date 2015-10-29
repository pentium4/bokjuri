package lionsclubs.com.MM1.MM1_1.MM1_04;

import java.util.List;

public interface MM1_04Service {

	public List<MM1_04VO> List(MM1_04VO vo) throws Exception;
	
	public MM1_04VO Select(MM1_04VO vo) throws Exception;
	
	public void Insert(MM1_04VO vo) throws Exception;
	
	public Integer Update(MM1_04VO vo) throws Exception;
	
	public Integer Delete(MM1_04VO vo) throws Exception;
}
