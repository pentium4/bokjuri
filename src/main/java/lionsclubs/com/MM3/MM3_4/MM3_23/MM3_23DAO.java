package lionsclubs.com.MM3.MM3_4.MM3_23;

import java.util.List;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import org.springframework.stereotype.Repository;

@Repository
public class MM3_23DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_4.MM3_23.";
	
	public List<MM3_23VO> List(MM3_23VO vo) throws Exception{
		return list(commonId + "List", vo);
	}
}
