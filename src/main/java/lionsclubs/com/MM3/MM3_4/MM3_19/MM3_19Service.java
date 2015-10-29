package lionsclubs.com.MM3.MM3_4.MM3_19;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MM3_19Service {

	public List<Map<String, Object>> selectList(MM3_19VO vo) throws Exception;
	
	/**
	 * 엑셀템플릿 다운로드
	 * @param modelMap
	 * @throws Exception
	 */
	public Map<String, Object> excelTemplateDownload(MM3_19VO vo, Map<String, Object> modelMap) throws Exception;
	
	public List<CODE_INFO> getCodeList(MM3_19VO vo) throws Exception;
	
	/**
	 * 클럽 제의무금 부과 엑셀업로드
	 * @param vo
	 * @param inputStream
	 * @return
	 * @throws Exception
	 */
	public String excelUpload(MM3_19VO vo, HttpServletRequest request) throws Exception;
}
