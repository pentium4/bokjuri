package lionsclubs.com.MM2.MM2_2.MM2_18;

import java.util.List;
import java.util.Map;

import lionsclubs.com.MM2.MM2_2.MM2_18.MM2_18VO;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_18DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_2.MM2_18.";

	public MM2_18VO MM2_18(MM2_18VO vo){
		return (MM2_18VO)selectByPk(commonId + "MM2_18", vo);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> List(MM2_18VO vo) throws Exception {
		return list(commonId + "List", vo);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> paymentSum(MM2_18VO vo) throws Exception {
		return (Map<String, Object>)selectByPk(commonId + "paymentSum", vo);
	} 
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> headInfo(MM2_18VO vo) throws Exception {
		return list(commonId + "headInfo", vo);
	}
}
