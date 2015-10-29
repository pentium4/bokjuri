package lionsclubs.com.MM2.MM2_1.MM2_01;

import java.util.List;

public interface MM2_01Service {

	public Integer selectMM2_01TotalCount(MM2_01VO vo) throws Exception;
	
	public MM2_01VO basicInfo(MM2_01VO vo) throws Exception;
	
	/**
	 * 임원변동이력내역
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM2_01VO> officerChangeHistoryList(MM2_01VO vo) throws Exception;	
	
	public List<MM2_01VO> clubHistory(MM2_01VO vo) throws Exception;
	
	public List<MM2_01VO> clubOrgan(MM2_01VO vo) throws Exception;
	
	public List<MM2_01VO> clubCross(MM2_01VO vo) throws Exception;
}
