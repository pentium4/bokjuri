package lionsclubs.com.MM3.MM3_5.MM3_26;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class MM3_26DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_5.MM3_26.";
	
	@SuppressWarnings("unchecked")
	public List<MM3_26VO> List(MM3_26VO vo) throws Exception{
		return list(commonId + "List", vo);
	}
}
