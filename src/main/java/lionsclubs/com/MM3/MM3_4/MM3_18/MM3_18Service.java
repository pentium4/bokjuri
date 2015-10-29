package lionsclubs.com.MM3.MM3_4.MM3_18;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MM3_18Service {

	/**
	 * 입주클럽관리비 부과
	 * @param vo
	 * @return
	 */
	public List<MM3_18VO> selectList(MM3_18VO vo) throws Exception;
	
	/**
	 * 클럽 제의무금 부과 엑셀업로드
	 * @param vo
	 * @param inputStream
	 * @return
	 * @throws Exception
	 */
	public String excelUpload(MM3_18VO vo, HttpServletRequest request) throws Exception;
	
	/**
	 * 엑셀템플릿 다운로드
	 * @param modelMap
	 * @throws Exception
	 */
	public Map<String, Object> excelTemplateDownload(MM3_18VO vo, Map<String, Object> modelMap) throws Exception;
	
	/**
	 * 입주클럽관리비부과 합계
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_18VO expensesSum(MM3_18VO vo) throws Exception;
}
