package lionsclubs.com.MM3.MM3_10.MM3_36;

import java.util.List;
import java.util.Map;

public interface MM3_36Service {
	
	/**
	 * 1. 클럽별 회원수
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_36VO> clubMemberShip(MM3_36VO vo) throws Exception;	

	/**
	 * 2. 봉사실적현황
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_36VO> serviceStatus(MM3_36VO vo) throws Exception;	

	/**
	 * 2. LCIF기금 납부현황
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_36VO> lcifStatus(MM3_36VO vo) throws Exception;	
	
	/**
	 * 3.봉사내역
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_36VO> serviceHistory(MM3_36VO vo) throws Exception;	

	/**
	 * 월말보고 집계표(클럽수 증감 현황, 회원수 증감 현황)
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_36VO reportSummary(MM3_36VO vo) throws Exception;	
	
	/**
	 * L.C.I.F 기금현황
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_36VO lcifStatusSummary(MM3_36VO vo) throws Exception;
	
	/**
	 * 엑셀 다운로드
	 * @param vo
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> excelDownload(MM3_36VO vo, Map<String, Object> modelMap) throws Exception;
}
