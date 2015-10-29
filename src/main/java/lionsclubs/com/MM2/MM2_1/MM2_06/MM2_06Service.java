package lionsclubs.com.MM2.MM2_1.MM2_06;

import java.util.List;

public interface MM2_06Service {

	public List<MM2_06VO> List(MM2_06VO vo) throws Exception;
	
	public MM2_06VO paymentSum(MM2_06VO vo) throws Exception;
}
