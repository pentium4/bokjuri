package lionsclubs.com.MM3.MM3_11.MM3_41;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


public interface MM3_41Service {
	
	/**
	 * 연간지출예산 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_41VO> MM3_41(MM3_41VO vo) throws Exception;
	
	/**
	 * 연간지출예산 총금액
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_41VO amountSum(MM3_41VO vo) throws Exception;
	
	/**
	 * 연간지출예산 상세
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_41VO objectExpend(MM3_41VO vo) throws Exception;
	
	/**
	 * 연간지출예산 입력 / 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String saveExpend(MM3_41VO vo) throws Exception;
	
	/**
	 * 연간지출예산 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String deleteExpend(MM3_41VO vo) throws Exception;
	
	/**
	 * 엑셀 다운로드
	 * @param vo
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> excelDownload(MM3_41VO vo, Map<String, Object> modelMap) throws Exception;
	
	/**
	 * 엑셀 업로드
	 * @param vo
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public String excelUpload(MM3_41VO vo, HttpServletRequest request) throws Exception;
}
