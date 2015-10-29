package lionsclubs.com.MM4.MM4_2.MM4_15;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

@Repository
public class MM4_15DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM4.MM4_2.MM4_15.";

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectList(MM4_15VO_PARAM vo) {
		return (List<Map<String, Object>>)this.list(commonId + "selectList", vo);
	}

}
