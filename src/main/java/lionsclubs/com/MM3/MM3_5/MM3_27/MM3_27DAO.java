package lionsclubs.com.MM3.MM3_5.MM3_27;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_27DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_5.MM3_27.";
	
	@SuppressWarnings("unchecked")
	public List<MM3_27VO_DATA> selectList(MM3_27VO_PARAM vo) throws Exception {
		return (List<MM3_27VO_DATA>)list(commonId + "selectList", vo);
    } 
	
	public Integer mergeData(MM3_27VO_DATA vo) throws Exception{
		return update(commonId + "mergeData", vo);
    }
	
	public MM3_27VO_DATA SelectDate(MM3_27VO_DATA vo) throws Exception {
		return (MM3_27VO_DATA)selectByPk(commonId + "SelectDate", vo);
    }
}
