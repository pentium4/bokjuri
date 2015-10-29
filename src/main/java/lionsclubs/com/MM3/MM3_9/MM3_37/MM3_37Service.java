package lionsclubs.com.MM3.MM3_9.MM3_37;

import java.util.List;

public interface MM3_37Service {

	/**
	 * 기본 공적점수 정보
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_37VO objectBasicMerit(MM3_37VO vo) throws Exception;
	
	/**
	 * 공적점수 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_37VO> listMerit(MM3_37VO vo) throws Exception;
	
	/**
	 * 공적점수 저장
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String saveMerit(MM3_37VO vo) throws Exception;
}
