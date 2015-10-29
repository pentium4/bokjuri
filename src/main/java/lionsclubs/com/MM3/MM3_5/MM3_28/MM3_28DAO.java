package lionsclubs.com.MM3.MM3_5.MM3_28;

import java.util.List;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import org.springframework.stereotype.Repository;

@Repository
public class MM3_28DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_5.MM3_28.";
	
	@SuppressWarnings("unchecked")
	public List<MM3_28VO_DATA> selectList(MM3_28VO_PARAM vo) throws Exception {
		return (List<MM3_28VO_DATA>)list(commonId + "selectList", vo);
    } 
	
	public Integer mergeData(MM3_28VO_DATA vo) throws Exception{
		return update(commonId + "mergeData", vo);
    }
}
