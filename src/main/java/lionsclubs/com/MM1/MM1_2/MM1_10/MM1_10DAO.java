package lionsclubs.com.MM1.MM1_2.MM1_10;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM1_10DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM1.MM1_2.MM1_10.";
	
	/**
	 * 경조사 리스트
	 * @param adbkVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM1_10VO> MM1_10(MM1_10VO vo) throws Exception {
		return list(commonId + "MM1_10", vo);
    }
}
