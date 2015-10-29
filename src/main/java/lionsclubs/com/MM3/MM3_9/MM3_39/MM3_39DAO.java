package lionsclubs.com.MM3.MM3_9.MM3_39;

import java.util.List;
import java.util.Map;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_39DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_9.MM3_39.";
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> MM3_39(MM3_39VO vo) throws Exception {
		return list(commonId + "MM3_39", vo);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> sum(MM3_39VO vo) throws Exception {
		return (Map<String, Object>) selectByPk(commonId + "sum", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<MM3_39VO> listEvent(MM3_39VO vo) throws Exception {
		return list(commonId + "listEvent", vo);
	}
}
