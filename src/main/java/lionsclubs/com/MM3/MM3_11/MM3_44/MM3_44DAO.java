package lionsclubs.com.MM3.MM3_11.MM3_44;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_44DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_11.MM3_44.";

	@SuppressWarnings("unchecked")
	public List<MM3_44VO> MM3_44(MM3_44VO vo) throws Exception {
		return list(commonId + "MM3_44", vo);
	}
	
	public MM3_44VO amountSum(MM3_44VO vo) throws Exception {
		return (MM3_44VO) selectByPk(commonId + "amountSum", vo);
	}
}
