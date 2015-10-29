package lionsclubs.com.MM3.MM3_12.MM3_50;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_50DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_12.MM3_50.";

	@SuppressWarnings("unchecked")
	public List<MM3_50VO> MM3_50(MM3_50VO vo) throws Exception {
		return list(commonId + "MM3_50", vo);
	}
	
	public MM3_50VO amountSum(MM3_50VO vo) throws Exception {
		return (MM3_50VO) selectByPk(commonId + "amountSum", vo);
	}
	
	public MM3_50VO objectExpend(MM3_50VO vo) throws Exception {
		return (MM3_50VO) selectByPk(commonId + "objectExpend", vo);
	}
	
	public Boolean insertExpend(MM3_50VO vo) throws Exception {
		insert(commonId + "insertExpend", vo);
		return Boolean.TRUE;
	}
	
	public Integer updateExpend(MM3_50VO vo) throws Exception {
		return update(commonId + "updateExpend", vo);
	}
	
	public Integer deleteExpend(MM3_50VO vo) throws Exception {
		return delete(commonId + "deleteExpend", vo);
	}	
}
