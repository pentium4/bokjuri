package lionsclubs.com.MM3.MM3_12.MM3_45;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.cmm.pagging.Page;


public interface MM3_45Service {

	/**
	 * 부과/납부 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Page MM3_45(MM3_45VO vo) throws Exception;
	
	/**
	 * 부과/납부 총금액
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_45VO sum(MM3_45VO vo) throws Exception;
	
	/**
	 * 부과 상세
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_45VO objectImpost(MM3_45VO vo) throws Exception;
	
	/**
	 * 부과 입력/수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String saveImpost(MM3_45VO vo) throws Exception;
	
	/**
	 * 부과 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer deleteImpost(MM3_45VO vo) throws Exception;

	/**
	 * 엑셀 다운로드
	 * @param vo
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> excelDownload(MM3_45VO vo, Map<String, Object> modelMap) throws Exception;
	
	/**
	 * 엑셀 업로드
	 * @param vo
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public String excelUpload(MM3_45VO vo, HttpServletRequest request) throws Exception;

}
