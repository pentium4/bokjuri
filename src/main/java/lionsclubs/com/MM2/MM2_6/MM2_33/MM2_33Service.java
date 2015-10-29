package lionsclubs.com.MM2.MM2_6.MM2_33;

import java.util.List;
import java.util.Map;

public interface MM2_33Service {

	/**
	 * 수지계산서(수입내역) 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM2_33VO> MM2_33(MM2_33VO vo) throws Exception;	
	
	/**
	 * 엑셀 다운로드
	 * @param vo
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> excelDownload(MM2_33VO vo, Map<String, Object> modelMap) throws Exception;
}
