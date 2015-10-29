package lionsclubs.com.MM3.MM3_11.MM3_40;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_40DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_11.MM3_40.";
	
	@SuppressWarnings("unchecked")
	public List<MM3_40VO> MM3_40(MM3_40VO vo) throws Exception {
		return list(commonId + "MM3_40", vo);
	}
	
	public MM3_40VO amountSum(MM3_40VO vo) throws Exception {
		return (MM3_40VO) selectByPk(commonId + "amountSum", vo);
	}
	
	public MM3_40VO objectIncome(MM3_40VO vo) throws Exception {
		return (MM3_40VO) selectByPk(commonId + "objectIncome", vo);
	}
	
	public Boolean insertIncome(MM3_40VO vo) throws Exception {
		insert(commonId + "insertIncome", vo);
		return Boolean.TRUE;
	}
	
	public Integer updateIncome(MM3_40VO vo) throws Exception {
		return update(commonId + "updateIncome", vo);
	}
	
	public Integer deleteIncome(MM3_40VO vo) throws Exception {
		return delete(commonId + "deleteIncome", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<MM3_40VO> listClassItem(MM3_40VO vo) throws Exception {
		return list(commonId + "listClassItem", vo);
	}
	
	public Integer dupCheck(MM3_40VO vo) throws Exception {
		return (Integer) selectByPk(commonId + "dupCheck", vo);
	}
	
	public Integer dupDelete(MM3_40VO vo) throws Exception {
		return delete(commonId + "dupDelete", vo);
	}
}
