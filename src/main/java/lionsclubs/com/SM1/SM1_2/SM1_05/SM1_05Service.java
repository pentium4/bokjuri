package lionsclubs.com.SM1.SM1_2.SM1_05;

import java.util.List;


public interface SM1_05Service {

	/**
	 * 조직코드이력 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<SM1_05VO> organHistoryList(SM1_05VO vo) throws Exception;
	
}
