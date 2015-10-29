package lionsclubs.com.MM2.MM2_2.MM2_34;

import java.util.List;
import java.util.Map;

public interface MM2_34Service {
	public MM2_34VO MM2_34(MM2_34VO vo) throws Exception;

	public List<Map<String, Object>> List(MM2_34VO vo) throws Exception;

	public Map<String, Object> balanceSum(MM2_34VO vo) throws Exception;
	
	public List<Map<String, Object>> headInfo(MM2_34VO vo) throws Exception;

}
