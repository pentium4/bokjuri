package lionsclubs.com.MM3.MM3_12.MM3_53;

import java.util.List;
import java.util.Map;

public interface MM3_53Service {
	public MM3_53VO MM3_53(MM3_53VO vo) throws Exception;

	public List<Map<String, Object>> List(MM3_53VO vo) throws Exception;

	public Map<String, Object> paymentSum(MM3_53VO vo) throws Exception;
	
	public List<Map<String, Object>> headInfo(MM3_53VO vo) throws Exception;

}
