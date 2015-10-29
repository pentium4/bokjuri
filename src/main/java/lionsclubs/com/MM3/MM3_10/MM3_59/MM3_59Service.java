package lionsclubs.com.MM3.MM3_10.MM3_59;

import java.util.List;
import java.util.Map;


public interface MM3_59Service {
	/**
	 * 국제회비 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_59VO> MM3_59(MM3_59VO vo) throws Exception;
	
	/**
	 * 국제회비 합계
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_59VO sum(MM3_59VO vo) throws Exception;
	
	/**
	 * 엑셀 다운로드
	 * @param vo
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> excelDownload(MM3_59VO vo, Map<String, Object> modelMap) throws Exception;	
}
