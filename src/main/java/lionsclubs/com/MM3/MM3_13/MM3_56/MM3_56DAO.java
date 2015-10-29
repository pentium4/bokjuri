package lionsclubs.com.MM3.MM3_13.MM3_56;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_56DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_13.MM3_56.";
	
	@SuppressWarnings("unchecked")
	public List<MM3_56VO> MM3_56(MM3_56VO vo) throws Exception {
		return list(commonId + "MM3_56", vo);
	}

	@SuppressWarnings("unchecked")
	public List<MM3_56VO> listRepOrganHistory(MM3_56VO vo) throws Exception {
		return list(commonId + "listRepOrganHistory", vo);
	}
}
