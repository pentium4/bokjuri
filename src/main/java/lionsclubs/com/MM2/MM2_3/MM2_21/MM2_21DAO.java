package lionsclubs.com.MM2.MM2_3.MM2_21;

import java.util.List;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import org.springframework.stereotype.Repository;

@Repository
public class MM2_21DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_3.MM2_21.";

	@SuppressWarnings("unchecked")
	public List<MM2_21VO_DATA> selectList(MM2_21VO vo) throws Exception {
		return (List<MM2_21VO_DATA>)list(commonId + "selectList", vo);
	}
	
	public MM2_21VO_DATA selectListSum(MM2_21VO vo) throws Exception {
		MM2_21VO_DATA result = (MM2_21VO_DATA)selectByPk(commonId + "selectListSum", vo);
		if(result == null) result = new MM2_21VO_DATA();
		return result;
	} 
}
