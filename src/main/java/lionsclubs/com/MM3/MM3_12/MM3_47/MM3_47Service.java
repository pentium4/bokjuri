package lionsclubs.com.MM3.MM3_12.MM3_47;

import java.util.List;


public interface MM3_47Service {

	/**
	 * 수입항목별금액조회 리스트
	 * @return
	 * @throws Exception
	 */
	public List<MM3_47VO> MM3_47(MM3_47VO vo) throws Exception;
	
	public MM3_47VO sum(MM3_47VO vo) throws Exception;
}
