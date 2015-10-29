package lionsclubs.com.MM2.MM2_2.MM2_12;

import java.util.List;

public interface MM2_12Service {
	/**
	 * 수입항목별금액조회 리스트
	 * @return
	 * @throws Exception
	 */
	public List<MM2_12VO> MM2_12(MM2_12VO vo) throws Exception;
	public MM2_12VO sum(MM2_12VO vo) throws Exception;
}
