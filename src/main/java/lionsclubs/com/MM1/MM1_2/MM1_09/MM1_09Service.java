package lionsclubs.com.MM1.MM1_2.MM1_09;

import java.util.List;
import java.util.Map;

public interface MM1_09Service {
	public List<MM1_09VO> List(MM1_09VO vo) throws Exception;
	public MM1_09VO SelectPaymentSum(MM1_09VO vo) throws Exception;
	public MM1_09VO Select(MM1_09VO vo) throws Exception;
	public String insert(MM1_09VO vo) throws Exception;	
	public String update(MM1_09VO vo) throws Exception;
	public String delete(MM1_09VO vo) throws Exception;
	
	/**
	 * select list 리스트
	 * @return
	 * @throws Exception
	 */
	public List<MM1_09VO> SelectClassList(Map<String, Object> map) throws Exception;
	public List<MM1_09VO> SelectDetailList(Map<String, Object> map) throws Exception;
	public String SelectDetailType(Map<String, Object> map) throws Exception;
	
	/**
	 * 조직코드 가져오기
	 */
	public String SelectOrganCode(MM1_09VO vo) throws Exception;
	
	/**
	 * 개인 회비 납부금 가져오기
	 */
	public Integer SelectMemberPay(Map<String, Object> map) throws Exception;
	/**
	 * 최근 정산일자 가져오기
	 */
	public String SelectCDate(Map<String, Object> map) throws Exception;
	
	/**
	 * 납부금 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM1_09VO> listPayment(MM1_09VO vo) throws Exception;
	
	/**
	 * 납부처리
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String payment(MM1_09VO vo) throws Exception;
	
	/**
	 * 납부금 상세내역
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM1_09VO objectPayment(MM1_09VO vo) throws Exception;
	
	/**
	 * 회기별 재무총장 정보
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM1_09VO objectTreasurer(MM1_09VO vo) throws Exception;
}
