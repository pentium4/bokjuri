package lionsclubs.com.MM3.MM3_4.MM3_22_A;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_22_ADAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_4.MM3_22_A.";

	@SuppressWarnings("unchecked")
	public List<MM3_22_AVO> select(MM3_22_AVO vo) throws Exception {
		return list(commonId + "select", vo);
	}
	
	public Boolean insertClubPayment(MM3_22_AVO vo) throws Exception {
		insert(commonId + "insertClubPayment", vo);
		return true;
	}
	
	public Integer updateClubPayment(MM3_22_AVO vo) throws Exception {
		return update(commonId + "updateClubPayment", vo);
	}

	public Integer deleteClubPayment(MM3_22_AVO vo) throws Exception {
		return delete(commonId + "deleteClubPayment", vo);
	}
	
	public MM3_22_AVO objectClubPayment(MM3_22_AVO vo) throws Exception {
		return (MM3_22_AVO) selectByPk(commonId + "objectClubPayment", vo);
	}
	
	/**
	 * 동일한 납일일자 카운트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer dupPaymentDateCnt(MM3_22_AVO vo) throws Exception {
		return (Integer) selectByPk(commonId + "dupPaymentDateCnt", vo);
	}
	
	/**
	 * 잔액조회
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer objectBalance(MM3_22_AVO vo) throws Exception {
		return (Integer) selectByPk(commonId + "objectBalance", vo);
	}
}
