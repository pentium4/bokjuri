package lionsclubs.com.MM4.MM4_2.MM4_13;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

@Repository
public class MM4_13DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM4.MM4_2.MM4_13.";

	@SuppressWarnings("unchecked")
	public List<HashMap<String,Object>> selectData(MM4_13VO_PARAM vo) {
		return (List<HashMap<String,Object>>)this.list(commonId + "selectData", vo);
	}
	
}
