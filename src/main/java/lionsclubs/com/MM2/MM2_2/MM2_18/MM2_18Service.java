package lionsclubs.com.MM2.MM2_2.MM2_18;

import java.util.List;
import java.util.Map;
import lionsclubs.com.MM2.MM2_2.MM2_18.MM2_18VO;

public interface MM2_18Service {
	public MM2_18VO MM2_18(MM2_18VO vo) throws Exception;

	public List<Map<String, Object>> List(MM2_18VO vo) throws Exception;

	public Map<String, Object> paymentSum(MM2_18VO vo) throws Exception;
	
	public List<Map<String, Object>> headInfo(MM2_18VO vo) throws Exception;

}
