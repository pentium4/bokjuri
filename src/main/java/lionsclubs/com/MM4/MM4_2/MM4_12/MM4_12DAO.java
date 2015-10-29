package lionsclubs.com.MM4.MM4_2.MM4_12;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import lionsclubs.com.cmm.commoncode.CommonCodeVO;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

@Repository
public class MM4_12DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM4.MM4_2.MM4_12.";

	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectList(MM4_12VO_PARAM vo) {
		return (List<Map<String, Object>>)list(commonId + "selectList", vo);
	}

}
