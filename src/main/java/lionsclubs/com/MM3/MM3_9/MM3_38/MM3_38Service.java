package lionsclubs.com.MM3.MM3_9.MM3_38;

import java.util.List;

public interface MM3_38Service {

	/**
	 * 공적점수 조회
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_38VO> MM3_38(MM3_38VO vo) throws Exception;
	
	/**
	 * 공적점수 	
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Long sum(MM3_38VO vo) throws Exception;
}
