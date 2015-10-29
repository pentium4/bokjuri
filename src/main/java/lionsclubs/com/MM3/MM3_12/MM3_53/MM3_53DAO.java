package lionsclubs.com.MM3.MM3_12.MM3_53;

import java.util.List;
import java.util.Map;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_53DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_12.MM3_53.";

	public MM3_53VO MM3_53(MM3_53VO vo){
		return (MM3_53VO)selectByPk(commonId + "MM3_53", vo);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> List(MM3_53VO vo) throws Exception {
		return list(commonId + "List", vo);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> paymentSum(MM3_53VO vo) throws Exception {
		return (Map<String, Object>)selectByPk(commonId + "paymentSum", vo);
	} 
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> headInfo(MM3_53VO vo) throws Exception {
		return list(commonId + "headInfo", vo);
	}
}
