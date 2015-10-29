package lionsclubs.com.MM3.MM3_13.MM3_54;

import java.util.List;
import java.util.Map;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_54DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_13.MM3_54.";
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> headInfo(MM3_54VO vo) throws Exception {
		return list(commonId + "headInfo", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> MM3_54(MM3_54VO vo) throws Exception {
		return list(commonId + "MM3_54", vo);
	}	
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> sum(MM3_54VO vo) throws Exception {
		return (Map<String, Object>)selectByPk(commonId + "sum", vo);
	} 	
	
	/**
	 * 간사정보 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM3_54VO> listSecretaryInfo(MM3_54VO vo) throws Exception {
		return list(commonId + "listSecretaryInfo", vo);
	}
	
	/**
	 * 간사급여 코드 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM3_54VO> listSecretaryPaymentCode(MM3_54VO vo) throws Exception {
		return list(commonId + "listSecretaryPaymentCode", vo);
	}

	/**
	 * 간사급여 코드 그룹 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM3_54VO> listSecretaryPaymentGroupCode(MM3_54VO vo) throws Exception {
		return list(commonId + "listSecretaryPaymentGroupCode", vo);
	}
	
	/**
	 * 급여구분 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM3_54VO> listPaymentKind(MM3_54VO vo) throws Exception {
		return list(commonId + "listPaymentKind", vo);
	}
	
	public Boolean insertSecretaryInfo(MM3_54VO vo) throws Exception {
		insert(commonId + "insertSecretaryInfo", vo);
		return Boolean.TRUE;
	}

	public Boolean insertSecretaryPay(MM3_54VO vo) throws Exception {
		insert(commonId + "insertSecretaryPay", vo);
		return Boolean.TRUE;
	}

	public Integer deleteSecretaryInfo(MM3_54VO vo) throws Exception {
		return delete(commonId + "deleteSecretaryInfo", vo);
	}

	public Integer deleteSecretaryPay(MM3_54VO vo) throws Exception {
		return delete(commonId + "deleteSecretaryPay", vo);
	}
	
	/**
	 * 성명 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM3_54VO> listMemberNo(MM3_54VO vo) throws Exception {
		return list(commonId + "listMemberNo", vo);
	}	
}
