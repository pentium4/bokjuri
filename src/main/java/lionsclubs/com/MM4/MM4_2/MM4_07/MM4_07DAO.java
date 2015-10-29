package lionsclubs.com.MM4.MM4_2.MM4_07;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

@Repository
public class MM4_07DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM4.MM4_2.MM4_07.";

	/*
	 * 목록 조회
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectList(MM4_07VO_PARAM vo) throws Exception {
		return (List<Map<String,Object>>)list(commonId + "selectList", vo);
	}

	
	
}
