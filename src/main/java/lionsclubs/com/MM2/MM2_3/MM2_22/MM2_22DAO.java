package lionsclubs.com.MM2.MM2_3.MM2_22;

import java.util.List;

import lionsclubs.com.MM2.MM2_3.MM2_22.MM2_22VO;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_22DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_3.MM2_22.";

	@SuppressWarnings("unchecked")
	public List<MM2_22VO_DATA> selectList(MM2_22VO vo) throws Exception {
		return (List<MM2_22VO_DATA>)list(commonId + "selectList", vo);
	}
	
	public MM2_22VO_DATA selectSum(MM2_22VO vo) throws Exception {
		MM2_22VO_DATA result = (MM2_22VO_DATA)selectByPk(commonId + "selectSum", vo);
		if(result == null) result = new MM2_22VO_DATA();
		return result;
	} 
	
}
