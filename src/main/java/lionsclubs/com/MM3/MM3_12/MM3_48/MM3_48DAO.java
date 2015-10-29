package lionsclubs.com.MM3.MM3_12.MM3_48;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_48DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_12.MM3_48.";

	@SuppressWarnings("unchecked")
	public List<MM3_48VO> MM3_48(MM3_48VO vo) throws Exception {
		return list(commonId + "MM3_48", vo);
	}
	
	public MM3_48VO amountSum(MM3_48VO vo) throws Exception {
		return (MM3_48VO) selectByPk(commonId + "amountSum", vo);
	}
	
	public MM3_48VO objectIncome(MM3_48VO vo) throws Exception {
		return (MM3_48VO) selectByPk(commonId + "objectIncome", vo);
	}
	
	public Boolean insertIncome(MM3_48VO vo) throws Exception {
		insert(commonId + "insertIncome", vo);
		return Boolean.TRUE;
	}
	
	public Integer updateIncome(MM3_48VO vo) throws Exception {
		return update(commonId + "updateIncome", vo);
	}
	
	public Integer deleteIncome(MM3_48VO vo) throws Exception {
		return delete(commonId + "deleteIncome", vo);
	}
}
