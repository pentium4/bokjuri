package lionsclubs.com.MM2.MM2_6.MM2_32;

import java.util.List;
import java.util.Map;

public interface MM2_32Service {

	/**
	 * 수지계산서 요약정보
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM2_32VO summary(MM2_32VO vo) throws Exception;	

	/**
	 * 수지계산서(수입내역) 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM2_32VO> MM2_32(MM2_32VO vo) throws Exception;	
	
	/**
	 * 엑셀 다운로드
	 * @param vo
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> excelDownload(MM2_32VO vo, Map<String, Object> modelMap) throws Exception;
}
