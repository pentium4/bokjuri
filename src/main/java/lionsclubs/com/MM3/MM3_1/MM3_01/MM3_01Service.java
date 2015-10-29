package lionsclubs.com.MM3.MM3_1.MM3_01;

import java.util.List;

public interface MM3_01Service {

	/**
	 * 지구기본정보
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_01VO basicInfo(MM3_01VO vo) throws Exception;
	
	/**
	 * 임원변동이력내역
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_01VO> officerChangeHistoryList(MM3_01VO vo) throws Exception;
	
	/**
	 * 지구임원조회
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_01VO> districtMemberList(MM3_01VO vo) throws Exception;
	
}
