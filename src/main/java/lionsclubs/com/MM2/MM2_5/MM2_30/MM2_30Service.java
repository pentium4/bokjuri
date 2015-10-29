package lionsclubs.com.MM2.MM2_5.MM2_30;

import java.util.List;

public interface MM2_30Service {

	/**
	 * 지구 행사 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM2_30VO> MM2_30(MM2_30VO vo) throws Exception;
	
	/**
	 * 행사총 인원/시간/점수
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM2_30VO total(MM2_30VO vo) throws Exception;	
}
