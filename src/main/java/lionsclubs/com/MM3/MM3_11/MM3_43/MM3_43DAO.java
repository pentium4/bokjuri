package lionsclubs.com.MM3.MM3_11.MM3_43;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_43DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_11.MM3_43.";

	@SuppressWarnings("unchecked")
	public List<MM3_43VO> MM3_43(MM3_43VO vo) throws Exception {
		return list(commonId + "MM3_43", vo);
	}
	
	public MM3_43VO amountSum(MM3_43VO vo) throws Exception {
		return (MM3_43VO) selectByPk(commonId + "amountSum", vo);
	}
}
