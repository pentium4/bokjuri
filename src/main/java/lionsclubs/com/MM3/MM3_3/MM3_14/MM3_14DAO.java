package lionsclubs.com.MM3.MM3_3.MM3_14;

import java.util.List;
import java.util.Map;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_14DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_3.MM3_14.";

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectList(MM3_14VO vo) {
		return (List<Map<String, Object>>) list(commonId + "selectList", vo);
	} 
}
