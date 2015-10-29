package lionsclubs.com.MM3.MM3_6.MM3_30;

import java.util.List;

public interface MM3_30Service {

	public List<MM3_30VO> List(MM3_30VO vo) throws Exception ;
	
	public Integer Update(MM3_30VO vo) throws Exception;
	
	public MM3_30VO detail(MM3_30VO vo) throws Exception;
}
