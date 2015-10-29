package lionsclubs.com.MM3.MM3_11.MM3_41;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_41DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_11.MM3_41.";
	
	@SuppressWarnings("unchecked")
	public List<MM3_41VO> MM3_41(MM3_41VO vo) throws Exception {
		return list(commonId + "MM3_41", vo);
	}
	
	public MM3_41VO amountSum(MM3_41VO vo) throws Exception {
		return (MM3_41VO) selectByPk(commonId + "amountSum", vo);
	}
	
	public MM3_41VO objectExpend(MM3_41VO vo) throws Exception {
		return (MM3_41VO) selectByPk(commonId + "objectExpend", vo);
	}
	
	public Boolean insertExpend(MM3_41VO vo) throws Exception {
		insert(commonId + "insertExpend", vo);
		return Boolean.TRUE;
	}
	
	public Integer updateExpend(MM3_41VO vo) throws Exception {
		return update(commonId + "updateExpend", vo);
	}
	
	public Integer deleteExpend(MM3_41VO vo) throws Exception {
		return delete(commonId + "deleteExpend", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<MM3_41VO> listClassItem(MM3_41VO vo) throws Exception {
		return list(commonId + "listClassItem", vo);
	}	
	
	public Integer dupCheck(MM3_41VO vo) throws Exception {
		return (Integer) selectByPk(commonId + "dupCheck", vo);
	}
	
	public Integer dupDelete(MM3_41VO vo) throws Exception {
		return delete(commonId + "dupDelete", vo);
	}	
}
