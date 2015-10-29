package lionsclubs.com.MM4.MM4_1.MM4_01;

import java.util.List;

import lionsclubs.com.MM3.MM3_1.MM3_01.MM3_01VO;


public interface MM4_01Service {

	/**
	 * 복합/연합회 기본정보
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM4_01VO basicInfo(MM4_01VO vo) throws Exception;
	
	/**
	 * 복합/연합회 임원 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM4_01VO> complexList(MM4_01VO vo) throws Exception;

	/**
	 * 임원변동이력내역
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_01VO> officerChangeHistoryList(MM4_01VO vo) throws Exception;	
}
