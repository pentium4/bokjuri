package lionsclubs.com.MM2.MM2_3.MM2_23;

import java.util.List;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import org.springframework.stereotype.Repository;

@Repository
public class MM2_23DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_3.MM2_23.";

	@SuppressWarnings("unchecked")
	public List<MM2_23VO_DATA> selectList(MM2_23VO vo) throws Exception {
		return (List<MM2_23VO_DATA>)list(commonId + "selectList", vo);
	}

	public MM2_23VO_DATA selectSum(MM2_23VO vo) throws Exception {
		MM2_23VO_DATA result = (MM2_23VO_DATA)selectByPk(commonId + "selectSum", vo);
		if(result == null) result = new MM2_23VO_DATA();
		return result;
	} 
}
