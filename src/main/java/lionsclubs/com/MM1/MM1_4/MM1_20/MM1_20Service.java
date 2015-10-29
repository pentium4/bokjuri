package lionsclubs.com.MM1.MM1_4.MM1_20;

import java.util.List;
import java.util.Map;

public interface MM1_20Service {

	/**
	 * 클럽별 회원 입/출 현황 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM1_20VO> MM1_20(MM1_20VO vo) throws Exception;
	
	/**
	 * 엑셀 다운로드
	 * @param vo
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> excelDownload(MM1_20VO vo, Map<String, Object> modelMap) throws Exception;
}
