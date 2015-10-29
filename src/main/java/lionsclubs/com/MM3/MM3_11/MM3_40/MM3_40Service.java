package lionsclubs.com.MM3.MM3_11.MM3_40;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


public interface MM3_40Service {
	/**
	 * 연간수입예산 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_40VO> MM3_40(MM3_40VO vo) throws Exception;
	
	/**
	 * 연간수입예산 총금액
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_40VO amountSum(MM3_40VO vo) throws Exception;
	
	/**
	 * 연간수입예산 상세
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_40VO objectIncome(MM3_40VO vo) throws Exception;
	
	/**
	 * 연간수입예산 입력 / 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String saveIncome(MM3_40VO vo) throws Exception;
	
	/**
	 * 연간수입예산 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String deleteIncome(MM3_40VO vo) throws Exception;
	
	/**
	 * 엑셀 다운로드
	 * @param vo
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> excelDownload(MM3_40VO vo, Map<String, Object> modelMap) throws Exception;
	
	/**
	 * 엑셀 업로드
	 * @param vo
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public String excelUpload(MM3_40VO vo, HttpServletRequest request) throws Exception;
}
