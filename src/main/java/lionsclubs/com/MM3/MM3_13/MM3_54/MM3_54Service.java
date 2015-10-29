package lionsclubs.com.MM3.MM3_13.MM3_54;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


public interface MM3_54Service {

	/**
	 * 급여지급 타이틀 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> headInfo(MM3_54VO vo) throws Exception;
	
	/**
	 * 급여지급 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> MM3_54(MM3_54VO vo) throws Exception;
	
	/**
	 * 급여지급 합계
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> sum(MM3_54VO vo) throws Exception;
	
	/**
	 * 엑셀 다운로드
	 * @param vo
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> excelDownload(MM3_54VO vo, Map<String, Object> modelMap) throws Exception;	

	/**
	 * 엑셀업로드
	 * @param vo
	 * @param inputStream
	 * @return
	 * @throws Exception
	 */
	public String excelUpload(MM3_54VO vo, HttpServletRequest request) throws Exception;
	
	/**
	 * 급여삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Boolean deleteSecretary(MM3_54VO vo) throws Exception;
	
	/**
	 * 이름 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_54VO> listMemberNo(MM3_54VO vo) throws Exception;
}
