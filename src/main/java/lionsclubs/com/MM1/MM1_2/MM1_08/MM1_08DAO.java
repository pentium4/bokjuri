package lionsclubs.com.MM1.MM1_2.MM1_08;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM1_08DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM1.MM1_2.MM1_08.";
	
	/**
	 * 회비납부현황 리스트
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM1_08VO> selectList(MM1_08VO vo) throws Exception {
		return list(commonId + "selectList", vo);
	} 
	
	@SuppressWarnings("unchecked")
	public List<MM1_08VO> listPayment(MM1_08VO vo) throws Exception {
		return list(commonId + "listPayment", vo);
	}
}
