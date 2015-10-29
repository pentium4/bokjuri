package lionsclubs.com.MM2.MM2_2.MM2_34;

import java.util.List;
import java.util.Map;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_34DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_2.MM2_34.";

	public MM2_34VO MM2_34(MM2_34VO vo){
		return (MM2_34VO)selectByPk(commonId + "MM2_34", vo);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> List(MM2_34VO vo) throws Exception {
		return list(commonId + "List", vo);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> balanceSum(MM2_34VO vo) throws Exception {
		return (Map<String, Object>)selectByPk(commonId + "balanceSum", vo);
	} 
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> headInfo(MM2_34VO vo) throws Exception {
		return list(commonId + "headInfo", vo);
	}
}
