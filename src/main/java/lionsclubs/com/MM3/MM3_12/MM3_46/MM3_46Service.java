package lionsclubs.com.MM3.MM3_12.MM3_46;

import java.util.List;
import java.util.Map;

import lionsclubs.com.MM3.MM3_13.MM3_54.MM3_54VO;
import lionsclubs.com.cmm.pagging.Page;


public interface MM3_46Service {
	/**
	 * 납부 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Page MM3_46(MM3_46VO vo) throws Exception;
	
	/**
	 * 부과/납부 총금액
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_46VO sum(MM3_46VO vo) throws Exception;
	
	/**
	 * 부과 상세
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_46VO objectImpost(MM3_46VO vo) throws Exception;
	
	/**1
	 * 납부 상세
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_46VO objectPayment(MM3_46VO vo) throws Exception;
	
	/**
	 * 납부 입력/수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String savePayment(MM3_46VO vo) throws Exception;
	
	/**
	 * 납부 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer deletePayment(MM3_46VO vo) throws Exception;
	
	/**
	 * 납부금 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_46VO> listPayment(MM3_46VO vo) throws Exception;
	
	/**
	 * 엑셀 다운로드
	 * @param vo
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> excelDownload(MM3_46VO vo, Map<String, Object> modelMap) throws Exception;
	
	/**
	 * 회기별 재무총장 정보
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_46VO objectTreasurer(MM3_46VO vo) throws Exception;
}
